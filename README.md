# puppet-pamlimits
This class allows to manage <code>/etc/security/limits.conf</code> file.

## Parameters
* `conf` - reads a supplied hash and compiles `limits.conf` file. See examples for more details.

## Requires
None

## Examples
    ---
    classes:
      - 'pamlimits'

    # pamlimits::conf:
    #  '<domain>/<type>/<item>':
    #    value: <value>

    pamlimits::conf:
      '*/soft/nofile':
        value: 1024
      'joe/-/nofile':
        value: 128

##  Authors
- Vaidas Jablonskis <jablonskis@gmail.com>
