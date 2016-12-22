class i3 {

  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  file { '/home/user/git':
    ensure => directory,
    mode    => '0644',
    owner   => 'user',
    group   => 'user',
  }


  $packages = ['font-awesome','i3-gaps-next-git','i3blocks-gaps-git']
  $packages.each | $package | {



    exec { "cloning ${package}":
      cwd     => "/home/user/git/",
      command => "git clone https://aur.archlinux.org/${package}.git",
      user    => "user",
      returns =>  [0, 2, 128]
    }

    exec { "building ${package}":
      cwd     => "/home/user/git/${package}",
      command => "makepkg &&  mv ${package}*.tar.xz ${package}.tar.xz",
      user    => "user",
      unless  => "pacman -Q ${package}",
    }


    package { $package: 
    provider => 'pacman',
    source   => "/home/user/git/${package}/${package}.tar.xz",
    }
  }



  file { '/home/user/.config/i3/':
    ensure => directory,
    owner=> 'user',
    group => 'user',
    mode => '0644',
    source => 'puppet:///modules/i3/',
    recurse => true,
  }


  file { '/home/user/.config/i3/blocks/':
    ensure => directory,
    owner=> 'user',
    group => 'user',
    mode => '0755',
    recurse => true,
  }
}

include i3
