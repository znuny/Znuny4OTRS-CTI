# Configuration

## CallerID regex filter

In the following SysConfig it is possible to filter the caller id for the redirect by regex:

`CTI::FilterCallerRegEx`

## Beispiele

```
    '(?# regex 1)[\(\)]'                                                     => '',
    '(?# regex 2)\-'                                                         => '',
    '(?# regex 3)\s*'                                                        => '',
    '(?# regex 4)\+'                                                         => '*',
    '(?# regex 5)(?<dialcode>\*48\d{2})(?<p1>\d{2})(?<p2>\d{2})(?<p3>\d{2})' => '[**\\dialcode**][**\\p3**][**\\p2**][**\\p1**]',
    '(?# regex 6)(?<phone>\*50).*'                                           => '[**\\phone**]11111',
```
