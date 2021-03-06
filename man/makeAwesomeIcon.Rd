% Please edit documentation in R/plugin-awesomeMarkers.R
\name{makeAwesomeIcon}
\alias{makeAwesomeIcon}
\title{Make Awesome Icon}
\usage{
makeAwesomeIcon(icon = "home", library = "glyphicon", markerColor = "blue", 
    iconColor = "white", spin = FALSE, extraClasses = NULL)
}
\arguments{
\item{icon}{Name of the icon}

\item{library}{Which icon library. Default \code{'glyphicon'}, other possible
values are \code{'fa'} (fontawesome) or \code{'ion'} (ionicons).}

\item{markerColor}{Possible values are \code{'red'}, \code{'darkred'},
\code{'orange'}, \code{'green'}, \code{'darkgreen'}, \code{'blue'},
\code{'purple'}, \code{'darkpuple'}, \code{'cadetblue'}}

\item{iconColor}{The color to use for the icon itself. Use any CSS-valid
color (hex, rgba, etc.) or a named web color.}

\item{spin}{If \code{TRUE}, make the icon spin (only works when \code{library
= 'fa'})}

\item{extraClasses}{Additional css classes to include on the icon.}
}
\description{
Make Awesome Icon
}
