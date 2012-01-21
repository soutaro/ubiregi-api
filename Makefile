all:
	ruby tools/convert-to-html.rb --layout _layouts/default.haml --output . src/*.haml

clean:
	rm *.html

