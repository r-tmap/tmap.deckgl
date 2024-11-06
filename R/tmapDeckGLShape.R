#' @param bbx bbx
#' @export
#' @keywords internal
#' @name tmapDeckGLShape
#' @rdname tmapDeckGL
tmapDeckGLShape = function(bbx, facet_row, facet_col, facet_page, o) {
	dummy = get_deck(facet_row, facet_col, facet_page)

	

	bbx = sf::st_bbox(sf::st_transform(tmaptools::bb_poly(bbx), crs = 4326))

	ll = c(mean(bbx[c(1,3)]), mean(bbx[c(2,4)]))
	zoom = findZoom(bbx)

	deck = deckgl::deckgl(zoom = zoom, latitude = ll[2], longitude = ll[1], pitch = o$pitch) 

	assign_deck(deck, facet_row, facet_col, facet_page)

	NULL
}

#' @export
#' @keywords internal
#' @name tmapDeckGLOverlay
#' @rdname tmapDeckGL
tmapDeckGLOverlay = function(bbx, facet_row, facet_col, facet_page, o) {
	NULL	
}
