# --
# Copyright (C) 2012-2021 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

# get needed objects
my $ConfigObject      = $Kernel::OM->Get('Kernel::Config');
my $FrontendObject    = $Kernel::OM->Get('Kernel::Modules::AgentTicketPhoneCTI');
my $HelperObject      = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

$ConfigObject->{'CTI::FilterCallerRegEx'} = {
    '(?# regex 1)[\(\)]' => '',
    '(?# regex 2)\-'     => '',
    '(?# regex 3)\s*'    => '',
    '(?# regex 4)\+'     => '*',
    '(?# regex 5)(?<dialcode>\*48\d{2})(?<p1>\d{2})(?<p2>\d{2})(?<p3>\d{2})' =>
        '[**\\dialcode**][**\\p3**][**\\p2**][**\\p1**]',
    '(?# regex 6)(?<phone>\*50).*' => '[**\\phone**]11111',
};

my $CallerID = $FrontendObject->FilterCallerID(
    CallerID => '+49 (30) 1111',
);

$Self->Is(
    $CallerID,
    '*49301111',
    'FilterCallerID(+49 (30) 1111)',
);

$CallerID = $FrontendObject->FilterCallerID(
    CallerID => '+48 (30) 112233',
);

$Self->Is(
    $CallerID,
    '*4830332211',
    'FilterCallerID(+48 (30) 112233)',
);

$CallerID = $FrontendObject->FilterCallerID(
    CallerID => '+50 6666666',
);

$Self->Is(
    $CallerID,
    '*5011111',
    'FilterCallerID(+50 6666666)',
);

1;
