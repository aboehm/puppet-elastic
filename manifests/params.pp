# Class: elastic::params
#
# standard values for variables
#

class elastic::params {
  $ensure            = present

  $use_elasticsearch = false
  $use_logstash      = false
  $use_kibana        = false

  $keyserver         = 'pgp.mit.edu'
  $key_id            = '46095ACC8548582C1A2699A9D27D666CD88E42B4'

  $repo_base_url   = 'https://artifacts.elastic.co/packages'
  $repo_dist       = 'stable'
  $repo_components = 'main'
 
  $include_src     = false
  $include_deb     = true
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
