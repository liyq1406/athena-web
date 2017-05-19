<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>猫酷酷的</Created>
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
  <Table ss:ExpandedColumnCount="26" ss:ExpandedRowCount="200000" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s21" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:Index="3" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="72"/>
   <Column ss:Index="8" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="88.5"
    ss:Span="3"/>
   <Row>
    <Cell><Data ss:Type="String">调拨申请单号</Data></Cell>
    <Cell><Data ss:Type="String">成本中心</Data></Cell>
    <Cell><Data ss:Type="String">申请时间</Data></Cell>
    <Cell><Data ss:Type="String">申请人</Data></Cell>
    <Cell><Data ss:Type="String">调拨单状态</Data></Cell>
    <Cell><Data ss:Type="String">零件号</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">申报数量</Data></Cell>
    <Cell><Data ss:Type="String">实批数量</Data></Cell>
    <Cell><Data ss:Type="String">制造路线</Data></Cell>
    <Cell><Data ss:Type="String">要货时间</Data></Cell>
    <Cell><Data ss:Type="String">计划员代码</Data></Cell>
   </Row>
     <#list rows as rowData>
   	<Row>
  	    <Cell><Data ss:Type="String">${rowData.diaobsqdh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.chengbzx!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.diaobsqsj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.creator!''}</Data></Cell>
            <Cell><Data ss:Type="String">${rowData.zhuangt!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.lingjbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.lingjmc!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.shenbsl!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.shipsl!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.lux!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.yaohsj!''}</Data></Cell>
            <Cell><Data ss:Type="String">${rowData.jihy!''}</Data></Cell>
   	</Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>6</ActiveRow>
     <ActiveCol>2</ActiveCol>
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
