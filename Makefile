.PHONY: build clean

build:
	mkdir dist
	cp -r src/* dist
	pipenv requirements > requirements.txt
	pip install -r requirements.txt -t dist
	(cd dist && zip -r ../lambda_function.zip .)

clean:
	rm -rf dist
	rm requirements.txt
	rm lambda_function.zip