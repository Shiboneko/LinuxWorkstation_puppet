class i3 {
	package {'i3-gaps-next-git': }
	package {'i3-blocks-gaps-git': }
	package {'font-awesome': }
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
