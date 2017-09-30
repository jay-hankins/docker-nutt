export IMAGE_NAME=jay-hankins/openvpn:armhf

export APP_FOLDER?=./app/

build:
	docker build -t $(IMAGE_NAME) .

# # Build a Docker network that spans the typical home router address space
# # but pin the IP addresses it gives out to the upper range
# network:
# 	docker network create -d macvlan \
# 	--subnet=192.168.1.0/24 \
# 	--gateway=192.168.1.1 \
# 	--ip-range=192.168.1.12/30 \
# 	-o parent=enxb827ebb72b7b \
# 	lan

# Debug stuff
shell:
	-mkdir -p $(APP_FOLDER)
	docker run -v $(APP_FOLDER):/etc/openvpn/ -it $(IMAGE_NAME) /bin/bash

# Run this (for testing)
run:
	-mkdir -p $(DATA_FOLDER)
	-mkdir -p $(TEMP_FOLDER)
	docker run -v $(DATA_FOLDER):/opt/plex/data \
		-v /tmp:/opt/plex/tmp \
		--cap-add SYS_ADMIN \
		--cap-add DAC_READ_SEARCH \
		--env PLEX_MOUNT_READONLY_SHARES=$(SHARES) \
		--net=lan -it $(IMAGE_NAME)
