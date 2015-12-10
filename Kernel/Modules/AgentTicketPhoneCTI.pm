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

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check all needed objects
    for my $Needed (qw(ParamObject DBObject QueueObject LayoutObject ConfigObject LogObject)) {
        if ( !$Self->{$Needed} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $Needed!" );
        }
    }

    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get call params
    my $CallerID       = $Self->{ParamObject}->GetParam( Param => 'CallerID' );
    my $MSN            = $Self->{ParamObject}->GetParam( Param => 'MSN' );
    my $SelectedScreen = $Self->{ParamObject}->GetParam( Param => 'Screen' ) || '';

    # get route for MSN
    my $Screen         = 'Action=AgentTicketPhone';
    my $CustomerScreen = 'Action=AgentCustomerInformationCenter';

    # if no caller id, redirect to screen
    if ( !$CallerID ) {
        return $Self->{LayoutObject}->Redirect( OP => $Screen );
    }

    if ($MSN) {
        my $MSNMap = $Self->{ConfigObject}->Get('CTI::MSN::Action::Map');
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
    my %CustomerUserList = $Self->{CustomerUserObject}->CustomerSearch(
        Search => $CallerID,
    );
    if ( !%CustomerUserList ) {
        return $Self->{LayoutObject}->Redirect( OP => $Screen );
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

        my %CustomerUserData = $Self->{CustomerUserObject}->CustomerUserDataGet(
            User => $UserID,
        );

        $UserName   = $Self->{LayoutObject}->LinkEncode($UserName);
        $CustomerID = $Self->{LayoutObject}->LinkEncode( $CustomerUserData{UserCustomerID} );

        $Screen = $CustomerScreen;
        $Screen .= ";CustomerID=$CustomerID";
    }
    else {
        # redirect to new screen with selected customer
        $Screen .= ";Subaction=StoreNew;CustomerSelected=1";

        my $CustomerID             = '';
        my $SelectedCustomerUserID = '';
        my $Counter                = 0;
        for my $CustomerUserID ( sort keys %CustomerUserList ) {

            my $UserName = $CustomerUserList{$CustomerUserID};

            my %CustomerUserData = $Self->{CustomerUserObject}->CustomerUserDataGet(
                User => $CustomerUserID,
            );

            # store first to select it
            if ( !$Counter ) {
                $SelectedCustomerUserID = $CustomerUserID;
                $CustomerID             = $CustomerUserData{UserCustomerID};
            }

            $Counter++;

            $Screen .= ";CustomerKey_$Counter=$CustomerUserID;CustomerTicketText_$Counter=$UserName";
        }
        $CustomerID = $Self->{LayoutObject}->LinkEncode($CustomerID);

        $Screen .= ";Subject=;ChallengeToken=$Self->{UserChallengeToken}";
        $Screen .= ";SelectedCustomerUser=$SelectedCustomerUserID;CustomerID=$CustomerID";
        $Screen .= ";CustomerTicketCounterFromCustomer=$Counter;ExpandCustomerName=3";
    }

    return $Self->{LayoutObject}->Redirect( OP => $Screen );
}

1;
