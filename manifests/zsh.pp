class zsh
{

  package{"zsh": }
    Exec { path =>  [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  file {"${home_dir}/.zshenv":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => "0644",
    source => "puppet:///modules/zsh/zshenv",
  }

  file {"${home_dir}/.config/zsh/":
    ensure  => directory,
    owner   => $user,
    group   => $user,
    mode    => "0644",
    recurse => true,
    force   => true,
    source  => "puppet:///modules/zsh/dotconfig",
  }

  package{"curl": }
  exec {"Installing oh-my-zsh":
    cwd         => $home_dir,
    command     => "git clone https://github.com/robbyrussell/oh-my-zsh.git ${home_dir}/.config/zsh/oh-my-zsh",
    user        => $user,
    creates     => "${home_dir}/.config/zsh/oh-my-zsh/oh-my-zsh.sh",
    environment =>  ["ZSH=${home_dir}/.config/zsh/oh-my-zsh"],
    require     => Package["curl"],

    }

    file { "${home_dir}/.config/zsh/oh-my-zsh/themes/oh-my-zsh.zsh-theme":
      ensure  => file,
      owner   => $user,
      group   => $user,
      mode    => "0644",
      source  => "puppet:///modules/zsh/oh-my-zsh.zsh-theme",
      require => Exec["Installing oh-my-zsh"],
    }
  }
include zsh
