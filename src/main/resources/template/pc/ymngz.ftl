<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-08-02T06:22:43Z</LastSaved>
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
 <Worksheet ss:Name="周期计划跟踪">
  <Table ss:ExpandedColumnCount="9" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:AutoFitWidth="0" ss:Width="92.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="84"/>
   <Column ss:AutoFitWidth="0" ss:Width="58.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="78"/>
   <Column ss:AutoFitWidth="0" ss:Width="108"/>
   <Column ss:AutoFitWidth="0" ss:Width="88.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="80.25" ss:Span="1"/>
   <Column ss:Index="9" ss:AutoFitWidth="0" ss:Width="71.25"/>
   <Row ss:StyleID="s21">
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">产线号</Data></Cell>
    <Cell><Data ss:Type="String">日期</Data></Cell>
    <Cell><Data ss:Type="String">零件号</Data></Cell>
    <Cell><Data ss:Type="String">计划生产数量</Data></Cell>
    <Cell><Data ss:Type="String">实际生产数量</Data></Cell>
    <Cell><Data ss:Type="String">当天差额</Data></Cell>
    <Cell><Data ss:Type="String">累计差额</Data></Cell>
    <Cell><Data ss:Type="String">延误工时</Data></Cell>
   </Row>
   
   <#list ymn as row >
   <Row ss:StyleID="s21">
    <Cell><Data ss:Type="String">${row.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.chanxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.shij!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.lingjsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.shijscsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.dantce!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.leijce!''}</Data></Cell>
    <Cell><Data ss:Type="String">${row.ywhour!''}</Data></Cell>
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
</Workbook>
