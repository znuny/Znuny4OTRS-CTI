# Funktionalität

**Wichtige Hinweise:**

Sie können die CTI-Integration ohne Lizenzkosten - also kostenfrei - nutzen.

**Voraussetzungen:**

 - Installierter Telefonie-Client auf Ihren Arbeitsplatzrechnern, der bei eingehenden Anrufen einen URL aufrufen kann und optional ausgehende Anrufe über URL-Schemas unterstützt.
 - Die Telefonnummer muss als suchbares Feld in der Kundensuche konfiguriert sein (überprüfen Sie Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)
 - Ihr lokaler Telefonie-Client muss so konfiguriert werden, dass bei einem Anruf ein neues Znuny-Browser-Fenster geöffnet wird, Beispiel: IHR-ZNUNY-HOST/znuny/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX

Bei einem Anruf ruft der Telefonie-Client den entsprechenden Znuny-URL mit der Telefonnummer des Anrufers auf und öffnet ein Znuny-Telefon-Ticket. Sofern Sie Ihre Kundendaten in Znuny hinterlegt haben, kann eine Telefonnummer mit einem URL versehen werden, um externe Anrufe zu starten.

**Installation:**

Installieren Sie das Paket über __Admin->Package-Manager__.

Hier können Sie das Repository [-Addons Znuny -Public] auswählen und das Paket installieren (möglicherweise müssen Sie zuerst die Repository-Informationen aktualisieren). Folgen Sie den Installationsschritten und klicken Sie auf "Weiter", um die Installation abzuschließen.

**Anmerkung:** Um die Konfigurationsoptionen zu erreichen, gehen Sie in der System-Konfiguration zu __Core => Znuny => CTI__.

(Die Benutzung erfolgt über den URL znuny/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX)

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
