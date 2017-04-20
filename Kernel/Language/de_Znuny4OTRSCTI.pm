# --
# Copyright (C) 2012-2017 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_Znuny4OTRSCTI;

use strict;
use warnings;

use utf8;

sub Data {
    my $Self = shift;


    $Self->{Translation}->{"Frontend module registration for the agent interface. E. g. 'otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;MSN=XXX'."} = "Frontend-Modul-Registrierung für die Agent-Schnittstelle. Z.B. 'otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;MSN=XXX'.";
    $Self->{Translation}->{"Expert Setting - not needed in standard setup! Defines the Action based on MSN, e. g. route incoming calls to different frontend modules (Key=Number,Value=Frontend-Module e. g. Key=1222,Value=AgentTicketPhoneHotline)."} = "Expert Setting - wird bei der Standardinstallation nicht benötigt! Definiert die Aktion basierend auf MSN, e. G. Routet eingehende Anrufe an verschiedene Frontend-Module (Key = Number, Value = Frontend-Modul e. G. Key = 1222, Value = AgentTicketPhoneHotline).";
    $Self->{Translation}->{"This configuration defines the maximum of CustomerUsers that should get added to the the AgentTicketPhone view."} = "Diese Konfiguration definiert das Maximum der CustomerUsers, die in der AgentTicketPhone-Ansicht hinzugefügt werden sollen.";
    $Self->{Translation}->{"Regular expression for the CallerID."} = "Regulärer Ausdruck für die CallerID.";

    return 1;
}

1;
