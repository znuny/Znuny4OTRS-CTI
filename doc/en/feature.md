# Functionality

**Important Notice**

This package is available free of charge!

**Prerequisites**

- The Znuny4OTRS-Repo package needs to be installed. You will find the package here: [https://www.znuny.com/add-ons/znuny4otrs-repository](https://www.znuny.com/add-ons/znuny4otrs-repository)
- OTRS 6
- An installed telephone client on your workstation which supports open an URL on incoming calls and optional dial via an URL schemes
- Configure your local CTI client/agent to open a new browser window (OTRS window) on every incoming phone call. For example: YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX
- We added new parameter screen. If you pass "AgentCustomerInformationCenter" to the screen var, you get linked to the customer information center.
  YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;Screen=AgentCustomerInformationCenter;

- The telephone number needs to be configured as a searchable field (Check Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)

If the caller is stored with his caller-id in the local database, the ticket create screen will be opened and the caller will be preselected as customer. If you already have your customerdata in OTRS, the phonenumber might be provided with a URL to start external phonecalls.

**Installation:**

Install the package via

Admin-->

Package-Manager


Here you can select the repository [-Addons Znuny4OTRS -Public] and install the package (You might need to update the repository information first). Follow the installation steps and click "next" to finish the installation.


**Notice:** To get to the configuration options in the System Configuration by navigate to

Core => Znuny4OTRS => CTI

(The use of the URL otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX should be sufficient in most cases)

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
