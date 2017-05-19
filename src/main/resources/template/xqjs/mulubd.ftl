<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Author>Administrator</Author>
  <LastAuthor>Administrator</LastAuthor>
  <Created>2012-06-29T06:46:37Z</Created>
  <LastSaved>2012-06-29T09:05:15Z</LastSaved>
  <Company>dpca</Company>
  <Version>11.9999</Version>
 </DocumentProperties>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>10800</WindowHeight>
  <WindowWidth>18180</WindowWidth>
  <WindowTopX>120</WindowTopX>
  <WindowTopY>105</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="19" ss:ExpandedRowCount="20000" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:Index="2" ss:AutoFitWidth="0" ss:Width="77.25"/>
   <Column ss:Index="12" ss:AutoFitWidth="0" ss:Width="66"/>
   <Column ss:AutoFitWidth="0" ss:Width="84.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="90.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="68.25"/>
   <Row>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">按件目录卸货点</Data></Cell>
    <Cell><Data ss:Type="String">UC类型</Data></Cell>
    <Cell><Data ss:Type="String">UC容量</Data></Cell>
    <Cell><Data ss:Type="String">UA类型</Data></Cell>
    <Cell><Data ss:Type="String">UA容量</Data></Cell>
    <Cell><Data ss:Type="String">参考系UC类型</Data></Cell>
    <Cell><Data ss:Type="String">参考系UC容量</Data></Cell>
    <Cell><Data ss:Type="String">参考系UA类型</Data></Cell>
    <Cell><Data ss:Type="String">参考系UA容量</Data></Cell>
    <Cell><Data ss:Type="String">参考系目录卸货点</Data></Cell>
    <Cell><Data ss:Type="String">差异</Data></Cell>
   </Row>
   
   <#list res as kdbdmulResult>
   <Row>
    <Cell><Data ss:Type="String">${kdbdmulResult.usercenter!''}</Data></Cell> 
    <Cell><Data ss:Type="String">${kdbdmulResult.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.xiehd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.uclx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.ucrl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.ualx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.uarl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.ckxuclx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.ckxucrl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.ckxualx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.ckxuarl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.ckxXiehd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdbdmulResult.chayi!''}</Data></Cell>
   </Row>
   </#list>
   
   
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <LeftColumnVisible>7</LeftColumnVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>1</ActiveRow>
     <ActiveCol>2</ActiveCol>
     <RangeSelection>R2C3:R2C19</RangeSelection>
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
