msg <- list(
	winTitle            = 'Magnitic field plots',
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
	diffPlotXLable      = 'Pickets'
)

if (Sys.getenv('LANG') == 'ru_RU.UTF-8') {
	msg <- list(
		winTitle            = 'Графики магнитного поля',
		samplesLbl          = 'Измеренные данные:',
		openBtn             = 'Открыть',
		openSamplesDialog   = 'Выбирете файл со измеренными данными',
		variationLbl        = 'Вариация:',
		openVariationDialog = 'Выбирете файл со значениями вариации',
		decDelimLbl         = 'Использовать запятую для разделения разрядов',
		drawBtn             = 'Построить графики',
		readError           = 'Не могу построить графики для указаных файлов',
		samplesPlotTitle    = 'Измеренные данных',
		samplesPlotYLable   = 'Значение',
		samplesPlotXLable   = 'Пикет',
		variationPlotTitle  = 'Вариация',
		variationPlotYLable = 'Значение',
		variationPlotXLable = 'Время',
		diffPlotTitle       = 'Выходные данные',
		diffPlotYLable      = 'Аномальные значения',
		diffPlotXLable      = 'Пикет'
	)
}
