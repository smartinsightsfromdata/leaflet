% Please edit documentation in R/plugin-heatmap.R
\name{addHeatmap}
\alias{addHeatmap}
\title{Add a heatmap to the map.}
\usage{
addHeatmap(map, lng = NULL, lat = NULL, minOpacity = 0.05, intensity = NULL, 
    maxZoom = NULL, max = 1, radius = 25, blur = 15, gradient = NULL, layerId = NULL, 
    data = getMapData(map))
}
\arguments{
\item{map}{leaflet map to which you would like to add the heatmap}

\item{lng}{a numeric vector of longitudes, or a one-sided formula
of the form ~x where x is a variable in data;
by default (if not explicitly provided), it will be
automatically inferred from data by looking for a
column named lng, long, or longitude (case-insensitively)}

\item{lat}{a vector of latitudes or a formula
(similar to the lng argument; the names lat and
latitude are used when guessing the latitude column
from data)}

\item{minOpacity}{minimum opacity at which the heat will start}

\item{maxZoom}{zoom level where the points reach maximum intensity
(as intensity scales with zoom)}

\item{max}{maximum point intensity. The default is \code{1.0}}

\item{radius}{radius of each "point" of the heatmap.  The default is
\code{25}.}

\item{blur}{amount of blur to apply.  The default is \code{15}.
\code{blur=1} means no blur.}

\item{gradient}{palette name from \code{RColorBrewer} or an array of
of colors to be provided to \link{\code{colorNumeric}}}

\item{layerId}{optional string identifying this layer.  \code{layerId} can
be helpful in a dynamic/Shiny situation where you might want to
remove at some point}

\item{data}{the data object from which the argument values are derived; by default,
it is the data object provided to leaflet() initially,
but can be overridden}
}
\value{
modified map
}
\description{
Add a heatmap to the map.
}
\examples{
library(leaflet)

# match the heatmap demo from Leaflet.heat
# https://github.com/Leaflet/Leaflet.heat/blob/gh-pages/demo/index.html

# get the data to match exactly
addressPoints <- readLines(
  "http://leaflet.github.io/Leaflet.markercluster/example/realworld.10000.js"
)
addressPoints <- apply(
  jsonlite::fromJSON(
    sprintf("[\%s]",
      paste0(
        addressPoints[4:(length(addressPoints)-1)]
        ,collapse=""
      )
    )
  )
  ,MARGIN = 2
  ,as.numeric
)

addressPoints <- data.frame( addressPoints )
colnames( addressPoints ) <- c( "lat", "lng", "value" )

# create our heatmap
leaf <- leaflet( addressPoints ) \%>\%
  setView( 175.475,-37.87, 12 ) \%>\%
  addHeatmap(intensity=~value )

leaf

# or create a dot map-like heatmap
# create our heatmap
leaflet( addressPoints ) \%>\% addTiles() \%>\%
  setView( 175.475,-37.87, 12 ) \%>\%
  addHeatmap(intensity=~value, radius = 2, blur = 1,
             max = 1e-10, gradient = blues9[8:9] )

# customize our heatmap with options
leaf <- leaflet() \%>\%
  addTiles() \%>\%
  setView( 175.475,-37.87, 12 ) \%>\%
  addHeatmap(
    data = addressPoints,
    intensity = ~value,
    blur = 50,
    gradient = "Purples"
  )

leaf

# replicate the example provided by
#   http://www.d3noob.org/2014/02/generate-heatmap-with-leafletheat-and.html

earthquakes <- readLines(
  "http://bl.ocks.org/d3noob/raw/8973028/2013-earthquake.js"
)
earthquakes <- apply(
  jsonlite::fromJSON(
    sprintf("[\%s]",
            paste0(
              earthquakes[5:(length(earthquakes)-1)]
              ,collapse=""
            )
    )
  )
  ,MARGIN = 2
  ,as.numeric
)

earthquakes = data.frame( earthquakes )
leaflet( earthquakes ) \%>\%
  addTiles() \%>\%
  setView( 174.146, -41.5546, 10 ) \%>\%
  addHeatmap(
    lat = ~X1,
    lng = ~X2,
    intensity = ~X3,
    radius = 20,
    blur = 15,
    maxZoom = 17
  )

#  using data(quakes)
data(quakes)

leaflet(quakes) \%>\%
  addTiles( ) \%>\%
  setView( 178, -20, 5 ) \%>\%
  addHeatmap( lng = ~long, intensity = ~mag,
              blur = 20, max = 0.02, radius = 10,
              gradient = "Greys" )

# to remove the heatmap
leaf \%>\% clearHeatmap()
}
