# Configuration

## CTI::FilterCallerRegEx

With this SysConfig option it is possible to filter the caller id for the redirect by regular expressions.

### Examples

```
    '(?# regex 1)[\(\)]'                                                     => '',
    '(?# regex 2)\-'                                                         => '',
    '(?# regex 3)\s*'                                                        => '',
    '(?# regex 4)\+'                                                         => '*',
    '(?# regex 5)(?<dialcode>\*48\d{2})(?<p1>\d{2})(?<p2>\d{2})(?<p3>\d{2})' => '[**\\dialcode**][**\\p3**][**\\p2**][**\\p1**]',
    '(?# regex 6)(?<phone>\*50).*'                                           => '[**\\phone**]11111',
```

## CTI::RedirectURLParameters

Static parameters can be configured for various front-end modules, which are appended to the redirect URL. The key is the name of the URL parameter and the content its value. Key can also be set to `_DEFAULT_`. These parameters will then be added if an agent is not assigned to any of the configured roles. The package is delivered with three SysConfig options:

- CTI::RedirectURLParameters####AgentTicketPhone
- CTI::RedirectURLParameters####AgentCustomerInformationCenter
- CTI::RedirectURLParameters####AgentCustomerUserInformationCenter

Any other front-end modules can be configured. However, these must then be stored in Kernel/Config.pm or similar.
