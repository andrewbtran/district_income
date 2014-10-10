R:

	Rscript -e "rmarkdown::render('data/district-income.Rmd')"
	open data/district-income.html

R_deploy:

	cp data/district-income.html /Volumes/www_html/multimedia/graphics/projectFiles/Rmd/
	rsync -rv data/district-income_files /Volumes/www_html/multimedia/graphics/projectFiles/Rmd
	open http://private.boston.com/multimedia/graphics/projectFiles/Rmd/district-income.html