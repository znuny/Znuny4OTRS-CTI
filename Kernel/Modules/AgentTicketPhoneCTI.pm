# --
# Kernel/Modules/AgentTicketPhoneCTI.pm - CTI support for phone ticket
# Copyright (C) 2012-2015 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentTicketPhoneCTI;

use strict;
use warnings;
use Kernel::System::VariableCheck qw(:all);
use Kernel::System::CustomerUser;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::CustomerUser',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get call params
    my $CallerID       = $ParamObject->GetParam( Param => 'CallerID' );
    my $MSN            = $ParamObject->GetParam( Param => 'MSN' );
    my $SelectedScreen = $ParamObject->GetParam( Param => 'Screen' ) || '';

    # get route for MSN
    my $Screen         = 'Action=AgentTicketPhone';
    my $CustomerScreen = 'Action=AgentCustomerInformationCenter';

    # if no caller id, redirect to screen
    if ( !$CallerID ) {
        return $LayoutObject->Redirect( OP => $Screen );
    }

    if ($MSN) {
        my $MSNMap = $ConfigObject->Get('CTI::MSN::Action::Map');
        if ($MSNMap) {
            my $ScreenMap = '';
            for my $Key ( sort keys %{$MSNMap} ) {

                # set default
                if ( !$Key && !$ScreenMap && $MSNMap->{$Key} ) {
                    $ScreenMap = $MSNMap->{$Key};
                }

                # set new route
                if ( $MSN =~ /$Key/ ) {
                    $ScreenMap = $MSNMap->{$Key};
                }
            }

            # set new screen
            if ($ScreenMap) {
                $Screen = "Action=$ScreenMap";
            }
        }
    }

    # find customer
    my %CustomerUserList = $CustomerUserObject->CustomerSearch(
        Search => $CallerID,
    );
    if ( !%CustomerUserList ) {
        return $LayoutObject->Redirect( OP => $Screen );
    }

    if ( $SelectedScreen eq 'AgentCustomerInformationCenter' ) {

        my $UserID     = '';
        my $UserName   = '';
        my $CustomerID = '';

        for my $KeyCustomerUser ( sort keys %CustomerUserList ) {
            $UserID   = $KeyCustomerUser;
            $UserName = $CustomerUserList{$KeyCustomerUser};
        }

        #get customer data for AgentCustomerInformationCenter

        my %CustomerUserData = $CustomerUserObject->CustomerUserDataGet(
            User => $UserID,
        );

        $UserName   = $LayoutObject->LinkEncode($UserName);
        $CustomerID = $LayoutObject->LinkEncode( $CustomerUserData{UserCustomerID} );

        $Screen = $CustomerScreen;
        $Screen .= ";CustomerID=$CustomerID";
    }
    else {
        # redirect to new screen with selected customer
        $Screen .= ";Subaction=StoreNew;CustomerSelected=1";

        my $UserID                 = '';
        my $UserName               = '';
        my $CustomerID             = '';
        my $SelectedCustomerUserID = '';
        my $Counter                = 0;
        for my $KeyCustomerUser ( sort keys %CustomerUserList ) {

            $UserID   = $KeyCustomerUser;
            $UserName = $CustomerUserList{$KeyCustomerUser};

            # store first to select it
            if ( !$Counter ) {
                $SelectedCustomerUserID = $UserID;
            }

            $Counter++;

            my %CustomerUserData = $CustomerUserObject->CustomerUserDataGet(
                User => $UserID,
            );
            $CustomerID = $LayoutObject->LinkEncode( $CustomerUserData{UserCustomerID} );
            $Screen .= ";CustomerKey_$Counter=$UserID;CustomerID=$CustomerID;CustomerTicketText_$Counter=$UserName";
        }

        $Screen .= ";Subject=;ChallengeToken=$Self->{UserChallengeToken}";
        $Screen .= ";SelectedCustomerUser=$SelectedCustomerUserID";
        $Screen .= ";CustomerTicketCounterFromCustomer=$Counter;ExpandCustomerName=3";
    }

    return $LayoutObject->Redirect( OP => $Screen );
}

1;
