readSamples <- function(samplesFile, decimalDelim = ',') {
	if (samplesFile == '')
		stop(msg$noSamples)

	samples <- read.table(samplesFile, dec = decimalDelim)

	return(data.frame(
		pickets    = samples[,1],
		timestamps = strptime(samples[,2], '%H:%M:%S'),
		values     = samples[,3])
	)

}

readVariation <- function(variationFile, decimalDelim = ',') {
	if (variationFile == '')
		stop(msg$noVariation)

	variation <- read.table(variationFile, dec = decimalDelim)

	return(data.frame(
		timestamps = strptime(variation[,1], '%H:%M:%S'),
		values     = variation[,2])
	)
}
