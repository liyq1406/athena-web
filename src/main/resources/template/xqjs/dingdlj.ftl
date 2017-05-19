<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2000-11-18T06:53:49Z</LastSaved>
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
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="14" ss:ExpandedRowCount="200000" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Row>
    <Cell><Data ss:Type="String">订单号</Data></Cell>
    <Cell><Data ss:Type="String">零件号</Data></Cell>
    <Cell><Data ss:Type="String">订货车间</Data></Cell>
    <Cell><Data ss:Type="String">包装容量</Data></Cell>
    <Cell><Data ss:Type="String">P0</Data></Cell>
    <Cell><Data ss:Type="String">P1</Data></Cell>
    <Cell><Data ss:Type="String">P2</Data></Cell>
    <Cell><Data ss:Type="String">P3</Data></Cell>
	<Cell><Data ss:Type="String">P4</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">发货地</Data></Cell>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">供应商代码</Data></Cell>
	<Cell><Data ss:Type="String">计划员组</Data></Cell>
   </Row>
  <#list dataSource as bean>
   <Row>
    <Cell><Data ss:Type="String">${bean.dingdh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.dinghcj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.uabzucsl!''}</Data></Cell> 
    <Cell><Data ss:Type="String">${bean.p0sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.p1sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.p2sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.p3sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.p4sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.zhongwmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.fahd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.jihyz!''}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>6</ActiveRow>
     <ActiveCol>5</ActiveCol>
     <RangeSelection>R6C6:R7C6</RangeSelection>
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
