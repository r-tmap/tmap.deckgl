# tmap.deckgl
tmap rendering in deck.gl

Installation
------------


```r
# install.packages("remotes")
install_github("r-tmap/tmap")
install_github("r-tmap/tmap.deckgl")
```

Example
------------


```r
library(tmap)
library(tmap.deckgl)

tmap_mode("deck")
tm_shape(World) + tm_polygons("HPI", fill.scale = tm_scale_intervals(values = "RdYlGn"))
```