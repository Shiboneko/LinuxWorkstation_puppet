class rofi {


  package{'rofi': }

  file {"${home_dir}/.config/rofi/":
    ensure => directory,
  }
  file {"${home_dir}/.config/rofi/config":
    ensure => file,
    source => 'puppet:///modules/rofi/config',
  }
}
include rofi
