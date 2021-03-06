# puppet-pamlimits
This module allows to manage `/etc/security/limits.conf` file.

It is tested using Hiera with yaml backend on a puppet master.

## Parameters
* `conf` - reads a supplied hash and compiles `limits.conf` file. See examples
for more details.

## Requires
Hiera + yaml backend on the puppet master.

## Examples
Below are examples for using hiera with yaml backend.

    ---
    classes:
      - 'pamlimits'

    # pamlimits::conf:
    #  '<domain>/<type>/<item>':
    #    value: <value>

    pamlimits::conf:
      '*/soft/nofile':
        value: 1024
      '@mygroup/-/nproc':
        value: 128

##  Authors
- Vaidas Jablonskis <jablonskis@gmail.com>

