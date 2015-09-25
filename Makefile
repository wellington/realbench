install:
	git submodule update --init
	npm install

clean:
	rm build/*

wt:
	wt compile --sass-dir=multi --build=build multi/*.scss

wtmulti:
	wt compile --multi --sass-dir=multi --build=build multi/*.scss

post:
	time gulp post

nodesass:
	time gulp sass

single:
	time gulp post
	time gulp sass
	time wt

create:
	sh create.sh
