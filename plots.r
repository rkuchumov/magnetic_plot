initPlots <- function() {
	par(mfrow = c(3, 1))
}

plotSamples <- function(samples, xscale = 1, tscale = 1) {
	par(mar   = c(3, 5, 4, 2))

	plot(samples$pickets, samples$values,
		 xlab = '',
		 ylab = '',
		 type = "o",
		 pch  = 20,
		 axes = FALSE,
		 yaxs = 'i',
		 xaxs = 'i')

	axis(side = 1,
		 at   = seq(min(samples$pickets), max(samples$pickets), by = 1),
		 tck    = -0.04,
		 las  = 1)

	tTicksId = seq(1, length(samples$pickets), tscale)
	axis(side   = 3,
		 at     = samples$pickets[tTicksId],
		 labels = strftime(samples$timestamps[tTicksId], '%H:%M:%S'),
		 las    = 1,
		 tck    = -0.04)

	axis(side   = 2,
		 tck    = 1,
		 las    = 2,
		 col    = 'grey')

	title(main = 'Измеренные данные', line = 3)
	title(ylab = 'Значение', line = 3.5)
	title(xlab = 'Пикет', line = 2)

	box()
}

plotVariation <- function(variation) {
	par(mar   = c(5, 5, 4, 2))

	xtics = 1:length(variation$values)
	plot(xtics, variation$values,
		 type = "o",
		 xlab = '',
		 ylab = '',
		 pch  = 20,
		 axes = FALSE,
		 yaxs = 'i',
		 xaxs = 'i')

	axis(side = 1,
		 at   = xtics,
		 labels  = strftime(variation$timestamps, "%H:%M:%S"),
		 tck    = -0.04,
		 las  = 1)

	axis(side   = 2,
		 tck    = 1,
		 las    = 2,
		 col    = 'grey')

	title(main = 'Вариация', line = 1)
	title(ylab = 'Значение', line = 3.5)
	title(xlab = 'Время', line = 2)

	box()
}

plotDiff <- function(diff, xscale = 1, tscale = 1) {
	par(mar   = c(3, 5, 4, 2))

	plot(diff$pickets, diff$values,
		 xlab = '',
		 ylab = '',
		 type = "o",
		 pch  = 20,
		 axes = FALSE,
		 yaxs = 'i',
		 xaxs = 'i')

	axis(side = 1,
		 at   = seq(min(diff$pickets), max(diff$pickets), by = 1),
		 tck    = -0.04,
		 las  = 1)

	tTicksId = seq(1, length(diff$pickets), tscale)
	axis(side   = 3,
		 at     = diff$pickets[tTicksId],
		 labels = strftime(diff$timestamps[tTicksId], '%H:%M:%S'),
		 las    = 1,
		 tck    = -0.04)

	axis(side   = 2,
		 tck    = 1,
		 las    = 2,
		 col    = 'grey')

	title(main = 'Выходные данные', line = 3)
	title(ylab = 'Аномальные значения', line = 4)
	title(xlab = 'Пикет', line = 2)

	box()
}

