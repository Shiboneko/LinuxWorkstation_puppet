class feh {
  file { "${home_dir}/.fehbg":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0755',
    source => 'puppet:///modules/feh/fehbg',
  }


  file { "Wallpaper":

    path   =>"${home_dir}/Bilder/Wallpaper/", 
    ensure => directory,
  }


  file { "${home_dir}/Bilder/Wallpaper/wallhaven.jpg":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    source  => 'puppet:///modules/feh/wallhaven.jpg',
    require => File['Wallpaper'],
  }
}
include feh
