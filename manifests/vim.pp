class vim {

  package {'vim': } 
  file { "${home_dir}/.vimrc/":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/vim/vimrc',

  }

  file { "${home_dir}/.vim/":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    recurse => true,
    source  => 'puppet:///modules/vim/dotvim',
  }

}

include vim
