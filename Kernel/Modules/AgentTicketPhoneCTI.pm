# --
# Copyright (C) 2012 Znuny GmbH, https://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentTicketPhoneCTI;

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);
use Kernel::System::CustomerUser;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::CustomerUser',
    'Kernel::System::Group',
    'Kernel::System::Log',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

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
    my $GroupObject        = $Kernel::OM->Get('Kernel::System::Group');

    # get call params
    my $CallerID       = $ParamObject->GetParam( Param => 'CallerID' );
    my $MSN            = $ParamObject->GetParam( Param => 'MSN' );
    my $SelectedScreen = $ParamObject->GetParam( Param => 'Screen' ) || '';

    # get route for MSN
    my $Action = 'AgentTicketPhone';
    my $Screen = "Action=$Action";

    # redirect to screen if no caller ID or caller ID does not match caller ID regular expression
    my $CallerIDRegEx = $ConfigObject->Get('CTI::CallerIDRegEx');
    if (
        !defined $CallerID
        || (
            defined $CallerIDRegEx
            && $CallerID !~ m{$CallerIDRegEx}
        )
        )
    {
        return $LayoutObject->Redirect( OP => $Screen );
    }

    if ($MSN) {
        my $MSNMap = $ConfigObject->Get('CTI::MSN::Action::Map');
        if ($MSNMap) {
            my $ScreenMap = '';
            KEY:
            for my $Key ( sort keys %{$MSNMap} ) {

                # set default
                if ( !$Key && !$ScreenMap && $MSNMap->{$Key} ) {
                    $ScreenMap = $MSNMap->{$Key};
                }

                next KEY if $MSN !~ /$Key/;

                # set new route
                $ScreenMap = $MSNMap->{$Key};
            }

            # set new screen
            if ($ScreenMap) {
                $Action = $ScreenMap;
                $Screen = "Action=$Action";
            }
        }
    }

    # filter caller id
    $CallerID = $Self->FilterCallerID(
        CallerID => $CallerID,
    );

    # find customer
    my %CustomerUserList = $CustomerUserObject->CustomerSearch(
        Search => $CallerID,
    );
    if ( !%CustomerUserList ) {
        return $LayoutObject->Redirect( OP => $Screen );
    }

    if ( $SelectedScreen eq 'AgentCustomerInformationCenter' ) {
        $Action = $SelectedScreen;

        my $UserID     = '';
        my $UserName   = '';
        my $CustomerID = '';

        # note: used last user
        for my $KeyCustomerUser ( sort keys %CustomerUserList ) {
            $UserID   = $KeyCustomerUser;
            $UserName = $CustomerUserList{$KeyCustomerUser};
        }

        # get customer data for AgentCustomerInformationCenter
        my %CustomerUserData = $CustomerUserObject->CustomerUserDataGet(
            User => $UserID,
        );

        $UserName   = $LayoutObject->LinkEncode($UserName);
        $CustomerID = $LayoutObject->LinkEncode( $CustomerUserData{UserCustomerID} );

        $Screen = 'Action=AgentCustomerInformationCenter';
        $Screen .= ";CustomerID=$CustomerID";
    }
    elsif ( $SelectedScreen eq 'AgentCustomerUserInformationCenter' ) {
        $Action = $SelectedScreen;

        my $CustomerUserID;

        # note: used last user
        for my $KeyCustomerUser ( sort keys %CustomerUserList ) {
            $CustomerUserID = $KeyCustomerUser;
        }

        $CustomerUserID = $LayoutObject->LinkEncode($CustomerUserID);

        $Screen = 'Action=AgentCustomerUserInformationCenter';
        $Screen .= ";CustomerUserID=$CustomerUserID";
    }
    else {
        # redirect to new screen with selected customer
        $Screen .= ";Subaction=StoreNew;CustomerSelected=1";

        my $MaxUsers = $ConfigObject->Get('CTI::MaxUsers');

        my $CustomerID             = '';
        my $SelectedCustomerUserID = '';
        my $Counter                = 0;
        CUSTOMER:
        for my $CustomerUserID ( sort keys %CustomerUserList ) {

            my $UserName = $CustomerUserList{$CustomerUserID};

            my %CustomerUserData = $CustomerUserObject->CustomerUserDataGet(
                User => $CustomerUserID,
            );

            # store first to select it
            if ( !$Counter ) {
                $SelectedCustomerUserID = $CustomerUserID;
                $CustomerID             = $CustomerUserData{UserCustomerID};
            }

            $Counter++;

            $UserName = $LayoutObject->LinkEncode($UserName);
            $Screen .= ";CustomerKey_$Counter=$CustomerUserID;CustomerTicketText_$Counter=$UserName";

            next CUSTOMER if !$MaxUsers;
            next CUSTOMER if $Counter < $MaxUsers;
            last CUSTOMER;
        }
        $CustomerID = $LayoutObject->LinkEncode($CustomerID);

        $Screen .= ";ChallengeToken=$Self->{UserChallengeToken}";
        $Screen .= ";SelectedCustomerUser=$SelectedCustomerUserID;CustomerID=$CustomerID";
        $Screen .= ";CustomerTicketCounterFromCustomer=$Counter;ExpandCustomerName=3";
    }

    my $RedirectURLParameters = $ConfigObject->Get('CTI::RedirectURLParameters') // {};
    if ( IsHashRefWithData( $RedirectURLParameters->{$Action} ) ) {
        my %UserRoles = $GroupObject->PermissionUserRoleGet(
            UserID => $Self->{UserID},
        );
        %UserRoles = reverse %UserRoles;

        # Use URL parameters of first matching role (alphabetically).
        my $DefaultRole = '_DEFAULT_';

        my @RedirectURLParameters;

        # If default role is configured, append it to the end so that it will only be used
        # if a user does not have a matching role.
        my @ConfiguredRoles = grep { $_ ne $DefaultRole } sort keys %{ $RedirectURLParameters->{$Action} };

        # Add pseudo role which will be used if the user does not have a matching role.
        my @ConfiguredDefaultRoles = grep { $_ eq $DefaultRole } %{ $RedirectURLParameters->{$Action} };
        if (@ConfiguredDefaultRoles) {
            push @ConfiguredRoles, $DefaultRole;
        }

        CONFIGUREDROLE:
        for my $ConfiguredRole (@ConfiguredRoles) {
            next CONFIGUREDROLE if !$UserRoles{$ConfiguredRole} && $ConfiguredRole ne $DefaultRole;

            @RedirectURLParameters = map { $_ . '=' . $RedirectURLParameters->{$Action}->{$ConfiguredRole}->{$_} }
                keys %{ $RedirectURLParameters->{$Action}->{$ConfiguredRole} };

            last CONFIGUREDROLE;
        }

        if (@RedirectURLParameters) {
            $Screen .= ';' . ( join ';', @RedirectURLParameters );
        }
    }

    return $LayoutObject->Redirect( OP => $Screen );
}

=head2 FilterCallerID()

This function will filter the caller id based on a regex list.
The result is based on the configuration in:
CTI::FilterCallerRegEx

    my $CallerID = $FrontendObject->FilterCallerID(
        CallerID => '+49 1111',
    );

Returns:

    my $CallerID = '00491111';

=cut

sub FilterCallerID {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(CallerID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $CallerID = $Param{CallerID};

    my %FilterRegEx = %{ $ConfigObject->Get('CTI::FilterCallerRegEx') || {} };

    for my $RegExSearch ( sort keys %FilterRegEx ) {
        my $RegExReplace = $FilterRegEx{$RegExSearch};

        $CallerID =~ s{$RegExSearch}{$RegExReplace}xmsig;

        my %NamedCaptures = %+;

        $CallerID =~ s/\[\*\* \\(\w+) \*\*\]/$NamedCaptures{$1}/xmsg;
    }

    return $CallerID;
}

1;
