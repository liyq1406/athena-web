<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-06-29T09:00:04Z</LastSaved>
  <Version>11.5606</Version>
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
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="26" ss:ExpandedRowCount="900000" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Row>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件号</Data></Cell>
    
    <Cell><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell><Data ss:Type="String">供应商名称</Data></Cell>
    <Cell><Data ss:Type="String">承运商代码</Data></Cell>
    <Cell><Data ss:Type="String">承运商名称</Data></Cell>
    
    <Cell><Data ss:Type="String">P0</Data></Cell>
    <Cell><Data ss:Type="String">P0</Data></Cell>
    <Cell><Data ss:Type="String">P0差异</Data></Cell>
    <Cell><Data ss:Type="String">P1</Data></Cell>
    <Cell><Data ss:Type="String">P1</Data></Cell>
    <Cell><Data ss:Type="String">P1差异</Data></Cell>
    <Cell><Data ss:Type="String">P2</Data></Cell>
    <Cell><Data ss:Type="String">P2</Data></Cell>
    <Cell><Data ss:Type="String">P2差异</Data></Cell>
    <Cell><Data ss:Type="String">P3</Data></Cell>
    <Cell><Data ss:Type="String">P3</Data></Cell>
    <Cell><Data ss:Type="String">P3差异</Data></Cell>
    <Cell><Data ss:Type="String">P4</Data></Cell>
    <Cell><Data ss:Type="String">P4</Data></Cell>
    <Cell><Data ss:Type="String">P4差异</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">零件单位</Data></Cell>
    <Cell><Data ss:Type="String">计划员组</Data></Cell>
    <Cell><Data ss:Type="String">订货路线</Data></Cell>
    <Cell><Data ss:Type="String">产线</Data></Cell>
   </Row>
    <#list list as maoxqCmp>
   <Row>
    <Cell><Data ss:Type="String">${maoxqCmp.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.lingjbh!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${maoxqCmp.gongysbh!''}</Data></Cell> 
    <Cell><Data ss:Type="String">${maoxqCmp.gongysmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.gcbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.chengysmc!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${maoxqCmp.p0Cyc1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p0Cyc2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p0Margin!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p1Cyc1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p1Cyc2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p1Margin!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p2Cyc1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p2Cyc2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p2Margin!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p3Cyc1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p3Cyc2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p3Margin!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p4Cyc1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p4Cyc2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.p4Margin!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.danw!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.jihyz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.zhizlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqCmp.chanx!''}</Data></Cell>
   </Row>  
    </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <LeftColumnVisible>3</LeftColumnVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>1</ActiveRow>
     <ActiveCol>25</ActiveCol>
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
