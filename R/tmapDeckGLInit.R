
tmapDeckGLInit = function(o, return.asp = FALSE, vp) {
	if (return.asp) return(1)
	
	per_page = rep(o$ncols * o$nrows, o$npages)
	k = o$ncols * o$nrows * o$npages
	if (o$n < k) {
		per_page[o$npages] = per_page[o$npages] - (k - o$n)
	}
	

	decks = lapply(per_page, function(p) {
		lapply(seq_len(p), function(i) {
			list() #dummy
			#deckgl::deckgl(zoom = 2, latitude = 0, longitude = 0, pitch = o$pitch) 
			
		})
	})
	
	.TMAP_DECKGL$decks = decks
	.TMAP_DECKGL$nrow = o$nrows
	.TMAP_DECKGL$ncol = o$ncols
	.TMAP_DECKGL$leg_id = 1
	NULL
}

tmapDeckGLAux = function(o, q) {
	NULL
}
