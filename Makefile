run: image
	docker run ingest-test

debug: image
	docker run -it --entrypoint /bin/bash ingest-test

image: Dockerfile
	docker build -t ingest-test .
	touch image

