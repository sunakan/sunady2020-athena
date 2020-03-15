export ATHENA_SAMPLE_IP=192.168.33.11

.PHONY: up
up:
	vagrant up

.PHONY: ssh
ssh:
	sshrc \
		-i .vagrant/machines/athena_sample/virtualbox/private_key \
		vagrant@${ATHENA_SAMPLE_IP}
