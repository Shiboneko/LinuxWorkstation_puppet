class vim {

  package {'vim': } 
  file { '/home/user/.vimrc/':
    ensure => file,
    owner  => 'user',
    group  => 'user',
    mode   => '0644',
    source => 'puppet:///modules/vim/vimrc',

  }

  file { '/home/user/.vim/':
    ensure  => file,
    owner   => 'user',
    group   => 'user',
    mode    => '0644',
    recurse => true,
    source  => 'puppet:///modules/vim/dotvim',
  }

}

include vim
