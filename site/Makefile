
site: index.html feed.rss

index.html: site.scrbl site.css db-table.rkt
	racket site.scrbl > index.html

feed.rss: feed.rkt db-table.rkt
	racket feed.rkt > feed.rss

install:
	install index.html feed.rss ../docs
