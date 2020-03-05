![Znuny logo](https://www.znuny.com/assets/images/logo_small.png)


![Build status](https://badge.proxy.znuny.com/Znuny4OTRS-CTI/master)

Znuny4OTRS-CTI
=================

**Important Notice**

This package is available free of charge!

**Prerequisites**

- OTRS 6
- [Znuny4OTRS-Repo](https://www.znuny.com/add-ons/znuny4otrs-repository)

- An installed telephone client on your workstation which supports open an URL on incoming calls and optional dial via an URL schemes

- Configure your local CTI client/agent to open a new browser window (OTRS window) on every incoming phone call. For example: YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX

- Possibility to modify the caller id with regular expressions

- We added new parameter screen. If you pass "AgentCustomerInformationCenter" to the screen var, you get linked to the customer information center.
  YOUR-OTRS-HOST/otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX;Screen=AgentCustomerInformationCenter;

- The telephone number needs to be configured as a searchable field (Check Kernel/Config.pm -> CustomerUser -> CustomerUserSearchFields)

If the caller is stored with his caller-id in the configured customer user database, the ticket create screen will be opened and the caller will be pre selected as customer. If you already have your customerdata in OTRS, the phonenumber might be provided with a URL to start external phonecalls.


**Installation**

Download the [package](https://addons.znuny.com/api/addon_repos/public/1057/latest) and install it via admin interface -> package manager or use [Znuny4OTRS-Repo](https://www.znuny.com/add-ons/znuny4otrs-repository).

**Download**

Download the [latest version](https://addons.znuny.com/api/addon_repos/public/1057/latest).

**Configuration:**

All possible settings can be found in the System Configuration after selectin Znuny4OTRS-CTI in the navigation.

(The use of the URL otrs/index.pl?Action=AgentTicketPhoneCTI;CallerID=XXX should be sufficient in most cases)

**Commercial Support**

For this extension and for OTRS in general visit [https://www.znuny.com](https://www.znuny.com). Looking forward to hear from you!

Enjoy!

Your Znuny Team!

[https://www.znuny.com/](https://www.znuny.com/)
