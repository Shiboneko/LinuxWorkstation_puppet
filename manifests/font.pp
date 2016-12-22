class font {
  file { "${home_dir}/.fonts/":
    ensure  => directory,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    recurse => true,
    source  => 'puppet:///modules/font/'
  }

}
include font
