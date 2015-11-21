# Installationsanleitung für Znuny4OTRS-CTI #

**Wichtige Hinweise:**

Sie können die CTI Integration ohne Lizenzkosten, also kostenfrei, nutzen.

**Voraussetzungen:**

 - Das OPM-Paket Znuny4OTRS-Repo muss installiert sein. Sie finden das Paket unter folgendem Link: [http://znuny.com/#!/znuny4otrs](http://znuny.com/#!/znuny4otrs "Znuny4OTRS-Repo Download")
 - OTRS 4 oder OTRS 5
 - Installierter Telefonie-Client auf Ihren Arbeitsplatzrechnern, der bei eingehenden Anrufen eine URL aufrufen kann und optional ausgehnde Anrufe über URL Schemas unterstützt.
 - Die Telefonnummer muss als suchbares Feld in der Kundensuche konfiguriert sein sein (Überprüfen Sie Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)
 - Ihr lokaler Telefonie-Client muss so konfiguriert werden, dass bei einem Anruf ein neues OTRS Browser Fenster geöffnet wird. Z.B.: IHR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX

Bei einem Anruf ruft der Telefonie Client die entsprechende OTRS-URL mit der Telefonnummer des Anrufers auf und öffnet ein OTRS Telefon-Ticket. Sofern Sie Ihre Kundendaten in OTRS haben, kann eine Telefonnummer mit einer URL versehen werden um externe Anrufe zu starten.

**Installation:**

Laden Sie sich das Paket herunter und klicken Sie auf

Admin-->

Paket-Verwaltung und installieren Sie das Paket.

Da Sie bereits das Znuny4OTRS-Repo Paket installiert haben, müssen Sie in der Paket-Verwaltung nur das Verzeichnis [-Addons-] Znuny4OTRS - Public auswählen und aktualisieren. Danach sehen Sie auf der rechten Seite den Eintrag Znuny4OTRS-CTI im Online-Verzeichnis. Klicken Sie am Ende der Zeile auf "installieren", um das Paket zu installieren.


**Anmerkung:** Um die Konfigurationsoptionen zu erreichen, gehen Sie zu

Admin-->

SysConfig-->

Gruppe "CTI"-->

Untergruppe "MSN"

(Die Benutzung über die URL otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX)

------------------------

Für Fragen stehen wir Ihnen jederzeit gern unter support(at)znuny.com zur Verfügung.

------------------------
Weitere nützliche Addons finden Sie unter [http://znuny.com/#!/addons](http://znuny.com/#!/addons "Znuny Addons")

Ihr Znuny Team