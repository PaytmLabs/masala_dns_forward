# masala_dns_forward

This is a component of the [masala toolkit](https://github.com/PaytmLabs/masala).

This is a chef cookbook providing recipes for deployment of a DNS forwarder using bind. 

It uses systenm packages to deploy bind, and then configure it to be a flexible DNS forwarder, with a default set of resolvers, as well as the ability to specify per-domain resolvers.

The cookbook does NOT perform management of zonefiles, nor acting as any kind of DNS authority.

## Supported Platforms

The platforms supported are:
- Centos 6.7+
- Centos 7.1+

Untested but will take bugs on:
- Ubuntu 14.04 LTS (And future LTS releases)
- Debioan 8.2+

## Attributes

Please also see the documentation for the cookbooks included by masala_dns_forward. (See [metadata.rb](https://github.com/PaytmLabs/masala_dns_forward/blob/develop/metadata.rb) file)

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['masala_dns_forward']['allowed_clients']</tt></td>
    <td>Array of Strings</td>
    <td>A list of networks/IPs to allow client requests from</td>
    <td><tt>[ '192.168.0.0/16', '172.16.0.0/12', '10.0.0.0/8', 'localhost', 'localnets' ]</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_dns_forward']['default_resolvers']</tt></td>
    <td>Array of Strings</td>
    <td>A list of DNS resolver IPs to forward to as default</td>
    <td><tt>[ '8.8.8.8', '8.8.4.4' ]</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_dns_forward']['zone_resolvers']</tt></td>
    <td>Hash of Arrays</td>
    <td>A hash where the key name is a DNS zone, and it's value is an array of DNS resolver IPs to use for said zone.</td>
    <td><tt>{}</tt></td>
  </tr>
</table>

## Usage

### masala_dns_forward::default

Include `masala_dns_forward` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[masala_dns_forward::default]"
  ]
}
```

## License, authors, and how to contribute

See:
- [LICENSE](https://github.com/PaytmLabs/masala_dns_forward/blob/develop/LICENSE)
- [MAINTAINERS.md](https://github.com/PaytmLabs/masala_dns_forward/blob/develop/MAINTAINERS.md)
- [CONTRIBUTING.md](https://github.com/PaytmLabs/masala_dns_forward/blob/develop/CONTRIBUTING.md)

