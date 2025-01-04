#' Deck mode options
#'
#' Deck mode options. These options are specific to the deck mode.
#'
#' @param pitch The pitch angle. By default 60
#' @param basemap.show Show basemap? By default TRUE
#' @example examples/deckgl.R
#' @export
tm_deck = function(pitch, basemap.show) {
	args = lapply(as.list(rlang::call_match(dots_expand = TRUE)[-1]), eval, envir = parent.frame())
	args$called_from = "tm_deck"
	do.call(tmap::tm_options, args)
}
