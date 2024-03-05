
site: index.html

index.html: main.md tr-template.html tr-style.css
	pandoc -o index.html --template=tr-template.html --css=pico.classless.slate.css --css=tr-style.css main.md

install:
	install index.html pico.classless.slate.css tr-style.css ../docs
