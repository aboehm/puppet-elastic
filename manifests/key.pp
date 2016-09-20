# Class: elastic::key
#
# manage elastic public key for apt
#

class elastic::key (
  $ensure    = $elastic::params::ensure,
  $keyserver = $elastic::params::keyserver,
  $key_id    = $elastic::params::key_id,
) inherits elastic::params {

  include apt

  validate_re($ensure, 'present|installed|purged|absent|held|latest')
  validate_re($key_id, '[0-9a-fA-F]+')
  validate_re($keyserver, '[0-9a-fA-Z\.\-\_]+')

  $ea = $ensure ? {
    /present|installed|latest/ => 'present',
    /purged|absent/            => 'absent',
    default                    => false,
  }

  if $ea != false {
    apt::key { 'elastic':
      ensure => $ea,
      id     => $key_id,
      server => $keyserver,
    }
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
