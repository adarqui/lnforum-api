build:
	stack build --file-watch

docs:
	cabal haddock --hyperlink-source

ghci:
	stack ghci ln-api
