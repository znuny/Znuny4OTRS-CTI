# Installation manual for Znuny4OTRS-CTI #

**Important Notice**

This package is available free of charge!

**Prerequisites**

- The Znuny4OTRS-Repo package needs to be installed. You will find the package here: [http://znuny.com/#!/znuny4otrs](http://znuny.com/#!/znuny4otrs "Znuny4OTRS-Repo Download")
- OTRS 4 or OTRS 5 needs to be installed
- An installed telephone client on your workstation which supports open an URL on incoming calls and optional dial via an URL schemes
- Configure your local CTI client/agent to open a new browser window (OTRS window) on every incoming phone call. For example: YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX
- We added new parameter screen. If you pass "AgentCustomerInformationCenter" to the screen var, you get linked to the customer information center.
  YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;Screen=AgentCustomerInformationCenter;

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

**Tested VoIP-clients**
- Cisco Agent Desktop
- Zoiper
- Blink Pro
- Express Talk

If you know a client which works just let us know and we'll add him.

---------------------------

For further questions and commercial support please don't hesitate to contact us via support(at)znuny.com.

------------------------

You might find more usefull addons at [http://znuny.com/#!/addons](http://znuny.com/#!/addons "Znuny Addons")

Your Znuny Team