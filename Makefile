DOCKER = docker

run: image
	docker run ingest-test

debug: image
	docker run -it --entrypoint /bin/bash ingest-test

image: Dockerfile $(HOME)/src/dice-wrapper/Dockerfile hosted/yaww.py exec.sh $(HOME)/src/dice-wrapper/wrap.rb
	$(DOCKER) build -t ingest-test .
	touch image

