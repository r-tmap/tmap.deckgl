#' Internal tmap methods
#' 
#' Internal tmap methods 
#'
#' @param comp the shape object
#' @param o the list of options
#' @param deck deck object
#' @export
#' @keywords internal
#' @name tmapDeckGLCompPrepare
#' @rdname tmapDeckGL
tmapDeckGLCompPrepare = function(comp, o) {
	UseMethod("tmapDeckGLCompPrepare")
}

#' @export
#' @keywords internal
#' @name tmapDeckGLCompHeight
#' @rdname tmapDeckGL
tmapDeckGLCompHeight = function(comp, o) {
	UseMethod("tmapDeckGLCompHeight")
}

#' @export
#' @keywords internal
#' @name tmapDeckGLCompWidth
#' @rdname tmapDeckGL
tmapDeckGLCompWidth = function(comp, o) {
	UseMethod("tmapDeckGLCompWidth")
}

#' @export
#' @keywords internal
#' @name tmapDeckGLLegPlot
#' @rdname tmapDeckGL
tmapDeckGLLegPlot = function(comp, deck, o) {
	UseMethod("tmapDeckGLLegPlot")
}


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
tmapDeckGLLegPlot.tm_chart_histogram = function(comp, deck, o) {
	deck
}
#' @method tmapDeckGLLegPlot tm_chart
#' @export
tmapDeckGLLegPlot.tm_chart = function(comp, deck, o) {
	deck
}
