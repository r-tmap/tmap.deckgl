tmapDeckGLTilesPrep = function(a, bs, id, o) {
	tiles = lapply(1L:length(bs), function(i) a)
	.TMAP_DECKGL$tiles[[id]] = tiles
	paste0(a$server, collapse = "__")
}

tmapDeckGLTiles = function(bi, bbx, facet_row, facet_col, facet_page, id, pane, group, o) {
	
	deck = get_deck(facet_row, facet_col, facet_page)
	
	rc_text = frc(facet_row, facet_col)
	
	
	tiles = .TMAP_DECKGL$tiles[[id]][[bi]]
	
	for (s in tiles$server) {
		s2 = switch(s, Voyager = "voyager", DarkMatter = "dark-matter", "positron")
		deck = deckgl::add_basemap(deck, style = deckgl::use_carto_style(s2))
	}
	
	assign_deck(deck, facet_row, facet_col, facet_page)
	NULL	
}

tmapDeckGLGridPrep = function(a, bs, id, o) {
	
	grid_intervals = vapply(bs, function(b) {
		# implementation similarish as plot mode but needs polishing
		dx = b[3] - b[1]	
		dy = b[4] - b[2]
		# if not specified, aim for 15 lines in total
		n.x = if (!is.na(a$n.x)) a$n.x else if (is.na(a$x)) 7.5 else length(a$x)
		n.y = if (!is.na(a$n.y)) a$n.y else if (is.na(a$y)) 7.5 else length(a$x)
		
		x = pretty30(b[c(1,3)], n=n.x, longlat = !is.na(a$crs) && sf::st_is_longlat(a$crs))
		y = pretty30(b[c(2,4)], n=n.y, longlat = !is.na(a$crs) && sf::st_is_longlat(a$crs))
		
		max((x[2] - x[1]), (y[2]-y[1]))
	}, FUN.VALUE = numeric(1))
	assign("grid_intervals", grid_intervals, envir = .TMAP_DECKGL)
	
	return("grid")
}

tmapDeckGLGrid = function(bi, bbx, facet_row, facet_col, facet_page, id, pane, group, o) {
	lf = get_lf(facet_row, facet_col, facet_page)
	rc_text = frc(facet_row, facet_col)
	
	grid_intervals = get("grid_intervals", envir = .TMAP_DECKGL)
	
	lf = DeckGL::addGraticule(lf, interval = grid_intervals[bi], options = pathOptions(pane = pane))
	
	
	assign_lf(lf, facet_row, facet_col, facet_page)
	NULL
}

tmapDeckGLGridXLab = function(bi, bbx, facet_row, facet_col, facet_page, o) {
	NULL
}

tmapDeckGLGridYLab = function(bi, bbx, facet_row, facet_col, facet_page, o) {
	NULL
}