# VERSION:1.1
# --
# Copyright (C) 2012-2021 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Config::Files::Znuny4OTRSCTI;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

use utf8;

sub Load {
    my ( $File, $Self ) = @_;

    # changed config to also use phone number as seach field
    SOURCE:
    for my $Count ( '', 1 .. 10 ) {

        next SOURCE if !$Self->{"CustomerUser$Count"};

        my $Map = $Self->{"CustomerUser$Count"}->{Map};
        next SOURCE if !IsArrayRefWithData($Map);

        ENTRY:
        for my $MapEntry ( @{$Map} ) {
            next ENTRY if $MapEntry->[0] ne 'UserPhone';

            my $PhoneKey = $MapEntry->[2];

            last ENTRY if grep { $PhoneKey eq $_ } @{ $Self->{"CustomerUser$Count"}->{CustomerUserSearchFields} };

            push @{ $Self->{"CustomerUser$Count"}->{CustomerUserSearchFields} }, $PhoneKey;
        }
    }

    return 1;
}

1;
