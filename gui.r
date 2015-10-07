library(gWidgets)
library(gWidgetsRGtk2)

win <- gwindow(
	title  = msg$winTitle,
	width  = 500,
	height = 180,
)

statusBar <- gstatusbar("", container = win)

winGrp <- ggroup(
	container = win,
	horizontal = FALSE)

tbl <- glayout(container = winGrp)
tbl[1,1, anchor = c(1, 0)] <- msg$samplesLbl
tbl[1,2, expand = T] <- gedit(container = tbl)
tbl[1,3] <- gbutton(
	text      = msg$openBtn,
	container = tbl,
	handler   = function(h, ...)
	{
		gfile(
			text    = msg$openSamplesDialog,
			type    = "open",
			multi   = FALSE,
			handler = function(h, ...)
			{
				tmp <- tbl[1,2]
				svalue(tmp) <- h$file
				svalue(statusBar) <- ''
			},
			filter = list(
				"Text files" = list(patterns = c("*.txt","*.data","*.tab")),
				"All files" = list(patterns = c("*"))
			)
		)
	}
)

tbl[2,1, anchor = c(1, 0)] <- msg$variationLbl
tbl[2,2, expand = T] <- gedit(container = tbl)
tbl[2,3] <- gbutton(
	text      = msg$openBtn,
	container = tbl,
	handler   = function(h, ...)
	{
		gfile(
			text    = msg$openVariationDialog,
			type    = "open",
			handler = function(h, ...)
			{
				tmp <- tbl[2,2]
				svalue(tmp) <- h$file
				svalue(statusBar) <- ''
			},
			filter = list(
				"Text files" = list(patterns = c("*.txt","*.data","*.tab")),
				"All files" = list(patterns = c("*"))
			)
		)
	}
)

tbl[3, 2:3, anchor = c(-1, 0)] <- gcheckbox(
	text      = msg$decDelimLbl,
	checked   = unname(Sys.localeconv()["decimal_point"] == ","),
	container = tbl
)

tbl[4, 1] <- ggroup(container = tbl)
drawBtn <- gbutton(
	text      = msg$drawBtn,
	container = tbl[4,1],
	handler   = function(h, ...)
	{
		if (svalue(tbl[3,2]))
			dec <- ','
		else
			dec <- '.'

		ok <- TRUE

		samplesPath <- svalue(tbl[1,2])
		if (samplesPath == '') {
			# TODO
			svalue(statusBar) <- 'Samples are not set'
			return()
		}

		tryCatch(
			{
				samples <- readSamples(samplesPath, dec)
			},
			error = function(e) {
				svalue(statusBar) <- paste(msg$readError, samplesPath)
				print(e)
				ok <<- FALSE
			}
		)

		if (!ok)
			return()

		print(ok)
		variationPath <- svalue(tbl[2,2])
		if (variationPath == '') {
			# TODO
			svalue(statusBar) <- 'variationPath not set'
			return()
		}
		tryCatch(
			{
				variation <- readVariation(variationPath, dec)
			},
			error = function(e) {
				svalue(statusBar) <- paste(msg$readError, variationPath)
				print(e)
				ok <<- FALSE
			}
		)

		if (!ok)
			return()

		size(win) <- c(800, 700)


		add(winGrp, ggraphics())
		plotDev <- dev.cur()
		dev.set(plotDev)

		initPlots()
		plotSamples(samples)
		plotVariation(variation)
		plotDiff(calcDiff(samples, variation))
	}
)
addSpring(tbl[4, 1])

