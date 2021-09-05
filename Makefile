

all: download

build:
	docker build -t smangelsen/poca:latest .

download:
	bash ./update_podcasts.sh

clean:
	rm -rf podcasts/*
