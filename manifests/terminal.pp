class terminal {
  include stdlib  
  package{'lxterminal': }
  package{'rxvt-unicode': }

  file {'/home/user/.Xdefaults':
    ensure => file,
    owner  => 'user',
    group  => 'user',
    mode   => '0644',
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
      ensure => present,
      path   => '/home/user/.Xdefaults',
      line   => $line,
    }

  }
}

include terminal
