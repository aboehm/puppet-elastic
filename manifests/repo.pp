### Class: elastic::repo
#
# add repository to package management
#

class elastic::repo (
  $ensure           = $elastic::params::ensure,
  $release          = $elastic::params::release,
  $include_src      = $elastic::params::include_src,
  $include_deb      = $elastic::params::include_deb,
  $repo_base_url    = $elastic::params::repo_base_url,
  $repo_dist        = $elastic::params::repo_dist,
  $repo_components  = $elastic::params::repo_components,
  $keyserver        = $elastic::params::keyserver,
  $key_id           = $elastic::params::key_id, 
) {
  
  validate_re($ensure, 'present|installed|absent|purged|held|latest')

  $ea = $ensure ? {
    /present|installed|latest/ => present,
    /absent|purged/            => absent,
    default                    => false,
  }

  if $ea != false {
    ensure_resource( 'package', 'apt-transport-https', {
      ensure => $ea,
    } )

    apt::source { 'elastic':
      ensure   => $ea,
      location => "${repo_base_url}/${release}/apt",
      key      => {
        id     => $key_id,
        server => $keyserver,
      },
      release  => $repo_dist,
      repos    => $repo_components,
      include  => {
        src => $include_src,
        deb => $include_deb,
      },
    }
  }
}

# vi: set ft=puppet tabstop=2 shiftwidth=2 expandtab :
