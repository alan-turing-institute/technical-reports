
site: index.html feed.xml

index.html: site.scrbl site.css db-table.rkt
	racket site.scrbl > index.html

feed.xml: feed.rkt db-table.rkt
	racket feed.rkt > feed.xml

install:
	install index.html feed.xml ../docs
