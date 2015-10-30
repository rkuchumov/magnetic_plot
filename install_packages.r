if (.Platform$OS.type == 'windows') {
	packages <- c("gWidgets", "gWidgetstcltk")
} else {
	packages <- c("gWidgets", "gWidgetsRGtk2")
}

mirrow <- "http://cran.rstudio.com/"

p <- setdiff(packages, rownames(installed.packages()))
if (length(p) > 0) {
	install.packages(p, repos=mirrow)
} else {
	message("Required packages are already installed")
}

