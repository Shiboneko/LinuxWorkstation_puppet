class terminal {

  include stdlib  
  package{'lxterminal': }
  package{'rxvt-unicode': }

  file { "${home_dir}/.Xdefaults":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => "0644",
    source => 'puppet:///modules/urxvt/Xdefaults',
  }
}

include terminal
