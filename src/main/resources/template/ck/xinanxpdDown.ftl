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
  <Table ss:ExpandedColumnCount="22" ss:ExpandedRowCount="900000" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Row>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">产线</Data></Cell>
    <Cell><Data ss:Type="String">消耗点编号</Data></Cell>
    
    <Cell><Data ss:Type="String">整车流水号</Data></Cell>
	<Cell><Data ss:Type="String">待消耗</Data></Cell>
	
	<Cell><Data ss:Type="String">异常待消耗</Data></Cell>
	<Cell><Data ss:Type="String">待交付</Data></Cell>
	<Cell><Data ss:Type="String">SPPV消耗量</Data></Cell>
	<Cell><Data ss:Type="String">盈余量</Data></Cell>
	
	<Cell><Data ss:Type="String">盘点实际库存</Data></Cell>
	<Cell><Data ss:Type="String">差异</Data></Cell>
	<Cell><Data ss:Type="String">上次计算时间</Data></Cell>
	<Cell><Data ss:Type="String">模式</Data></Cell>
	<Cell><Data ss:Type="String">盘点时间</Data></Cell>
	<Cell><Data ss:Type="String">盘点人</Data></Cell>
   </Row>
    <#list list as ppl>
   <Row>
    <Cell><Data ss:Type="String">${ppl.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.shengcxbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.xiaohd!''}</Data></Cell>
   
    <Cell><Data ss:Type="String">${ppl.zhengclsh!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.daixh!''}</Data></Cell>
	
	<Cell><Data ss:Type="String">${ppl.yicdxh!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.daijf!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.xiaohl!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.yingyl!''}</Data></Cell>
	
	<Cell><Data ss:Type="String">${ppl.pandljsl!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.chay!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.anxscjssj!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.mos!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.pandtime!''}</Data></Cell>
	<Cell><Data ss:Type="String">${ppl.creator!''}</Data></Cell>
   </Row>  
    </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <LeftColumnVisible>0</LeftColumnVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>1</ActiveRow>
     <ActiveCol>21</ActiveCol>
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
