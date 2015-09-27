export TIMEFORMAT=%3lR

FILES := short/*.scss
WTBIN=$(shell which wt)
SASSBIN=$(shell which sass)
SASSCBIN=$(shell which sassc)

test:
	time ls >/dev/null

install:
	git submodule update --init
	npm install
	@which sass
	@which wt

clean:
	-@rm build/*
	-@rm -rf .sass-cache

echo:
	@which sass
	@which wt


wt: clean
	@echo "\n======================"
	@echo "wellington"
	@echo "======================"
	-time $(WTBIN) compile --sass-dir=multi --build=build $(FILES) >/dev/null

wtmulti: clean
	@echo "\n======================"
	@echo "multi-threaded wellington"
	@echo "======================"
	-time $(WTBIN) compile --multi --sass-dir=multi --build=build $(FILES) >/dev/null

post: clean
	@echo "\n======================"
	@echo "postcss -- Grab a coffee, this can take several minutes"
	@echo "======================"
	time gulp post >/dev/null

nodesass: clean
	@echo "\n======================"
	@echo "node-sass"
	@echo "======================"
	time gulp sass >/dev/null

ruby: clean
	@echo "\n======================"
	@echo "ruby sass"
	@echo "======================"
	-time $(SASSBIN) -C --sourcemap=none --update short:build >/dev/null

sassc: clean
	@echo "\n======================"
	@echo "sassc"
	@echo "======================"
	-time sh sassc.sh >/dev/null

compass: clean
	@echo "\n======================"
	@echo "compass"
	@echo "======================"
	-time compass compile --css-dir=build --sass-dir=short >/dev/null
	$(MAKE) clean

bench: wt wtmulti sassc nodesass ruby compass post

create:
	sh create.sh
