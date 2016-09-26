# == Class: elastic
#
# Manage a standard ELK installation
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class elastic (
  $ensure            = $elastic::params::ensure,
  $use_elasticsearch = $elastic::params::use_elasticsearch,
  $use_logstash      = $elastic::params::use_logstash,
  $use_kibana        = $elastic::params::use_kibana,
) inherits elastic::params {

  validate_re($ensure, 'present|installed|purged|absent|held|latest')
  validate_bool($use_elasticsearch, true, false)
  validate_bool($use_logstash, true, false)
  validate_bool($use_kibana, true, false)

  ensure_resource( 'class', 'elastic::key', {
    ensure    => $ensure,
  } )

  if $use_logstash == true {
    ensure_resource( 'class', 'logstash', {
      ensure => $ensure,
    } )
  }

  if $use_elasticsearch == true {
    ensure_resource( 'class', 'elasticsearch', {
      ensure => $ensure,
    } )
  }

  if $use_kibana == true {
    ensure_resource( 'class', 'kibana', {
      ensure => $ensure,
    } )
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
