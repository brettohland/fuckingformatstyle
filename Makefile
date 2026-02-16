.PHONY: build build-fck build-gosh serve deploy deploy-fck deploy-gosh clean

build: build-fck

build-fck:
	@echo "Building fuckingformatstyle.com"
	hugo
	rm -rf public/_includes
	./markup.sh public

build-gosh:
	@echo "Building goshdarnformatstyle.com"
	hugo --config config-gosh.toml
	rm -rf public/_includes
	./markup.sh public

serve:
	hugo server

deploy: deploy-fck deploy-gosh

deploy-fck: build-fck
	rsync -avz --delete public/ $${USER}@$${HOST}:~/$${FCK}
	@echo "fuckingformatstyle.com is updated"

deploy-gosh: build-gosh
	rsync -avz --delete public/ $${USER}@$${HOST}:~/$${GOSH}
	@echo "goshdarnformatstyle.com is updated"

clean:
	rm -rf public/
