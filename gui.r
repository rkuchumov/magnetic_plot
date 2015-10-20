library(gWidgets)
library(gWidgetsRGtk2)

window <- gwindow(
	title  = msg$winTitle,
	width  = 500,
	height = 180,
)

statusBar <- gstatusbar(container = window)

windowGroup <- ggroup(
	container = window,
	horizontal = FALSE
)

ctrlLayout <- glayout(container = windowGroup)

samplesEdit <- gedit(container = ctrlLayout)
samplesButton <- gbutton(
	text      = msg$openBtn,
	container = ctrlLayout,
	handler   = function(h, ...)
	{
		gfile(
			text    = msg$openSamplesDialog,
			type    = "open",
			multi   = FALSE,
			handler = function(h, ...)
			{
				svalue(samplesEdit) <- h$file
				svalue(statusBar) <- ''
			},
			filter = list(
				"Text files" = list(patterns = c("*.txt","*.data","*.tab")),
				"All files" = list(patterns = c("*"))
			)
		)
	}
)

variationEdit <- gedit(container = ctrlLayout)
variationButton <- gbutton(
	text      = msg$openBtn,
	container = ctrlLayout,
	handler   = function(h, ...)
	{
		gfile(
			text    = msg$openVariationDialog,
			type    = "open",
			handler = function(h, ...)
			{
				svalue(variationEdit) <- h$file
				svalue(statusBar) <- ''
			},
			filter = list(
				"Text files" = list(patterns = c("*.txt","*.data","*.tab")),
				"All files" = list(patterns = c("*"))
			)
		)
	}
)

decimalCheckbox <- gcheckbox(
	text      = msg$decDelimLbl,
	checked   = unname(Sys.localeconv()["decimal_point"] == ","),
	container = ctrlLayout
)

drawButtonGroup <- ggroup(container = ctrlLayout)
addSpring(drawButtonGroup)

drawBtn <- gbutton(
	text      = msg$drawBtn,
	container = drawButtonGroup,
	handler   = function(h, ...)
	{
		if (svalue(decimalCheckbox))
			dec <- ','
		else
			dec <- '.'

		tryCatch(
			{
				samplesPath <- svalue(samplesEdit)
				samples <- readSamples(samplesPath, dec)

				variationPath <- svalue(variationEdit)
				variation <- readVariation(variationPath, dec)

				size(window) <- c(700, 700)

				if (dev.cur() == 2)
					graphics.off()

				visible(window) <- F
				ggraphics(container = windowGroup, expand = T)
				visible(window) <- T

				drawPlots(samples, variation)
			},
			error = function(e) {
				# TODO: print error message in statusbar
				svalue(statusBar) <- msg$readError
				print(e)
			}
		)
	}
)

ctrlLayout[1,1, anchor = c(1, 0)] <- msg$samplesLbl
ctrlLayout[1,2, expand = T] <- samplesEdit
ctrlLayout[1,3] <- samplesButton

ctrlLayout[2,1, anchor = c(1, 0)] <- msg$variationLbl
ctrlLayout[2,2, expand = T] <- variationEdit
ctrlLayout[2,3] <- variationButton

ctrlLayout[3, 2:3, anchor = c(-1, 0)] <- decimalCheckbox

ctrlLayout[4, 1] <- drawButtonGroup 
