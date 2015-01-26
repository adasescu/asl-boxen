class helion::environment {

package {
    'hg':
    ensure => present;
}
package {
    'bzr':
    ensure => present;
}
package {
    'direnv':
    ensure => present;
}

class { 'vagrant':
  version => '1.7.2'
}
  
include openstack_clients

include go
  go::version { '1.4':
    
  }

  include vmware_fusion
  include vagrant
  include packer

#vagrant::plugin { 'vagrant-vmware-fusion':
#  license => 'puppet:///modules/helion/manifests/licenses/fusion.lic',
#}
#vagrant::plugin { 'vagrant-vmware-fusion':
#  license => 'puppet://licenses/fusion.lic',
#}

  include chrome
  include hipchat
  include tunnelblick::beta
}
