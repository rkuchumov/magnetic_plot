source('locale.r')
source('input.r')
source('plots.r')
source('gui.r')

calcDiff <- function(samples, variation) {
	diff <- samples
	diff$values <- mapply(function(value, timestamp) {
		i <- which.min(abs(variation$timestamps - timestamp))
		return(value - variation[i,2])
	}, samples$values, samples$timestamps)

	return(diff)
}

samples <- readSamples('cal.txt')
variation <- readVariation('var.txt')
# 
# initPlots()
# plotSamples(samples)
# plotVariation(variation)
# plotDiff(calcDiff(samples, variation))
