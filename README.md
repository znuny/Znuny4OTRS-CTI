![Znuny logo](https://www.znuny.com/assets/images/logo_small.png)

![Build status](https://badge.proxy.znuny.com/Znuny4OTRS-CTI/master)

Znuny4OTRS-CTI
==============

**Important notice**

This package is available free of charge!

**Prerequisites**

- OTRS 6
- [Znuny4OTRS-Repo](https://www.znuny.com/add-ons/znuny4otrs-repository)
- An installed phone client on your workstation which supports opening a URL on incoming calls and optional dialing via URL scheme

**Notes**

- Configure your local CTI client/agent to open a new browser window (OTRS window) on every incoming phone call. For example: YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX
- Possibility to modify the caller ID with regular expressions
- We added the URL parameter "Screen". If you pass "Screen=AgentCustomerInformationCenter", you get linked to the customer information center.
  YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;Screen=AgentCustomerInformationCenter;
- The phone number needs to be configured as a searchable field (check Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)

If the caller is stored with his caller ID in the configured customer user database, the ticket creation screen will be opened and the caller will be pre-selected as customer. If you already have your customer data in OTRS, the phone number might be provided with a URL to start external phone calls.

**Installation**

Download the [package](https://addons.znuny.com/api/addon_repos/public/1057/latest) and install it via admin interface -> package manager or use [Znuny4OTRS-Repo](https://www.znuny.com/add-ons/znuny4otrs-repository).

**Download**

Download the [latest version](https://addons.znuny.com/api/addon_repos/public/1057/latest).

**Configuration:**

To get to the configuration options in the System Configuration, navigate to __Core => Znuny4OTRS => CTI__.

(The use of the URL otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX should be sufficient in most cases)

**Commercial Support**

For this extension and for OTRS in general visit [https://www.znuny.com](https://www.znuny.com). Looking forward to hear from you!

Enjoy!

Your Znuny Team!

[https://www.znuny.com/](https://www.znuny.com/)
