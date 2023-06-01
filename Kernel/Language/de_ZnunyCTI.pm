# --
# Copyright (C) 2012 Znuny GmbH, https://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ZnunyCTI;

use strict;
use warnings;

use utf8;

sub Data {
    my $Self = shift;


    $Self->{Translation}->{"Frontend module registration for the agent interface. E.g. 'znuny/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;MSN=XXX'."} = "Frontend-Modul-Registrierung für das Agent-Interface, z. B. 'znuny/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;MSN=XXX'.";
    $Self->{Translation}->{"Expert Setting - not needed in standard setup! Defines the action based on MSN, e.g. route incoming calls to different frontend modules (Key=Number,Value=Frontend-Module e.g. Key=1222,Value=AgentTicketPhoneHotline)."} = "Experteneinstellung - wird bei der Standardinstallation nicht benötigt! Definiert die Aktion basierend auf MSN, routet z. B. eingehende Anrufe an verschiedene Frontend-Module (Key = Number, Value = Frontend-Modul, Z. B. Key = 1222, Value = AgentTicketPhoneHotline).";
    $Self->{Translation}->{"This configuration defines the maximum of customer users that should get added to the the AgentTicketPhone view."} = "Diese Konfiguration definiert das Maximum der Kundenbenutzer, die in der AgentTicketPhone-Ansicht hinzugefügt werden sollen.";
    $Self->{Translation}->{"Regular expression for the caller ID."} = "Regulärer Ausdruck für die Caller-ID.";
    $Self->{Translation}->{"This configuration defines a list of replacement regexes which will be used to filter the caller ID."} = "Diese Konfiguration definiert eine Liste von zu ersetzenden regulären Ausdrücken zur Filterung der Telefonnummer (Caller-ID).";
    $Self->{Translation}->{'Parameters that will be added to the AgentTicketPhone redirect URL. Key is the name of the parameter, content its value. Key can also be set to _DEFAULT_. These parameters will then be added if an agent is not assigned to any of the configured roles.'}
        = 'Parameter, die beim Redirect an den AgentTicketPhone-URL angehängt werden. Schlüssel ist der Name des Parameters, Inhalt dessen Wert. Als Schlüssel kann auch `_DEFAULT_` angegeben werden. Dann werden diese Parameter angehängt, sofern der Agent keiner passenden Rolle zugeordnet ist.';
    $Self->{Translation}->{'Parameters that will be added to the AgentCustomerInformationCenter redirect URL. Key is the name of the parameter, content its value. Key can also be set to _DEFAULT_. These parameters will then be added if an agent is not assigned to any of the configured roles.'}
        = 'Parameter, die beim Redirect an den AgentCustomerInformationCenter-URL angehängt werden. Schlüssel ist der Name des Parameters, Inhalt dessen Wert. Als Schlüssel kann auch `_DEFAULT_` angegeben werden. Dann werden diese Parameter angehängt, sofern der Agent keiner passenden Rolle zugeordnet ist.';
    $Self->{Translation}->{'Parameters that will be added to the AgentCustomerUserInformationCenter redirect URL. Key is the name of the parameter, content its value. Key can also be set to _DEFAULT_. These parameters will then be added if an agent is not assigned to any of the configured roles.'}
        = 'Parameter, die beim Redirect an den AgentCustomerUserInformationCenter-URL angehängt werden. Schlüssel ist der Name des Parameters, Inhalt dessen Wert. Als Schlüssel kann auch `_DEFAULT_` angegeben werden. Dann werden diese Parameter angehängt, sofern der Agent keiner passenden Rolle zugeordnet ist.';

    return 1;
}

1;
