MODULEPATH=`pwd`/modules
TEMPLATEDIR=`pwd`/templates
ifdef DEBUG
	DEBUG_FLAG= --noop
endif
export GNUPGHOME
export GPG_AGENT_INFO

# sudo make -C/etc/puppet GNUPGHOME=$HOME/.gnupg GPG_AGENT_INFO=$GPG_AGENT_INFO 

all:
	puppet apply --modulepath=$(MODULEPATH) manifests/ $(DEBUG_FLAG)

