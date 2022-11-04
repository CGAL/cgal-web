release_history_sloccount.png: release_history_sloccount.dat release_history_sloccount.plt
	gnuplot release_history_sloccount.plt

logos: cgal_logo_ipe_2013.png cgal_logo_ipe_2013-small.png cgal_logo_ipe_2013-big.png cgal_logo_ipe_2013_with_white_border.png cgal_logo_ipe_2013_with_white_border-small.png cgal_logo_ipe_2013_with_white_border-big.png

cgal_logo_ipe_2013.png: cgal_logo_ipe_2013.pdf
	pdftocairo -png -r 20.361 -cropbox -singlefile -transp cgal_logo_ipe_2013.pdf cgal_logo_ipe_2013

cgal_logo_ipe_2013-small.png: cgal_logo_ipe_2013.pdf
	pdftocairo -png -r 10 -cropbox -singlefile -transp cgal_logo_ipe_2013.pdf cgal_logo_ipe_2013-small

cgal_logo_ipe_2013-big.png: cgal_logo_ipe_2013.pdf
	pdftocairo -png -r 40 -cropbox -singlefile -transp cgal_logo_ipe_2013.pdf cgal_logo_ipe_2013-big

cgal_logo_ipe_2013_with_white_border.png: cgal_logo_ipe_2013_with_white_border.pdf
	pdftocairo -png -r 20.361 -cropbox -singlefile -transp cgal_logo_ipe_2013_with_white_border.pdf cgal_logo_ipe_2013_with_white_border

cgal_logo_ipe_2013_with_white_border-small.png: cgal_logo_ipe_2013_with_white_border.pdf
	pdftocairo -png -r 10 -cropbox -singlefile -transp cgal_logo_ipe_2013_with_white_border.pdf cgal_logo_ipe_2013_with_white_border-small

cgal_logo_ipe_2013_with_white_border-big.png: cgal_logo_ipe_2013_with_white_border.pdf
	pdftocairo -png -r 40 -cropbox -singlefile -transp cgal_logo_ipe_2013_with_white_border.pdf cgal_logo_ipe_2013_with_white_border-big
