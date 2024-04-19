.onLoad = function(...) {
	requireNamespace("tmap", quietly = TRUE)
	requireNamespace("deckgl", quietly = TRUE)
	requireNamespace("data.table", quietly = TRUE)
	tmap::tmapMode("deck", "DeckGL", pitch = 60, basemap.show = TRUE)
	
}

.TMAP_DECKGL = new.env(FALSE, parent = globalenv())
