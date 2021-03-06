# Funktionalität

**Wichtige Hinweise:**

Sie können die CTI-Integration ohne Lizenzkosten - also kostenfrei - nutzen.

**Voraussetzungen:**

 - Das OPM-Paket Znuny4OTRS-Repo muss installiert sein. Sie finden das Paket mit einer Beschreibung unter folgendem Link: [https://www.znuny.com/add-ons/znuny4otrs-repository](https://www.znuny.com/add-ons/znuny4otrs-repository)
 - OTRS 6
 - Installierter Telefonie-Client auf Ihren Arbeitsplatzrechnern, der bei eingehenden Anrufen einen URL aufrufen kann und optional ausgehende Anrufe über URL-Schemas unterstützt.
 - Die Telefonnummer muss als suchbares Feld in der Kundensuche konfiguriert sein (überprüfen Sie Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)
 - Ihr lokaler Telefonie-Client muss so konfiguriert werden, dass bei einem Anruf ein neues OTRS-Browser-Fenster geöffnet wird, Beispiel: IHR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX

Bei einem Anruf ruft der Telefonie-Client den entsprechenden OTRS-URL mit der Telefonnummer des Anrufers auf und öffnet ein OTRS-Telefon-Ticket. Sofern Sie Ihre Kundendaten in OTRS hinterlegt haben, kann eine Telefonnummer mit einem URL versehen werden, um externe Anrufe zu starten.

**Installation:**

Laden Sie sich das Paket herunter und klicken Sie auf __Admin->Paket-Verwaltung__ und installieren Sie das Paket.

Da Sie bereits das Znuny4OTRS-Repo Paket installiert haben, müssen Sie in der Paket-Verwaltung nur das Verzeichnis [-Addons-] Znuny4OTRS - Public auswählen und aktualisieren. Danach sehen Sie auf der rechten Seite den Eintrag Znuny4OTRS-CTI im Online-Verzeichnis. Klicken Sie am Ende der Zeile auf "installieren", um das Paket zu installieren.

**Anmerkung:** Um die Konfigurationsoptionen zu erreichen, gehen Sie in der System-Konfiguration zu __Core => Znuny4OTRS => CTI__.

(Die Benutzung erfolgt über den URL otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX)

**Getestete VoIP-Clients
- Cisco Agent Desktop
- Zoiper
- Blink Pro
- Express Talk

------------------------

Für Fragen stehen wir Ihnen jederzeit gern unter support@znuny.com zur Verfügung.

------------------------
Weitere nützliche Addons finden Sie unter [https://www.znuny.com/add-ons/](https://www.znuny.com/add-ons/ "Znuny Addons")

Ihr Znuny Team
