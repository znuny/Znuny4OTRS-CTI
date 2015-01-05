![Znuny logo](http://znuny.com/assets/logo_small.png)

# Installation manual for Znuny4OTRS-CTI #

### English ###

**Important Notice**

This package is available free of charge!

**Prerequisites**

- The Znuny4OTRS-Repo package needs to be installed. You will find the package here: [http://znuny.com/#!/znuny4otrs](http://znuny.com/#!/znuny4otrs "Znuny4OTRS-Repo Download")
- OTRS 3.1, OTRS 3.2, OTRS 3.3. or OTRS 4.0 needs to be installed
- An installed telephone client on your workstation which supports URL schemes
- Configure your local CTI client/agent to open a new browser window (OTRS window) on every incoming phone call. For example: YOUR-OTRS-IP/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX
- We added new parameter screen. If you pass "AgentCustomerInformationCenter" to the screen var, you get linked to the customer information center.
  YOUR-OTRS-IP/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;Screen=AgentCustomerInformationCenter;

- The telephone number needs to be configured as a searchable field (Check Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)

If the caller is stored with his caller-id in the local database, the ticket create screen will be opened and the caller will be pre selected as customer. If you already have your customerdata in OTRS, the phonenumber might be provided with a URL to start external phonecalls.

**Installation:**

Install the package via

Admin-->

Package-Manager


Here you can select the repository [-Addons Znuny4OTRS -Public] and install the package.(You might need to update the repository information first) Follow the installation steps and click "next" to finish the installation.


**Notice:** To get to the configuration options go to

Admin-->

SysConfig-->

Group "CTI"-->

"MSN"

(The use of the URL otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX should be sufficient in most cases)

---------------------------

For further questions and commercial support please don´t hesitate to contact us via support(at)znuny.com.

------------------------

You might find more usefull Addons at [http://znuny.com/#!/addons](http://znuny.com/#!/addons "Znuny Addons")

Your Znuny Team


----------------------------
### Deutsch ###

----------------------------

**Wichtige Hinweise:**

Sie können die CTI Integration ohne Lizenzkosten, also kostenfrei nutzen.

**Voraussetzungen:**

 - Das OPM-Paket Znuny4OTRS-Repo muss installiert sein. Sie finden das Paket unter folgendem Link: [http://znuny.com/#!/znuny4otrs](http://znuny.com/#!/znuny4otrs "Znuny4OTRS-Repo Download")
 - OTRS 3.1, OTRS 3.2, OTRS 3.3 oder OTRS 4.0
 - Installierter Telefonie Client auf Ihren Arbeitsplatzrechnern, der URL Schemas unterstützt.
 - Die Telefonnummer muss als suchbares Feld in der Kundensuche eingetragen sein (Überprüfen Sie Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)
 - Ihr lokaler CTI Client/Agent muss so konfiguriert werden, dass bei einem Anruf ein neues OTRS Browser Fenster geöffnet wird. Z.B.: IHRE-OTRS-IP/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX

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
