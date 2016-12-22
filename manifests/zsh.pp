class zsh
{

  package{'zsh': }
    Exec { path =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  file {'/home/user/.zshenv':
    ensure => file,
    owner  => 'user',
    group  => 'user',
    mode   => '0644',
    source => 'puppet:///modules/zsh/zshenv',
  }

  file {'/home/user/.config/zsh/':
    ensure  => directory,
    owner   => 'user',
    group   => 'user',
    mode    => '0644',
    recurse => true,
    force   =>  true,
    source  => 'puppet:///modules/zsh/dotconfig',
  }

  package{'curl': }
  exec {'Installing oh-my-zsh':
    cwd         => '/home/user/',
    command     => 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"',
    user        => 'user',
    creates     => '/home/user/.config/zsh/oh-my-zsh/oh-my-zsh.sh',
    environment =>  ["ZSH=/home/user/.config/zsh/oh-my-zsh"],
    require     => Package['curl'],

    }

    file { '/home/user/.config/zsh/oh-my-zsh/themes/oh-my-zsh.zsh-theme':
      ensure  => file,
      owner   => 'user',
      group   => 'user',
      mode    => '0644',
      source  => 'puppet:///modules/zsh/oh-my-zsh.zsh-theme',
      require => Exec['Installing oh-my-zsh'],
    }
  }
include zsh
