#' @export
renderTmapDeckGL = function(expr, env, quoted, execOnResize) {
	if (!quoted) {
		expr <- substitute(expr)
	}
	expr = substitute(getFromNamespace("print.tmap", "tmap")(expr, in.shiny = TRUE))
	htmlwidgets::shinyRenderWidget(expr, deckgl::deckglOutput, env, quoted = TRUE)	
}

#' @export
tmapOutputDeckGL = function(outputId, width, height) {
	deckgl::deckglOutput(outputId, width = width, height = height)
}

#' @export
tmapProxyDeckGL = function(mapId, session, x) {
	print.tmap(x, dg = deckgl::deckgl_proxy(mapId, session), show = FALSE, in.shiny = TRUE, proxy = TRUE)
}
