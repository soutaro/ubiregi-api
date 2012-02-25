index.html: src/*.haml
	ruby tools/convert-to-html.rb src/main.haml > index.html

clean:
	rm *.html

