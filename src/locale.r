msg <- list(
	winTitle            = 'Magnetic field plots',
	samplesLbl          = 'Samples:',
	openBtn             = 'Open',
	openSamplesDialog   = 'Open file wiht samples data',
	variationLbl        = 'Variation:',
	openVariationDialog = 'Open file with variation data',
	decDelimLbl         = 'Use comma as decimal separator',
	drawBtn             = 'Draw plots',
	readError           = "Can't plot data for specified files",
	samplesPlotTitle    = 'Samples',
	samplesPlotYLable   = 'Value',
	samplesPlotXLable   = 'Picket',
	variationPlotTitle  = 'Variation',
	variationPlotYLable = 'Value',
	variationPlotXLable = 'Time',
	diffPlotTitle       = 'Output data',
	diffPlotYLable      = 'Anomaly values',
	diffPlotXLable      = 'Pickets',
	readyStatus         = 'Select samples and variation files to draw a plot',
	noSamples           = 'Samples file is not set',
	noVariation         = 'Variation file is not set'
)

msgRu <- list(
	winTitle            = 'Графики магнитного поля',
	samplesLbl          = 'Измеренные данные:',
	openBtn             = 'Открыть',
	openSamplesDialog   = 'Выбирете файл со измеренными данными',
	variationLbl        = 'Вариация:',
	openVariationDialog = 'Выбирете файл со значениями вариации',
	decDelimLbl         = 'Использовать запятую для разделения разрядов',
	drawBtn             = 'Построить графики',
	readError           = 'Не могу построить графики для указаных файлов, (см. run.log)',
	samplesPlotTitle    = 'Измеренные данных',
	samplesPlotYLable   = 'Значение',
	samplesPlotXLable   = 'Пикет',
	variationPlotTitle  = 'Вариация',
	variationPlotYLable = 'Значение',
	variationPlotXLable = 'Время',
	diffPlotTitle       = 'Выходные данные',
	diffPlotYLable      = 'Аномальные значения',
	diffPlotXLable      = 'Пикет',
	readyStatus         = 'Выбирите файлы с измеренными данными и вариацией для постороения графиков',
	noSamples           = 'Файл с отсчетами не выбран',
	noVariation         = 'Файл с вариацией не выбран'
)

# XXX: labes with russian text are ugly in windows
# if (.Platform$OS.type == 'windows') {
	# tryCatch({
	# 	Sys.setlocale('LC_ALL', 'rus')
	# 	msg <- msgRu
	# },
	# warning = function(e) {
	# 	print(e)
	# })
# } else 

if (.Platform$OS.type == 'unix' && Sys.getenv('LANG') == 'ru_RU.UTF-8') {
	msg <- msgRu
}
