#!/bin/bash

install_docker(){
	sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine


	sudo yum install -y yum-utils

	sudo yum-config-manager \
    		--add-repo \
    		http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo


	sudo yum -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

	systemctl start docker
	systemctl enable docker

	docker run --privileged --rm tonistiigi/binfmt --install all
}

main(){
	install_docker
}

main $@
