<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-01-13T05:23:02Z</LastSaved>
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
 <Worksheet ss:Name="要车计划_${YAOCJHXH}">
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:AutoFitWidth="0" ss:Width="70.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:AutoFitWidth="0" ss:Width="76.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="97.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="88.5"/>
   <Row ss:StyleID="s21">
    <Cell><Data ss:Type="String">车辆型号</Data></Cell>
    <Cell><Data ss:Type="String">运输路线</Data></Cell>
    <Cell><Data ss:Type="String">运输商编码</Data></Cell>
    <Cell><Data ss:Type="String">是否满载</Data></Cell>
    <Cell><Data ss:Type="String">到车时间</Data></Cell>
    <Cell><Data ss:Type="String">发运时间</Data></Cell>
   </Row>
   
   <#list ycjh as  MX>
   <Row>
    <Cell><Data ss:Type="String">${MX.JIHCX!''}</Data></Cell>
    <Cell><Data ss:Type="String">${MX.YUNSLX!''}</Data></Cell>
    <Cell><Data ss:Type="String">${MX.YUNSSBM!''}</Data></Cell>
    <Cell><Data ss:Type="String">${MX.SHIFMZ!''}</Data></Cell>
    <Cell><Data ss:Type="String">${MX.DAOCSJ!''}</Data></Cell>
    <Cell><Data ss:Type="String">${MX.FAYSJ!''}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
