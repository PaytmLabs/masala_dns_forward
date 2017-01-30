
default['masala_dns_forward']['allowed_clients'] = [
  '192.168.0.0/16',
  '172.16.0.0/12',
  '10.0.0.0/8',
  'localhost',
  'localnets'
]
default['masala_dns_forward']['default_resolvers'] = [
  '8.8.8.8',
  '8.8.4.4'
]
# A hash of zone names to lists of resolvers used for zone-specific forwards
default['masala_dns_forward']['zone_resolvers'] = {}
