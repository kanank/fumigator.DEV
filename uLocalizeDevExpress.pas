unit uLocalizeDevExpress;

interface

uses Windows, SysUtils, cxClasses,
  cxGridStrs, cxFilterConsts, cxFilterControlStrs, cxPivotGridStrs, cxEditConsts;

procedure Localization();
implementation

procedure Localization();
var
  sWindowsLanguage: String;
begin
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Удалить запись?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Удалить все выделенные записи?');

  cxSetResourceString(@scxGridNoDataInfoText, '<Нет данных для отображения>');

  cxSetResourceString(@scxGridFilterRowInfoText, 'Кликните здесь для создания фильтра');
  cxSetResourceString(@scxGridNewItemRowInfoText, 'Кликните здесь для добавления новой строки');

  cxSetResourceString(@scxGridFilterIsEmpty, '<Фильтр пуст>');

  cxSetResourceString(@scxGridCustomizationFormCaption, 'Настройка');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Колонки');
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Перетащите заголовок колонки сюда для группировки по этой колонке');
  cxSetResourceString(@scxGridFilterApplyButtonCaption, 'Применить фильтр');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Настроить...');
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, 'Кликните сюда для отображения/скрытия/перемещения колонок');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Разделы');
  cxSetResourceString(@scxGridBandsQuickCustomizationHint, 'Кликните сюда для отображения/скрытия/перемещения разделов');

  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Строки');

  cxSetResourceString(@scxGridConverterIntermediaryMissing, 'Missing an intermediary component!'#13#10'Please add a %s component to the form.');
  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid does not exist');
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Component does not exist');
  cxSetResourceString(@scxImportErrorCaption, 'Ошибка импорта');

  cxSetResourceString(@scxNotExistGridView, 'Grid view не существует');
  cxSetResourceString(@scxNotExistGridLevel, 'Активный grid level не существует');
  cxSetResourceString(@scxCantCreateExportOutputFile, 'Невозможно создать выходной файл экспорта');

  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem, 'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control');

  // date ranges

  cxSetResourceString(@scxGridYesterday, 'Вчера');
  cxSetResourceString(@scxGridToday, 'Сегодня');
  cxSetResourceString(@scxGridTomorrow, 'Завтра');
  cxSetResourceString(@scxGridLast30Days, 'Последние 30 дней');
  cxSetResourceString(@scxGridLast14Days, 'Последние 14 дней');
  cxSetResourceString(@scxGridLast7Days, 'Последние 7 дней');
  cxSetResourceString(@scxGridNext7Days, 'Следующие 7 дней');
  cxSetResourceString(@scxGridNext14Days, 'Следующие 14 дней');
  cxSetResourceString(@scxGridNext30Days, 'Следующие 30 дней');
  cxSetResourceString(@scxGridLastTwoWeeks, 'Последние 2 недели');
  cxSetResourceString(@scxGridLastWeek, 'Последняя неделя');
  cxSetResourceString(@scxGridThisWeek, 'Эта неделя');
  cxSetResourceString(@scxGridNextWeek, 'Следующая неделя');
  cxSetResourceString(@scxGridNextTwoWeeks, 'Следующие 2 недели');
  cxSetResourceString(@scxGridLastMonth, 'Последний месяц');
  cxSetResourceString(@scxGridThisMonth, 'Этот месяц');
  cxSetResourceString(@scxGridNextMonth, 'Следующий месяц');
  cxSetResourceString(@scxGridLastYear, 'Последний год');
  cxSetResourceString(@scxGridThisYear, 'Этот год');
  cxSetResourceString(@scxGridNextYear, 'Следующий год');
  cxSetResourceString(@scxGridPast, 'Прошлое');
  cxSetResourceString(@scxGridFuture, 'Будущее');

  cxSetResourceString(@scxGridMonthFormat, 'mmmm yyyy');
  cxSetResourceString(@scxGridYearFormat, 'yyyy');

  // ChartView

  cxSetResourceString(@scxGridChartCategoriesDisplayText, 'Данные');

  cxSetResourceString(@scxGridChartValueHintFormat, '%s для %s - %s');  // series display text, category, value
  cxSetResourceString(@scxGridChartPercentValueTickMarkLabelFormat, '0%');

  cxSetResourceString(@scxGridChartToolBoxDataLevels, 'Уровни данных:');
  cxSetResourceString(@scxGridChartToolBoxDataLevelSelectValue, 'выберите значение');
  cxSetResourceString(@scxGridChartToolBoxCustomizeButtonCaption, 'Настроить диаграмму');

  cxSetResourceString(@scxGridChartNoneDiagramDisplayText, 'Нет диаграммы');
  cxSetResourceString(@scxGridChartColumnDiagramDisplayText, 'Колонка диаграммы');
  cxSetResourceString(@scxGridChartBarDiagramDisplayText, 'Панель диаграммы');
  cxSetResourceString(@scxGridChartLineDiagramDisplayText, 'Строка диаграммы');
  cxSetResourceString(@scxGridChartAreaDiagramDisplayText, 'Область диаграммы');
  cxSetResourceString(@scxGridChartPieDiagramDisplayText, 'Часть диаграммы');
  cxSetResourceString(@scxGridChartStackedBarDiagramDisplayText, 'Гистограмма');
  cxSetResourceString(@scxGridChartStackedColumnDiagramDisplayText, 'Колонки гистограммы');
  cxSetResourceString(@scxGridChartStackedAreaDiagramDisplayText, 'Область гистограммы');

  cxSetResourceString(@scxGridChartCustomizationFormSeriesPageCaption, 'Ряды');
  cxSetResourceString(@scxGridChartCustomizationFormSortBySeries, 'Сортировать по:');
  cxSetResourceString(@scxGridChartCustomizationFormNoSortedSeries, '<нет рядов>');
  cxSetResourceString(@scxGridChartCustomizationFormDataGroupsPageCaption, 'Группы данных');
  cxSetResourceString(@scxGridChartCustomizationFormOptionsPageCaption, 'Опции');

  cxSetResourceString(@scxGridChartLegend, 'Легенда');
  cxSetResourceString(@scxGridChartLegendKeyBorder, 'Key Border');
  cxSetResourceString(@scxGridChartPosition, 'Позиция');
  cxSetResourceString(@scxGridChartPositionDefault, 'По умолчанию');
  cxSetResourceString(@scxGridChartPositionNone, 'Нет');
  cxSetResourceString(@scxGridChartPositionLeft, 'Слева');
  cxSetResourceString(@scxGridChartPositionTop, 'Сверху');
  cxSetResourceString(@scxGridChartPositionRight, 'Справа');
  cxSetResourceString(@scxGridChartPositionBottom, 'Снизу');
  cxSetResourceString(@scxGridChartAlignment, 'Выравниввание');
  cxSetResourceString(@scxGridChartAlignmentDefault, 'По умолчанию');
  cxSetResourceString(@scxGridChartAlignmentStart, 'С начала');
  cxSetResourceString(@scxGridChartAlignmentCenter, 'По центру');
  cxSetResourceString(@scxGridChartAlignmentEnd, 'С конца');
  cxSetResourceString(@scxGridChartOrientation, 'Ориентация');
  cxSetResourceString(@scxGridChartOrientationDefault, 'По умолчанию');
  cxSetResourceString(@scxGridChartOrientationHorizontal, 'Горизонтальная');
  cxSetResourceString(@scxGridChartOrientationVertical, 'Вертикальная');
  cxSetResourceString(@scxGridChartBorder, 'Граница');
  cxSetResourceString(@scxGridChartTitle, 'Заголовок');
  cxSetResourceString(@scxGridChartToolBox, 'Окно настроек');
  cxSetResourceString(@scxGridChartDiagramSelector, 'Выбор диаграммы');
  cxSetResourceString(@scxGridChartOther, 'Другие');
  cxSetResourceString(@scxGridChartValueHints, 'Подсказки значения');

  cxSetResourceString(@scxGridLayoutViewCustomizeFormOk, 'OK');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormCancel, 'Отмена');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormApply, 'Применить');
  cxSetResourceString(@scxGridLayoutViewCustomizeWarningDialogCaption, 'Предупреждение');
  cxSetResourceString(@scxGridLayoutViewCustomizeWarningDialogMessage, 'Схема была изменена. Сохранить изменения?');
  cxSetResourceString(@scxGridLayoutViewCustomizeLayoutButtonCaption, 'Редактор схемы');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormTemplateCard, 'шаблон');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormViewLayout, 'Просмотр схемы');
  cxSetResourceString(@scxGridLayoutViewRecordCaptionDefaultMask, '[RecordIndex] of [RecordCount]');

  cxSetResourceString(@scxGridLockedStateImageText, 'Пожалуйста, подождите...');

  cxSetResourceString(@scxGridInplaceEditFormButtonCancel, 'Отмена');
  cxSetResourceString(@scxGridInplaceEditFormButtonUpdate, 'Обновление');
  cxSetResourceString(@scxGridInplaceEditFormSaveChangesQuery, 'Ваши данные были измененены. Вы хотите сохранить изменения?');

  // base operators
  cxSetResourceString(@cxSFilterOperatorEqual , 'равно');
  cxSetResourceString(@cxSFilterOperatorNotEqual , 'не равно');
  cxSetResourceString(@cxSFilterOperatorLess , 'меньше');
  cxSetResourceString(@cxSFilterOperatorLessEqual , 'меньше или равно');
  cxSetResourceString(@cxSFilterOperatorGreater , 'больше');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual , 'больше или равно');
  cxSetResourceString(@cxSFilterOperatorLike , 'like');
  cxSetResourceString(@cxSFilterOperatorNotLike , 'not like');
  cxSetResourceString(@cxSFilterOperatorBetween , 'between');
  cxSetResourceString(@cxSFilterOperatorNotBetween , 'not between');
  cxSetResourceString(@cxSFilterOperatorInList , 'in');
  cxSetResourceString(@cxSFilterOperatorNotInList , 'not in');

  cxSetResourceString(@cxSFilterOperatorYesterday , 'вчера');
  cxSetResourceString(@cxSFilterOperatorToday , 'сегодня');
  cxSetResourceString(@cxSFilterOperatorTomorrow , 'завтра');

  cxSetResourceString(@cxSFilterOperatorLast7Days , 'последние 7 дней');
  cxSetResourceString(@cxSFilterOperatorLastWeek , 'последняя неделя');
  cxSetResourceString(@cxSFilterOperatorLast14Days , 'последние 14 дней');
  cxSetResourceString(@cxSFilterOperatorLastTwoWeeks , 'последние 2 недели');
  cxSetResourceString(@cxSFilterOperatorLast30Days , 'последние 30 дней');
  cxSetResourceString(@cxSFilterOperatorLastMonth , 'последний месяц');
  cxSetResourceString(@cxSFilterOperatorLastYear , 'последний год');
  cxSetResourceString(@cxSFilterOperatorPast , 'прошедшее');

  cxSetResourceString(@cxSFilterOperatorThisWeek , 'эта неделя');
  cxSetResourceString(@cxSFilterOperatorThisMonth , 'этот месяц');
  cxSetResourceString(@cxSFilterOperatorThisYear , 'этот год');

  cxSetResourceString(@cxSFilterOperatorNext7Days , 'следующие 7 дней');
  cxSetResourceString(@cxSFilterOperatorNextWeek , 'следующая неделя');
  cxSetResourceString(@cxSFilterOperatorNext14Days , 'следующие 14 дней');
  cxSetResourceString(@cxSFilterOperatorNextTwoWeeks , 'следующие 2 недели');
  cxSetResourceString(@cxSFilterOperatorNext30Days , 'следующие 30 дней');
  cxSetResourceString(@cxSFilterOperatorNextMonth , 'следующий месяц');
  cxSetResourceString(@cxSFilterOperatorNextYear , 'следующий год');
  cxSetResourceString(@cxSFilterOperatorFuture , 'будущее');

  cxSetResourceString(@cxSFilterAndCaption , 'and');
  cxSetResourceString(@cxSFilterOrCaption , 'or');
  cxSetResourceString(@cxSFilterNotCaption , 'not');
  cxSetResourceString(@cxSFilterBlankCaption , 'пусто');
  // derived
  cxSetResourceString(@cxSFilterOperatorIsNull , 'пусто');
  cxSetResourceString(@cxSFilterOperatorIsNotNull , 'не пусто');
  cxSetResourceString(@cxSFilterOperatorBeginsWith , 'начинается с');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith , 'не начинается с');
  cxSetResourceString(@cxSFilterOperatorEndsWith , 'заканчивается на');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith , 'не заканчивается на');
  cxSetResourceString(@cxSFilterOperatorContains , 'содержит');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain , 'не содержит');
  // filter listbox's values
  cxSetResourceString(@cxSFilterBoxAllCaption , '(Все)');
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(Настроить...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(Пустые)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(Не пустые)');

  // cxFilterBoolOperator
cxSetResourceString(@cxSFilterBoolOperatorAnd , 'AND');        // all
cxSetResourceString(@cxSFilterBoolOperatorOr , 'OR');          // any
cxSetResourceString(@cxSFilterBoolOperatorNotAnd , 'NOT AND'); // not all
cxSetResourceString(@cxSFilterBoolOperatorNotOr , 'NOT OR');   // not any
//
cxSetResourceString(@cxSFilterRootButtonCaption , 'Фильтр');
cxSetResourceString(@cxSFilterAddCondition , 'Добавить &условие');
cxSetResourceString(@cxSFilterAddGroup , 'Добавить &группу');
cxSetResourceString(@cxSFilterRemoveRow , '&Удалить строку');
cxSetResourceString(@cxSFilterClearAll , 'Очистить &все');
cxSetResourceString(@cxSFilterFooterAddCondition , 'нажмите кнопку, чтобы добавить новое условие');

cxSetResourceString(@cxSFilterGroupCaption , 'применить текущие условия');
cxSetResourceString(@cxSFilterRootGroupCaption , '<root>');
cxSetResourceString(@cxSFilterControlNullString , '<пусто>');

cxSetResourceString(@cxSFilterErrorBuilding , 'Не возможно построить фильтр из источника данных');

//FilterDialog
cxSetResourceString(@cxSFilterDialogCaption , 'Настроить фильтр');
cxSetResourceString(@cxSFilterDialogInvalidValue , 'Неправильное значение');
cxSetResourceString(@cxSFilterDialogUse , 'Использовать');
cxSetResourceString(@cxSFilterDialogSingleCharacter , 'чтобы представить любой одиночный символ');
cxSetResourceString(@cxSFilterDialogCharactersSeries , 'чтобы представить любую последовательность символов');
cxSetResourceString(@cxSFilterDialogOperationAnd , 'AND');
cxSetResourceString(@cxSFilterDialogOperationOr , 'OR');
cxSetResourceString(@cxSFilterDialogRows , 'Показать строки, где:');

// FilterControlDialog
cxSetResourceString(@cxSFilterControlDialogCaption , 'Построитель фильтра');
cxSetResourceString(@cxSFilterControlDialogNewFile , 'untitled.flt');
cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption , 'Открыть существующий фильтр');
cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption , 'Сохранить активный фильтр в файл');
cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&Сохранить как...');
cxSetResourceString(@cxSFilterControlDialogActionSaveHint , 'Сохранить как|Сохранить активный фильтр в новый файл ');
cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&Открыть...');
cxSetResourceString(@cxSFilterControlDialogActionOpenHint , 'Открыть|Открыть существующий файл фильтра');
cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , '&Применить');
cxSetResourceString(@cxSFilterControlDialogActionOkCaption , 'OK');
cxSetResourceString(@cxSFilterControlDialogActionCancelCaption , 'Отмена');
cxSetResourceString(@cxSFilterControlDialogFileExt , 'flt');
cxSetResourceString(@cxSFilterControlDialogFileFilter , 'Фильтры (*.flt)|*.flt');
end;

initialization
  Localization();

end.
