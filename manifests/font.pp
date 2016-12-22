class font {
  file { '/home/user/.fonts2/':
    ensure  => directory,
    owner   => 'user',
    group   => 'user',
    mode    => '0644',
    recurse => true,
    source  => 'puppet:///modules/font/'
  }

}
include font
