<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <LastAuthor>Administrator</LastAuthor>
  <Created>2012-05-23T03:01:57Z</Created>
  <LastSaved>2012-05-25T07:10:25Z</LastSaved>
  <Version>11.9999</Version>
 </DocumentProperties>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>6795</WindowHeight>
  <WindowWidth>11340</WindowWidth>
  <WindowTopX>360</WindowTopX>
  <WindowTopY>15</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font x:Family="Swiss" ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s21">
   <NumberFormat/>
  </Style>
  <Style ss:ID="s24">
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s25">
   <NumberFormat ss:Format="Fixed"/>
  </Style>
  <Style ss:ID="s26">
   <NumberFormat ss:Format="0.000"/>
  </Style>
  <Style ss:ID="s27">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9" ss:Color="#000000"
    ss:Bold="1"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s28">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9" ss:Color="#000000"/>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s29">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9" ss:Color="#000000"
    ss:Bold="1"/>
   <NumberFormat ss:Format="@"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="gongyxhd">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1">
   <Column ss:StyleID="s21" ss:Width="62.25"/>
   <Column ss:StyleID="s21" ss:Width="54"/>
   <Column ss:StyleID="s21" ss:Width="58.5"/>
   <Column ss:StyleID="s24" ss:Width="69"/>
   <Column ss:StyleID="s21" ss:Width="58.5" ss:Span="1"/>
   <Column ss:Index="7" ss:StyleID="s21" ss:Width="69"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Span="1"/>
   <Column ss:Index="10" ss:StyleID="s21" ss:Width="91.5"/>
   <Column ss:StyleID="s21" ss:Width="51"/>
   <Column ss:StyleID="s21" ss:Width="58.5"/>
   <Column ss:StyleID="s21" ss:Width="69"/>
   <Column ss:StyleID="s21" ss:Width="44.25"/>
   <Column ss:StyleID="s21" ss:Width="58.5" ss:Span="1"/>
   <Column ss:Index="17" ss:StyleID="s21" ss:Width="69" ss:Span="3"/>
   <Column ss:Index="21" ss:StyleID="s21" ss:Width="80.25"/>
   <Column ss:StyleID="s21" ss:Width="58.5"/>
   <Column ss:StyleID="s21" ss:Width="91.5"/>
   <Column ss:StyleID="s21" ss:Width="69" ss:Span="3"/>
   <Column ss:Index="28" ss:StyleID="s21" ss:Width="80.25"/>
   <Column ss:StyleID="s21"/>
   <Column ss:StyleID="s21" ss:Width="69"/>
   <Column ss:StyleID="s21" ss:Width="58.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="38.25"/>
   <Row>
    <Cell ss:StyleID="s27"><Data ss:Type="String">工艺消耗点</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">工艺车身数</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">距申报点偏移时间</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">按需截止流水号</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">工艺标识</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">生产线编号</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">标识</Data></Cell>
   </Row>
   <#list rows as rowData>
   <Row>
    <Cell ss:StyleID="s28"><Data ss:Type="String">${rowData.gongyxhd!""}</Data></Cell>
    <Cell ss:StyleID="s28"><Data ss:Type="String">${rowData.chessl!""}</Data></Cell>
    <Cell ss:StyleID="s28"><Data ss:Type="String">${rowData.pianysj!""}</Data></Cell>
    <Cell ss:StyleID="s28"><Data ss:Type="String">${rowData.liush!""}</Data></Cell>
    <Cell ss:StyleID="s28"><Data ss:Type="String">${rowData.gongybs!""}</Data></Cell>
    <Cell ss:StyleID="s28"><Data ss:Type="String">${rowData.shengcxbh!""}</Data></Cell>
    <Cell ss:StyleID="s28"><Data ss:Type="String">${rowData.biaos!""}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <PageMargins x:Left="0.8" x:Right="0.8"/>
   </PageSetup>
   <DisplayPageBreak/>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>0</VerticalResolution>
   </Print>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>1</ActiveRow>
     <ActiveCol>3</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
