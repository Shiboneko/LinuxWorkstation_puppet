class emacs::config inherits emacs {

file { '/home/user/.emacs.d/init.el':
	  ensure  => 'file',
	  mode    => '0644',
	  owner   => '1000',
	  type    => 'file',
	source => 'puppet:///modules/emacs/files/init.el'

}
