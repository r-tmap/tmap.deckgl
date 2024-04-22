#' @param bs bs
#' @export
#' @keywords internal
#' @name tmapDeckGLTilesPrep
#' @rdname tmapDeckGL
tmapDeckGLTilesPrep = function(a, bs, id, o) {
	tiles = lapply(1L:length(bs), function(i) a)
	.TMAP_DECKGL$tiles[[id]] = tiles
	paste0(a$server, collapse = "__")
}

#' @export
#' @keywords internal
#' @name tmapDeckGLTiles
#' @rdname tmapDeckGL
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

#' @export
#' @keywords internal
#' @name tmapDeckGLGridPrep
#' @rdname tmapDeckGL
tmapDeckGLGridPrep = function(a, bs, id, o) {
	return("grid")
}

#' @param id id
#' @param pane pane
#' @param group group
#' @export
#' @keywords internal
#' @name tmapDeckGLGrid
#' @rdname tmapDeckGL
tmapDeckGLGrid = function(bi, bbx, facet_row, facet_col, facet_page, id, pane, group, o) {
	NULL
}

#' @param bi bi
#' @export
#' @keywords internal
#' @name tmapDeckGLGridXLab
#' @rdname tmapDeckGL
tmapDeckGLGridXLab = function(bi, bbx, facet_row, facet_col, facet_page, o) {
	NULL
}

#' @export
#' @keywords internal
#' @name tmapDeckGLGridYLab
#' @rdname tmapDeckGL
tmapDeckGLGridYLab = function(bi, bbx, facet_row, facet_col, facet_page, o) {
	NULL
}