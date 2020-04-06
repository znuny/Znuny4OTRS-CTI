# Konfiguration

## CTI::FilterCallerRegEx

In dieser SysConfig-Option können die Telefonnummern für den Redirect per regulärem Ausdruck gefiltert werden.

### Beispiele

```
    '(?# regex 1)[\(\)]'                                                     => '',
    '(?# regex 2)\-'                                                         => '',
    '(?# regex 3)\s*'                                                        => '',
    '(?# regex 4)\+'                                                         => '*',
    '(?# regex 5)(?<dialcode>\*48\d{2})(?<p1>\d{2})(?<p2>\d{2})(?<p3>\d{2})' => '[**\\dialcode**][**\\p3**][**\\p2**][**\\p1**]',
    '(?# regex 6)(?<phone>\*50).*'                                           => '[**\\phone**]11111',
```

## CTI::RedirectURLParameters

Für verschiedene Frontendmodule können statische Parameter konfiguriert werden, die an den Redirect-URL angehängt werden. Der Schlüssel ist dabei der Name des URL-Parameters und der Inhalt dessen Wert. Als Schlüssel kann auch `_DEFAULT_` angegeben werden. Dann werden diese Parameter angehängt, sofern der Agent keiner passenden Rolle zugeordnet ist. Das Paket wird mit drei SysConfig-Optionen ausgeliefert:

- CTI::RedirectURLParameters###AgentTicketPhone
- CTI::RedirectURLParameters###AgentCustomerInformationCenter
- CTI::RedirectURLParameters###AgentCustomerUserInformationCenter

Es können beliebige weitere Frontendmodule konfiguriert werden. Diese müssen dann allerdings in Kernel/Config.pm o. ä. hinterlegt werden.
