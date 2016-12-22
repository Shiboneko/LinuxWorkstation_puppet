
class tools {

	package {'ncdu': }
	package {'htop': }
	package {'glances': }
	package {'openssh': }
	package {'rsync': }
	package {'ranger': }
  package {'tree': }
  
  package {'trash-cli': }
  package {'dwb': }
}
include tools
