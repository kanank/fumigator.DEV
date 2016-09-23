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
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, '������� ������?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, '������� ��� ���������� ������?');

  cxSetResourceString(@scxGridNoDataInfoText, '<��� ������ ��� �����������>');

  cxSetResourceString(@scxGridFilterRowInfoText, '�������� ����� ��� �������� �������');
  cxSetResourceString(@scxGridNewItemRowInfoText, '�������� ����� ��� ���������� ����� ������');

  cxSetResourceString(@scxGridFilterIsEmpty, '<������ ����>');

  cxSetResourceString(@scxGridCustomizationFormCaption, '���������');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, '�������');
  cxSetResourceString(@scxGridGroupByBoxCaption, '���������� ��������� ������� ���� ��� ����������� �� ���� �������');
  cxSetResourceString(@scxGridFilterApplyButtonCaption, '��������� ������');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, '���������...');
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, '�������� ���� ��� �����������/�������/����������� �������');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, '�������');
  cxSetResourceString(@scxGridBandsQuickCustomizationHint, '�������� ���� ��� �����������/�������/����������� ��������');

  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, '������');

  cxSetResourceString(@scxGridConverterIntermediaryMissing, 'Missing an intermediary component!'#13#10'Please add a %s component to the form.');
  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid does not exist');
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Component does not exist');
  cxSetResourceString(@scxImportErrorCaption, '������ �������');

  cxSetResourceString(@scxNotExistGridView, 'Grid view �� ����������');
  cxSetResourceString(@scxNotExistGridLevel, '�������� grid level �� ����������');
  cxSetResourceString(@scxCantCreateExportOutputFile, '���������� ������� �������� ���� ��������');

  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem, 'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control');

  // date ranges

  cxSetResourceString(@scxGridYesterday, '�����');
  cxSetResourceString(@scxGridToday, '�������');
  cxSetResourceString(@scxGridTomorrow, '������');
  cxSetResourceString(@scxGridLast30Days, '��������� 30 ����');
  cxSetResourceString(@scxGridLast14Days, '��������� 14 ����');
  cxSetResourceString(@scxGridLast7Days, '��������� 7 ����');
  cxSetResourceString(@scxGridNext7Days, '��������� 7 ����');
  cxSetResourceString(@scxGridNext14Days, '��������� 14 ����');
  cxSetResourceString(@scxGridNext30Days, '��������� 30 ����');
  cxSetResourceString(@scxGridLastTwoWeeks, '��������� 2 ������');
  cxSetResourceString(@scxGridLastWeek, '��������� ������');
  cxSetResourceString(@scxGridThisWeek, '��� ������');
  cxSetResourceString(@scxGridNextWeek, '��������� ������');
  cxSetResourceString(@scxGridNextTwoWeeks, '��������� 2 ������');
  cxSetResourceString(@scxGridLastMonth, '��������� �����');
  cxSetResourceString(@scxGridThisMonth, '���� �����');
  cxSetResourceString(@scxGridNextMonth, '��������� �����');
  cxSetResourceString(@scxGridLastYear, '��������� ���');
  cxSetResourceString(@scxGridThisYear, '���� ���');
  cxSetResourceString(@scxGridNextYear, '��������� ���');
  cxSetResourceString(@scxGridPast, '�������');
  cxSetResourceString(@scxGridFuture, '�������');

  cxSetResourceString(@scxGridMonthFormat, 'mmmm yyyy');
  cxSetResourceString(@scxGridYearFormat, 'yyyy');

  // ChartView

  cxSetResourceString(@scxGridChartCategoriesDisplayText, '������');

  cxSetResourceString(@scxGridChartValueHintFormat, '%s ��� %s - %s');  // series display text, category, value
  cxSetResourceString(@scxGridChartPercentValueTickMarkLabelFormat, '0%');

  cxSetResourceString(@scxGridChartToolBoxDataLevels, '������ ������:');
  cxSetResourceString(@scxGridChartToolBoxDataLevelSelectValue, '�������� ��������');
  cxSetResourceString(@scxGridChartToolBoxCustomizeButtonCaption, '��������� ���������');

  cxSetResourceString(@scxGridChartNoneDiagramDisplayText, '��� ���������');
  cxSetResourceString(@scxGridChartColumnDiagramDisplayText, '������� ���������');
  cxSetResourceString(@scxGridChartBarDiagramDisplayText, '������ ���������');
  cxSetResourceString(@scxGridChartLineDiagramDisplayText, '������ ���������');
  cxSetResourceString(@scxGridChartAreaDiagramDisplayText, '������� ���������');
  cxSetResourceString(@scxGridChartPieDiagramDisplayText, '����� ���������');
  cxSetResourceString(@scxGridChartStackedBarDiagramDisplayText, '�����������');
  cxSetResourceString(@scxGridChartStackedColumnDiagramDisplayText, '������� �����������');
  cxSetResourceString(@scxGridChartStackedAreaDiagramDisplayText, '������� �����������');

  cxSetResourceString(@scxGridChartCustomizationFormSeriesPageCaption, '����');
  cxSetResourceString(@scxGridChartCustomizationFormSortBySeries, '����������� ��:');
  cxSetResourceString(@scxGridChartCustomizationFormNoSortedSeries, '<��� �����>');
  cxSetResourceString(@scxGridChartCustomizationFormDataGroupsPageCaption, '������ ������');
  cxSetResourceString(@scxGridChartCustomizationFormOptionsPageCaption, '�����');

  cxSetResourceString(@scxGridChartLegend, '�������');
  cxSetResourceString(@scxGridChartLegendKeyBorder, 'Key Border');
  cxSetResourceString(@scxGridChartPosition, '�������');
  cxSetResourceString(@scxGridChartPositionDefault, '�� ���������');
  cxSetResourceString(@scxGridChartPositionNone, '���');
  cxSetResourceString(@scxGridChartPositionLeft, '�����');
  cxSetResourceString(@scxGridChartPositionTop, '������');
  cxSetResourceString(@scxGridChartPositionRight, '������');
  cxSetResourceString(@scxGridChartPositionBottom, '�����');
  cxSetResourceString(@scxGridChartAlignment, '�������������');
  cxSetResourceString(@scxGridChartAlignmentDefault, '�� ���������');
  cxSetResourceString(@scxGridChartAlignmentStart, '� ������');
  cxSetResourceString(@scxGridChartAlignmentCenter, '�� ������');
  cxSetResourceString(@scxGridChartAlignmentEnd, '� �����');
  cxSetResourceString(@scxGridChartOrientation, '����������');
  cxSetResourceString(@scxGridChartOrientationDefault, '�� ���������');
  cxSetResourceString(@scxGridChartOrientationHorizontal, '��������������');
  cxSetResourceString(@scxGridChartOrientationVertical, '������������');
  cxSetResourceString(@scxGridChartBorder, '�������');
  cxSetResourceString(@scxGridChartTitle, '���������');
  cxSetResourceString(@scxGridChartToolBox, '���� ��������');
  cxSetResourceString(@scxGridChartDiagramSelector, '����� ���������');
  cxSetResourceString(@scxGridChartOther, '������');
  cxSetResourceString(@scxGridChartValueHints, '��������� ��������');

  cxSetResourceString(@scxGridLayoutViewCustomizeFormOk, 'OK');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormCancel, '������');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormApply, '���������');
  cxSetResourceString(@scxGridLayoutViewCustomizeWarningDialogCaption, '��������������');
  cxSetResourceString(@scxGridLayoutViewCustomizeWarningDialogMessage, '����� ���� ��������. ��������� ���������?');
  cxSetResourceString(@scxGridLayoutViewCustomizeLayoutButtonCaption, '�������� �����');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormTemplateCard, '������');
  cxSetResourceString(@scxGridLayoutViewCustomizeFormViewLayout, '�������� �����');
  cxSetResourceString(@scxGridLayoutViewRecordCaptionDefaultMask, '[RecordIndex] of [RecordCount]');

  cxSetResourceString(@scxGridLockedStateImageText, '����������, ���������...');

  cxSetResourceString(@scxGridInplaceEditFormButtonCancel, '������');
  cxSetResourceString(@scxGridInplaceEditFormButtonUpdate, '����������');
  cxSetResourceString(@scxGridInplaceEditFormSaveChangesQuery, '���� ������ ���� ����������. �� ������ ��������� ���������?');

  // base operators
  cxSetResourceString(@cxSFilterOperatorEqual , '�����');
  cxSetResourceString(@cxSFilterOperatorNotEqual , '�� �����');
  cxSetResourceString(@cxSFilterOperatorLess , '������');
  cxSetResourceString(@cxSFilterOperatorLessEqual , '������ ��� �����');
  cxSetResourceString(@cxSFilterOperatorGreater , '������');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual , '������ ��� �����');
  cxSetResourceString(@cxSFilterOperatorLike , 'like');
  cxSetResourceString(@cxSFilterOperatorNotLike , 'not like');
  cxSetResourceString(@cxSFilterOperatorBetween , 'between');
  cxSetResourceString(@cxSFilterOperatorNotBetween , 'not between');
  cxSetResourceString(@cxSFilterOperatorInList , 'in');
  cxSetResourceString(@cxSFilterOperatorNotInList , 'not in');

  cxSetResourceString(@cxSFilterOperatorYesterday , '�����');
  cxSetResourceString(@cxSFilterOperatorToday , '�������');
  cxSetResourceString(@cxSFilterOperatorTomorrow , '������');

  cxSetResourceString(@cxSFilterOperatorLast7Days , '��������� 7 ����');
  cxSetResourceString(@cxSFilterOperatorLastWeek , '��������� ������');
  cxSetResourceString(@cxSFilterOperatorLast14Days , '��������� 14 ����');
  cxSetResourceString(@cxSFilterOperatorLastTwoWeeks , '��������� 2 ������');
  cxSetResourceString(@cxSFilterOperatorLast30Days , '��������� 30 ����');
  cxSetResourceString(@cxSFilterOperatorLastMonth , '��������� �����');
  cxSetResourceString(@cxSFilterOperatorLastYear , '��������� ���');
  cxSetResourceString(@cxSFilterOperatorPast , '���������');

  cxSetResourceString(@cxSFilterOperatorThisWeek , '��� ������');
  cxSetResourceString(@cxSFilterOperatorThisMonth , '���� �����');
  cxSetResourceString(@cxSFilterOperatorThisYear , '���� ���');

  cxSetResourceString(@cxSFilterOperatorNext7Days , '��������� 7 ����');
  cxSetResourceString(@cxSFilterOperatorNextWeek , '��������� ������');
  cxSetResourceString(@cxSFilterOperatorNext14Days , '��������� 14 ����');
  cxSetResourceString(@cxSFilterOperatorNextTwoWeeks , '��������� 2 ������');
  cxSetResourceString(@cxSFilterOperatorNext30Days , '��������� 30 ����');
  cxSetResourceString(@cxSFilterOperatorNextMonth , '��������� �����');
  cxSetResourceString(@cxSFilterOperatorNextYear , '��������� ���');
  cxSetResourceString(@cxSFilterOperatorFuture , '�������');

  cxSetResourceString(@cxSFilterAndCaption , 'and');
  cxSetResourceString(@cxSFilterOrCaption , 'or');
  cxSetResourceString(@cxSFilterNotCaption , 'not');
  cxSetResourceString(@cxSFilterBlankCaption , '�����');
  // derived
  cxSetResourceString(@cxSFilterOperatorIsNull , '�����');
  cxSetResourceString(@cxSFilterOperatorIsNotNull , '�� �����');
  cxSetResourceString(@cxSFilterOperatorBeginsWith , '���������� �');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith , '�� ���������� �');
  cxSetResourceString(@cxSFilterOperatorEndsWith , '������������� ��');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith , '�� ������������� ��');
  cxSetResourceString(@cxSFilterOperatorContains , '��������');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain , '�� ��������');
  // filter listbox's values
  cxSetResourceString(@cxSFilterBoxAllCaption , '(���)');
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(���������...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(������)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(�� ������)');

  // cxFilterBoolOperator
cxSetResourceString(@cxSFilterBoolOperatorAnd , 'AND');        // all
cxSetResourceString(@cxSFilterBoolOperatorOr , 'OR');          // any
cxSetResourceString(@cxSFilterBoolOperatorNotAnd , 'NOT AND'); // not all
cxSetResourceString(@cxSFilterBoolOperatorNotOr , 'NOT OR');   // not any
//
cxSetResourceString(@cxSFilterRootButtonCaption , '������');
cxSetResourceString(@cxSFilterAddCondition , '�������� &�������');
cxSetResourceString(@cxSFilterAddGroup , '�������� &������');
cxSetResourceString(@cxSFilterRemoveRow , '&������� ������');
cxSetResourceString(@cxSFilterClearAll , '�������� &���');
cxSetResourceString(@cxSFilterFooterAddCondition , '������� ������, ����� �������� ����� �������');

cxSetResourceString(@cxSFilterGroupCaption , '��������� ������� �������');
cxSetResourceString(@cxSFilterRootGroupCaption , '<root>');
cxSetResourceString(@cxSFilterControlNullString , '<�����>');

cxSetResourceString(@cxSFilterErrorBuilding , '�� �������� ��������� ������ �� ��������� ������');

//FilterDialog
cxSetResourceString(@cxSFilterDialogCaption , '��������� ������');
cxSetResourceString(@cxSFilterDialogInvalidValue , '������������ ��������');
cxSetResourceString(@cxSFilterDialogUse , '������������');
cxSetResourceString(@cxSFilterDialogSingleCharacter , '����� ����������� ����� ��������� ������');
cxSetResourceString(@cxSFilterDialogCharactersSeries , '����� ����������� ����� ������������������ ��������');
cxSetResourceString(@cxSFilterDialogOperationAnd , 'AND');
cxSetResourceString(@cxSFilterDialogOperationOr , 'OR');
cxSetResourceString(@cxSFilterDialogRows , '�������� ������, ���:');

// FilterControlDialog
cxSetResourceString(@cxSFilterControlDialogCaption , '����������� �������');
cxSetResourceString(@cxSFilterControlDialogNewFile , 'untitled.flt');
cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption , '������� ������������ ������');
cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption , '��������� �������� ������ � ����');
cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&��������� ���...');
cxSetResourceString(@cxSFilterControlDialogActionSaveHint , '��������� ���|��������� �������� ������ � ����� ���� ');
cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&�������...');
cxSetResourceString(@cxSFilterControlDialogActionOpenHint , '�������|������� ������������ ���� �������');
cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , '&���������');
cxSetResourceString(@cxSFilterControlDialogActionOkCaption , 'OK');
cxSetResourceString(@cxSFilterControlDialogActionCancelCaption , '������');
cxSetResourceString(@cxSFilterControlDialogFileExt , 'flt');
cxSetResourceString(@cxSFilterControlDialogFileFilter , '������� (*.flt)|*.flt');
end;

initialization
  Localization();

end.
