# --
# Kernel/Modules/AgentTicketPhoneCTI.pm - CTI support for phone ticket 
# Copyright (C) 2012 Znuny GmbH, http://znuny.com/
# --
# $Id: $
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

use vars qw($VERSION);
$VERSION = qw($Revision: 1.17 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check all needed objects
    for (qw(ParamObject DBObject QueueObject LayoutObject ConfigObject LogObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    $Self->{CustomerUserObject} = Kernel::System::CustomerUser->new(%Param);

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get call params
    my $CallerID = $Self->{ParamObject}->GetParam( Param => 'CallerID' );
    my $MSN      = $Self->{ParamObject}->GetParam( Param => 'MSN' );

    # get route for MSN
    my $Screen = 'Action=AgentTicketPhone';
    if ($MSN) {
        my $MSNMap = $Self->{ConfigObject}->Get('CTI::MSN::Action::Map');
        if ($MSNMap) {
            my $ScreenMap = '';
            for my $Key (sort keys %{$MSNMap} ) {

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

    # if no caller id, redirect to screen
    if ( !$CallerID ) {
        return $Self->{LayoutObject}->Redirect( OP => "$Screen" );
    }
    
    # find customer
    my %CustomerUserList = $Self->{CustomerUserObject}->CustomerSearch(
        Search => $CallerID,
    );
    if ( !%CustomerUserList ) {
        return $Self->{LayoutObject}->Redirect( OP => "$Screen" );
    }
    my $UserID   = '';
    my $UserName = '';
    for my $KeyCustomerUser ( keys %CustomerUserList ) {
        $UserID   = $KeyCustomerUser;
        $UserName = $CustomerUserList{$KeyCustomerUser};
    }
    $UserName = $Self->{LayoutObject}->LinkEncode($UserName);

    # redirect to new screen with selected customer
    $Screen .= "&Subaction=StoreNew&ExpandCustomerName=1&CustomerTicketCounterFromCustomer=1&CustomerSelected=1";
    $Screen .= "&SelectedCustomerUser=$UserID&CustomerKey_1=$UserID&CustomerTicketText_1=$UserName";
    $Screen .= "&Subject=&ChallengeToken=$Self->{UserChallengeToken}";

    return $Self->{LayoutObject}->Redirect( OP => $Screen );
}

1;
