# Class: elastic::params
#
# standard values for variables
#

class elastic::params {
  $ensure            = present
  $keyserver         = 'pgp.mit.edu'
  $key_id            = '46095ACC8548582C1A2699A9D27D666CD88E42B4'
  $use_elasticsearch = false
  $use_logstash      = false
  $use_kibana        = false
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
