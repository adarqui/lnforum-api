build:
	stack build --fast

clean:
	stack clean


build-watch:
	stack build --fast --file-watch

docs:
	cabal haddock --hyperlink-source

ghci:
	stack ghci ln-api
