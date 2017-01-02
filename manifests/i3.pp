class i3{

  notify { $::sudo_user: }
  package {'compton': }
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  file { "${home_dir}/git/":
    ensure => directory,
    mode    => '0644',
    owner   => $user,
    group   => $user,
  }


  $packages = ['i3-gaps-next-git','i3blocks-gaps-git']
  $packages.each | $package | {



    exec { "cloning ${package}":
      cwd     => "${home_dir}/git/",
      command => "git clone https://aur.archlinux.org/${package}.git",
      user    => $user,
      creates => "${home_dir}/git/${package}",
      returns => [0, 2, 128]
    }

    exec { "building ${package}":
      cwd     => "${home_dir}/git/${package}",
      command => "makepkg &&  mv ${package}*.tar.xz ${package}.tar.xz",
      user    => "user",
      unless  => "pacman -Q ${package}",
    }


    package { $package: 
    provider => 'pacman',
    source   => "${home_dir}/git/${package}/${package}.tar.xz",
    }
  }



  file { "${home_dir}/.config/i3/":
    ensure => directory,
    owner=> $user,
    group => $user,
    mode => '0644',
    source => 'puppet:///modules/i3/',
    recurse => true,
  }

  file { "${home_dir}/.config/i3/i3blocks.conf":
    ensure => file,
    owner=> $user,
    group => $user,
    mode => '0644',
    content => template('i3/i3blocks.conf.erb'),
  }

  file { "${home_dir}/.config/i3/blocks/":
    ensure  => directory,
    owner   => $user,
    group   => $user,
    mode    => '0755',
    source  => "puppet:///modules/i3/blocks",
    recurse => true,
  }

  file { "${home_dir}/.config/i3/i3lock-fancy/lock":
    mode => '0755',
  }


  file { "${home_dir}/.config/i3/i3exit":
    mode   => '0755',
    source => 'puppet:///modules/i3/i3exit',
  }
}

include i3
