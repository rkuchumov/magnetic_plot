library(gWidgets)
library(gWidgetsRGtk2)

options(guiToolkit="RGtk2")

gui <- new.env()

StartGUI <- function() {
	gui$window <- gwindow(
		title  = msg$winTitle,
		width  = 500,
		height = 180,
		handler = function(h, ...) {
			rm(gui, pos = 1)
		}
	)

	gui$statusBar <- gstatusbar(container = gui$window)

	gui$windowGroup <- ggroup(
		container = gui$window,
		horizontal = FALSE
	)

	gui$ctrlLayout <- glayout(container = gui$windowGroup)

	gui$samplesEdit <- gedit(container = gui$ctrlLayout)
	gui$samplesButton <- gbutton(
		text      = msg$openBtn,
		container = gui$ctrlLayout,
		handler   = function(h, ...)
		{
			gfile(
				text    = msg$openSamplesDialog,
				type    = "open",
				multi   = FALSE,
				handler = function(h, ...)
				{
					svalue(gui$samplesEdit) <- h$file
					svalue(gui$statusBar) <- ''
				},
				filter = list(
					"Text files" = list(patterns = c("*.txt","*.data","*.tab")),
					"All files" = list(patterns = c("*"))
				)
			)
		}
	)

	gui$variationEdit <- gedit(container = gui$ctrlLayout)
	gui$variationButton <- gbutton(
		text      = msg$openBtn,
		container = gui$ctrlLayout,
		handler   = function(h, ...)
		{
			gfile(
				text    = msg$openVariationDialog,
				type    = "open",
				handler = function(h, ...)
				{
					svalue(gui$variationEdit) <- h$file
					svalue(gui$statusBar) <- ''
				},
				filter = list(
					"Text files" = list(patterns = c("*.txt","*.data","*.tab")),
					"All files" = list(patterns = c("*"))
				)
			)
		}
	)

	gui$decimalCheckbox <- gcheckbox(
		text      = msg$decDelimLbl,
		checked   = unname(Sys.localeconv()["decimal_point"] == ","),
		container = gui$ctrlLayout
	)

	gui$drawButtonGroup <- ggroup(container = gui$ctrlLayout)
	addSpring(gui$drawButtonGroup)

	gui$drawBtn <- gbutton(
		text      = msg$drawBtn,
		container = gui$drawButtonGroup,
		handler   = function(h, ...)
		{
			if (svalue(gui$decimalCheckbox))
				dec <- ','
			else
				dec <- '.'

			tryCatch(
				{
					samplesPath <- svalue(gui$samplesEdit)
					samples <- ReadSamples(samplesPath, dec)

					variationPath <- svalue(gui$variationEdit)
					variation <- ReadVariation(variationPath, dec)

					size(gui$window) <- c(700, 700)

					if (dev.cur() == 2)
						graphics.off()

					visible(gui$window) <- FALSE
					ggraphics(container = gui$windowGroup, expand = TRUE)
					visible(gui$window) <- TRUE

					DrawPlots(samples, variation)
				},
				error = function(e) {
					# TODO: print error message in statusbar
					svalue(gui$statusBar) <- msg$readError
					print(e)
				}
			)
		}
	)

	gui$ctrlLayout[1,1, anchor = c(1, 0)] <- msg$samplesLbl
	gui$ctrlLayout[1,2, expand = TRUE] <- gui$samplesEdit
	gui$ctrlLayout[1,3] <- gui$samplesButton

	gui$ctrlLayout[2,1, anchor = c(1, 0)] <- msg$variationLbl
	gui$ctrlLayout[2,2, expand = TRUE] <- gui$variationEdit
	gui$ctrlLayout[2,3] <- gui$variationButton

	gui$ctrlLayout[3, 2:3, anchor = c(-1, 0)] <- gui$decimalCheckbox

	gui$ctrlLayout[4, 1] <- gui$drawButtonGroup 
}

MainGUILoop <- function() {
	while (exists('gui', mode =	'environment')) {
		Sys.sleep(1)
	}
}
