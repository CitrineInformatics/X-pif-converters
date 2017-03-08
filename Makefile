DOCKER = docker

run: image
	docker run sparks-xrd

debug: image
	docker run -it --entrypoint /bin/bash sparks-xrd

image: Dockerfile hosted/yaww.py exec.sh
	$(DOCKER) build -t sparks-xrd .
	touch image

push: image
	`aws ecr get-login --region us-west-2`
	docker tag sparks-xrd:latest 010850123561.dkr.ecr.us-west-2.amazonaws.com/sparks-xrd:latest
	docker push 010850123561.dkr.ecr.us-west-2.amazonaws.com/sparks-xrd:latest
