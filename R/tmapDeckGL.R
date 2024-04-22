

get_facet_id = function(row, col, nrow, ncol) {
	col + (row - 1L) * ncol
}

get_deck = function(facet_row, facet_col, facet_page) {
	decks = get("decks", envir = .TMAP_DECKGL)
	nrow = get("nrow", envir = .TMAP_DECKGL)
	ncol = get("ncol", envir = .TMAP_DECKGL)
	
	decksi = decks[[facet_page]]
	
	fr = max(1, facet_row) # facet_row can be -1 or -2
	fc = max(1, facet_col) # facet_row can be -1 or -2
	
	deckid = get_facet_id(fr, fc, nrow, ncol)
	
	decksi[[deckid]]
}

assign_deck = function(deck, facet_row, facet_col, facet_page) {
	decks = get("decks", envir = .TMAP_DECKGL)
	nrow = get("nrow", envir = .TMAP_DECKGL)
	ncol = get("ncol", envir = .TMAP_DECKGL)
	
	
	fr = max(1, facet_row) # facet_row can be -1 or -2
	fc = max(1, facet_col) # facet_row can be -1 or -2
	
	
	
	deckid = get_facet_id(fr, fc, nrow, ncol)
	
	decks[[facet_page]][[deckid]] = deck
	assign("decks", decks, envir = .TMAP_DECKGL)
	NULL
}

#' @param label label
#' @export
#' @keywords internal
#' @name tmapDeckGLWrap
#' @rdname tmapDeckGL
tmapDeckGLWrap = function(label, facet_row, facet_col, facet_page, o) {
	NULL
}


#' @export
#' @keywords internal
#' @name tmapDeckGLXtab
#' @rdname tmapDeckGL
tmapDeckGLXtab = function(label, facet_row, facet_col, facet_page, o) {
	NULL
}
