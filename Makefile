build:
	docker build -t 3d .
run: build
	docker run -it 3d
dev: build
	docker run -it -v ${CURDIR}:/tmp/3darbitrage --entrypoint=/bin/bash 3d
