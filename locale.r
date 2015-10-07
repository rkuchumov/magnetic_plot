msg <- list(
	winTitle            = 'Magnitic field plots',
	samplesLbl          = 'Samples:',
	openBtn             = 'Open',
	openSamplesDialog   = 'Open file wiht samples data',
	variationLbl        = 'Variation:',
	openVariationDialog = 'Open file with variation data',
	decDelimLbl         = 'Use comma as decimal separator',
	drawBtn             = 'Draw plots',
	readError           = 'Can\' read '
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
		drawBtn             = 'Постороить графики',
		readError           = 'Не могу прочитать '
	)
}
