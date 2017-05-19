<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-08-22T03:45:16Z</LastSaved>
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
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="10" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:AutoFitWidth="0" ss:Width="98.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="119.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="99"/>
   <Column ss:AutoFitWidth="0" ss:Width="95.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="117.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="85.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="102.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="93"/>
   <Row ss:Index="1">
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">容器盘点结果单</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String"></Data></Cell>
   </Row>
<#list list as table>
   <Row>
    <Cell><Data ss:Type="String">${table.pandbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.shij!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.wuld!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.caozy!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.rongqxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.wuls!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.pandqsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.pandhsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.pandcy!''}</Data></Cell>
   </Row>
</#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>7</ActiveRow>
     <ActiveCol>6</ActiveCol>
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
