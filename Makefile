.PHONY: build clean view serve deploy

build: node_modules
	npm run build

serve: node_modules
	npm run serve

clean:
	rm -rf build

view:
	open build/index.html

node_modules: package.json
	npm install


# Deployment.

RSYNCARGS := --compress --recursive --checksum --itemize-changes \
	--delete -e ssh --perms --chmod=Du=rwx,Dgo=rx,Fu=rw,Fog=r
DEST := dh:domains/approximate.computer/wax2017

deploy: clean build
	rsync $(RSYNCARGS) build/ $(DEST)
