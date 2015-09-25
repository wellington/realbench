export TIMEFORMAT=%3lR

test:
	time ls >/dev/null

install:
	git submodule update --init
	npm install

clean:
	rm build/*

wt:
	@echo "wellington"
	@echo "======================"
	time wt compile --sass-dir=multi --build=build short/*.scss >/dev/null

wtmulti:
	@echo "multi-threaded wellington"
	@echo "======================"
	time wt compile --multi --sass-dir=multi --build=build short/*.scss >/dev/null

post:
	@echo "postcss Grab a coffee, this can take several minutes"
	@echo "======================"
	time gulp post >/dev/null

nodesass:
	@echo "node-sass"
	@echo "======================"
	time gulp sass >/dev/null

bench: wt wtmulti nodesass post

create:
	sh create.sh
