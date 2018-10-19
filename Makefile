run:
	docker build . -t suren
	docker run --rm -p 1234:80 suren