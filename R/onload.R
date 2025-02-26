.onLoad = function(...) {
	requireNamespace("tmap", quietly = TRUE)
	requireNamespace("deckgl", quietly = TRUE)
	requireNamespace("data.table", quietly = TRUE)
	tmap::tmapMode("deck", "DeckGL", pitch = 60, basemap.show = TRUE, crs_basemap = 4326)
}

.TMAP_DECKGL = new.env(FALSE, parent = globalenv())
