#' @method tmapDeckGLCompPrepare tm_chart
#' @export
tmapDeckGLCompPrepare.tm_chart = function(comp, o) {
	message("charts not implemented in view mode")
	comp
}

#' @method tmapDeckGLCompPrepare tm_chart_none
#' @export
tmapDeckGLCompPrepare.tm_chart_none = function(comp, o) {
	comp
}


#' @method tmapDeckGLCompWidth tm_chart
#' @export
tmapDeckGLCompWidth.tm_chart = function(comp, o) {
	comp
}

#' @method tmapDeckGLCompHeight tm_chart
#' @export
tmapDeckGLCompHeight.tm_chart = function(comp, o) {
	comp
}

#' @method tmapDeckGLLegPlot tm_chart_histogram
#' @export
tmapDeckGLLegPlot.tm_chart_histogram = function(comp, lf, o) {
	lf
}
#' @method tmapDeckGLLegPlot tm_chart
#' @export
tmapDeckGLLegPlot.tm_chart = function(comp, lf, o) {
	lf
}
