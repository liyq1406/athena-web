<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-09-04T04:00:52Z</LastSaved>
  <Version>11.9999</Version>
 </DocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <RemovePersonalInformation/>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>4530</WindowHeight>
  <WindowWidth>8505</WindowWidth>
  <WindowTopX>480</WindowTopX>
  <WindowTopY>120</WindowTopY>
  <AcceptLabelsInFormulas/>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s21">
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s63">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Color="#FF0000"/>
  </Style>
  <Style ss:ID="s64">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Color="#FF0000"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:AutoFitWidth="0" ss:Width="60.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:Index="4" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="73.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="74.25"/>
   <Row>
    <Cell ss:StyleID="s63"><Data ss:Type="String">usercenter</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">xiehztbh</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">gcbh</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">daohsj</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">facsj</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">xuh</Data></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s63"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">卸货站台编组</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">承运商</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">到货时间偏量</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">发出时间偏量</Data></Cell>
    <Cell ss:StyleID="s63"><Data ss:Type="String">序号</Data></Cell>
   </Row>
<#list rows as rowData>
   <Row>
    <Cell><Data ss:Type="String">${rowData.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.xiehztbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.gcbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${(rowData.daohsj!'')?c}</Data></Cell>
    <Cell><Data ss:Type="String">${(rowData.facsj!'')?c}</Data></Cell>
    <Cell><Data ss:Type="String">${(rowData.xuh!'')?c}</Data></Cell> 
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
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
     <ActiveCol>4</ActiveCol>
     <RangeSelection>C5</RangeSelection>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="Sheet2">
  <Table ss:ExpandedColumnCount="0" ss:ExpandedRowCount="0" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25"/>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="Sheet3">
  <Table ss:ExpandedColumnCount="0" ss:ExpandedRowCount="0" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25"/>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
