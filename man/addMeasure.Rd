% Please edit documentation in R/plugin-measure.R
\name{addMeasure}
\alias{addMeasure}
\title{Add a measure control to the map.}
\usage{
addMeasure(map, position = "topright", primaryLengthUnit = "feet", 
    secondaryLengthUnit = NULL, primaryAreaUnit = "acres", 
    secondaryAreaUnit = NULL, activeColor = "#ABE67E", completedColor = "#C8F2BE", 
    popupOptions = list(className = "leaflet-measure-resultpopup", 
        autoPanPadding = c(10, 10)))
}
\arguments{
\item{position}{standard \href{http://leafletjs.com/reference.html#control-positions}{Leaflet control position options}.}

\item{primaryLengthUnit,  secondaryLengthUnit}{units used to display length
results. secondaryLengthUnit is optional.
Valid values are \code{"feet"}, \code{"meters"}, \code{"miles"}, and \code{"kilometers"}.}

\item{primaryAreaUnit,  secondaryAreaUnit}{units used to display area results.
secondaryAreaUnit is optional.  Valid values are
\code{"acres"}, \code{"hectares"}, \code{"sqmeters"}, and \code{"sqmiles"}.}

\item{activeColor}{base color to use for map features rendered while
actively performing a measurement.
Value should be a color represented as a hexadecimal string.}

\item{completedColor}{base color to use for features generated
from a completed measurement.
Value should be a color represented as a hexadecimal string.}

\item{popupOptions}{\code{list} of ptions applied to the popup
of the resulting measure feature.
Properties may be any \href{http://leafletjs.com/reference.html#popup-options}{standard Leaflet popup options}.}
}
\value{
modified map
}
\description{
Add a measure control to the map.
}
\examples{
library(leaflet)

leaf <- leaflet() \%>\% addTiles() \%>\% # central park
fitBounds(-73.9, 40.75, -73.95, 40.8) \%>\% addMeasure()

leaf

# customizing
leaf \%>\% addMeasure(position = "bottomleft", primaryLengthUnit = "meters", 
    primaryAreaUnit = "sqmeters", activeColor = "#3D535D", completedColor = "#7D4479")

}
