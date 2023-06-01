# Functionality

**Important notice**

This package is available free of charge!

**Prerequisites**

- An installed phone client on your workstation which supports opening a URL on incoming calls and optional dialing via URL scheme

**Notes**

- Configure your local CTI client/agent to open a new browser window (Znuny window) on every incoming phone call. For example: YOUR-ZNUN>-HOST/znuny/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX
- Possibility to modify the caller ID with regular expressions
- We added the URL parameter "Screen". If you pass "Screen=AgentCustomerInformationCenter", you get linked to the customer information center.
  YOUR-ZNUNY-HOST/znuny/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;Screen=AgentCustomerInformationCenter;
- The phone number needs to be configured as a searchable field (check Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)

If the caller is stored with his caller ID in the configured customer user database, the ticket creation screen will be opened and the caller will be pre-selected as customer. If you already have your customer data in ZNUNY, the phone number might be provided with a URL to start external phone calls.

**Installation:**

Install the package via __Admin->Package-Manager__.

Here you can select the repository [-Addons Znuny -Public] and install the package (You might need to update the repository information first). Follow the installation steps and click "next" to finish the installation.


**Notice:** To get to the configuration options in the System Configuration, navigate to __Core => Znuny => CTI__.

(The use of the URL znuny/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX should be sufficient in most cases)

**Tested VoIP-clients**
- Cisco Agent Desktop
- Zoiper
- Blink Pro
- Express Talk

If you know a client which works just let us know and we'll add him.

---------------------------

For further questions and commercial support please don't hesitate to contact us via support@znuny.com.

------------------------

You might find more usefull addons at [https://www.znuny.com/add-ons/](https://www.znuny.com/add-ons/ "Znuny Addons")

Your Znuny Team
