<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-07-18T04:03:00Z</LastSaved>
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
 </Styles>
 <Worksheet ss:Name="shengcx_lingj">
  <Table ss:ExpandedColumnCount="10" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:AutoFitWidth="0" ss:Width="73.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="62.25"/>
   <Column ss:Index="6" ss:AutoFitWidth="0" ss:Width="157.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="188.25"/>
   <Column ss:Index="9" ss:AutoFitWidth="0" ss:Width="111"/>
   <Column ss:AutoFitWidth="0" ss:Width="97.5"/>
   <Row>
    <Cell><Data ss:Type="String">usercenter</Data></Cell>
    <Cell><Data ss:Type="String">shengcxbh</Data></Cell>
    <Cell><Data ss:Type="String">lingjbh</Data></Cell>
    <Cell><Data ss:Type="String">zhizlx</Data></Cell>
    <Cell><Data ss:Type="String">cangkbh</Data></Cell>
    <Cell><Data ss:Type="String">zhuxfx</Data></Cell>
    <Cell><Data ss:Type="String">shifqyjjpl</Data></Cell>
    <Cell><Data ss:Type="String">jingjpl</Data></Cell>
    <Cell><Data ss:Type="String">youxbc</Data></Cell>
    <Cell><Data ss:Type="String">lingjlx</Data></Cell>
   </Row>   
   <Row>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">生产线编号</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">制造路线</Data></Cell>
    <Cell><Data ss:Type="String">仓库编号</Data></Cell>
    <Cell><Data ss:Type="String">主线/辅线(0,1,2,3,4,5)</Data></Cell>
    <Cell><Data ss:Type="String">是否取用经济批量(1：是，0：否)</Data></Cell>
    <Cell><Data ss:Type="String">经济批量</Data></Cell>
    <Cell><Data ss:Type="String">优先班次(B班 |C班)</Data></Cell>
    <Cell><Data ss:Type="String">零件类型(L:左|R:右)</Data></Cell>
   </Row>
   <#list rows as rowData>
   <Row>
    <Cell><Data ss:Type="String">${rowData.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.shengcxbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.zhizlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.cangkbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.zhuxfx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.shifqyjjpl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.jingjpl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.youxbc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.lingjlx!''}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>18</ActiveRow>
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
