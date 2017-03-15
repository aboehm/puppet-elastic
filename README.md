# elastic

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup - The basics of getting started with elastic](#setup)
    * [What elastic affects](#what-elastic-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with elastic](#beginning-with-elastic)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module for managing basic ELK installation.

## Module Description

Manage the repository key from elastic.co and ELK-stack installation.

## Setup

### What elastic affects

* install repository from elastic.co
* define logstash, elasticsearch, kibana installation

### Setup Requirements

* puppetlabs/apt (https://forge.puppet.com/puppetlabs/apt)
* puppetlabs/stdlib (https://forge.puppet.com/puppetlabs/stdlib)

### Beginning with elastic

To install complete ELK-stack define elastic class as follows:

~~~
class { 'elastic':
  ensure            => present,
  use_logstash      => true,
  use_elasticsearch => true,
  use_kibana        => true,
}
~~~

To install only the signing key from elastic, use following lines

~~~
class { 'elastic':
  ensure            => present
}
~~~

## Usage

Include module and configure with hiera.


## Reference

### Classes

* `elastic`: Manage key and ELK installation
* `elastic::key`: Define behavior for repository key from elastic.co
* `elastic::repo`: Manage elastic repository
* `elastic::params`: Standard values of parameters

## Limitations

Only Debian/Ubuntu are supported.

