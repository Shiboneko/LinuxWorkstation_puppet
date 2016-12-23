class terminal {

  include stdlib  
  package{'lxterminal': }
  package{'rxvt-unicode': }

  file {"${home_dir}/.Xdefaults":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }


  package{'npm': }
  exec { 'Installing base16-builder':
    command => 'npm install --global base16-builder',
    creates => '/usr/bin/base16-builder',
  }

  exec { "Creating ${home_dir}/.Xdefaults":
    cwd     => $home_dir,
    command => 'base16-builder -s monokai -t rxvt-unicode -b dark > .Xdefaults',
    user    => $user,
    creates => "${home_dir}/.Xdefaults";
  }



  $lines = ['urxvt*font: xft:Inconsolata:size=9',
  'URxvt.transparent: true',
  'URxvt.tintcolor: white',
  'URxvt.shading: 20',
  'URxvt.saveLines: 1000',
  'URxvt.foreground: white',
  'URxvt.scrollBar: false',
  'URxvt.secondaryScroll: true']

  $lines.each | $line | {
    file_line  {"Adding line:${line}":
      ensure    => present,
      path      => "${home_dir}/.Xdefaults",
      line      => $line,
      subscribe => Exec["Creating ${home_dir}/.Xdefaults"],
    }

  }
}

include terminal
