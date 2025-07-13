SITE_URL := compostintraining.club
DATE := $(shell date "+%Y-%m-%d %H:%M:%S")

.PHONY: all clean build

all: serve

build:
	echo "### Building site ###"
	mkdir _site
	pandoc -s --template templates/compostintraining.club.html \
		--metadata title="compostintraining.club" \
		--include-in-header=src/scripts/analytics.js \
		-o _site/index.html index.md
	cp CNAME _site
	cp submodules/robots.txt/robots.txt _site

clean:
	rm -f _site