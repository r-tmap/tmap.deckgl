library(deckgl)
library(sf)
# choropleth

### ** Examples

## @knitr contour-layer
data("sf_bike_parking")

contours <- list(
	use_contour_definition(
		threshold = 1,
		color = c(255, 0, 0),
		stroke_width = 2
	),
	use_contour_definition(
		threshold = 5,
		color = c(0, 255, 0),
		stroke_width = 3
	),
	use_contour_definition(
		threshold = 15,
		color = c(0, 0, 255),
		stroke_width = 5
	)
)

properties <- list(
	contours = contours,
	cellSize = 200,
	elevationScale = 4,
	getPosition = ~lng + lat
)



deckgl::add_geojson_layer()

library(deckgl)
World$color = rainbow(177)
World$elev = 1000000

deckgl(zoom = 3, pitch = 90) %>%
	add_geojson_layer(data = World,
					  #extruded = TRUE,
					  getFillColor = JS("object => object.color"),
					  #getElevation = JS("object => object.elev"),
					  
					  tooltip = JS("object => object.economy || object.HPI")) |> 
	add_basemap(style = use_carto_style("positron"))
	


# Grid layer example
data("sf_bike_parking")

props <- list(
	extruded = TRUE,
	cellSize = 200,
	elevationScale = 4,
	getPosition = ~lng + lat,
	tooltip = "Count: {{count}}"
)


#deckgl(zoom = 11, pitch = 45, latitude = 52, longitude = 5) %>%
deckgl(zoom = 11, pitch = 45) %>%
	add_basemap() %>%
	add_grid_layer(
		data = sf_bike_parking,
		properties = props
	)


metrodf = metro |> 
	cbind(st_coordinates(metro)) |> 
	st_drop_geometry()

props2 <- list(
	extruded = TRUE,
	cellSize = 20000,
	elevationScale = 3000,
	getPosition = ~X + Y,
	tooltip = "Count: {{count}}"
)

m = do.call(c, mapply(rep, 1:nrow(metrodf), round(metrodf$pop2020 / 1e3), SIMPLIFY = FALSE))

mdf = metrodf[m, ]


lapply(1:nrow(metrodf), function(i) {
	rep(metrodf[1,], 2)
})



deckgl(zoom = 3, pitch = 45, latitude = 52, longitude = 5) %>%
	add_basemap() %>%
	add_grid_layer(
		data = mdf,
		properties = props2
	)

sample_data <- paste0(
	"https://raw.githubusercontent.com/",
	"uber-common/deck.gl-data/",
	"master/website/sf-zipcodes.json"
)

properties <- list(
	pickable = TRUE,
	stroked = TRUE,
	filled = TRUE,
	wireframe = TRUE,
	lineWidthMinPixels = 1,
	getPolygon = ~geometry,
	getLineColor = c(80, 80, 80),
	getLineWidth = 1,
	tooltip = "{{zipcode}}<br/>Population: {{population}}"
)


deckgl(zoom = 11, pitch = 25) %>%
	add_polygon_layer(data = World, properties = properties) %>%
	add_basemap() %>%
	add_control("Polygon Layer")




#######

devtools::check_man()
devtools::load_all()
tmapMode("deck", "DeckGL", pitch = 30, basemap.show = TRUE)

library(tmap)

tmap_mode("deck")
tm_shape(World) + tm_polygons("HPI")

tmap_mode("view")
tm_shape(World) + tm_polygons("HPI")

tmap_mode("plot")
tm_shape(World) + tm_polygons("HPI")

