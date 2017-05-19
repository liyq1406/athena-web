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
  <Table ss:ExpandedColumnCount="25" ss:ExpandedRowCount="900000" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Row>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">制造路线</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">法文零件名称</Data></Cell>
    <Cell><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell><Data ss:Type="String">供应商名称</Data></Cell>
    <Cell><Data ss:Type="String">承运商代码</Data></Cell>
    <Cell><Data ss:Type="String">承运商名称</Data></Cell>
    <Cell><Data ss:Type="String">零件单位</Data></Cell>
    <Cell><Data ss:Type="String">一月</Data></Cell>
    <Cell><Data ss:Type="String">二月</Data></Cell>
    <Cell><Data ss:Type="String">三月</Data></Cell>
    <Cell><Data ss:Type="String">四月</Data></Cell>
    <Cell><Data ss:Type="String">五月</Data></Cell>
    <Cell><Data ss:Type="String">六月</Data></Cell>
    <Cell><Data ss:Type="String">七月</Data></Cell>
    <Cell><Data ss:Type="String">八月</Data></Cell>
    <Cell><Data ss:Type="String">九月</Data></Cell>
    <Cell><Data ss:Type="String">十月</Data></Cell>
    <Cell><Data ss:Type="String">十一月</Data></Cell>
    <Cell><Data ss:Type="String">十二月</Data></Cell>
    <Cell><Data ss:Type="String">状态</Data></Cell>
   </Row>
    <#list list as ppl>
   <Row>
    <Cell><Data ss:Type="String">${ppl.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.zhizlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.fawmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.gongysdm!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${ppl.gongysmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.gcbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.chengysmc!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${ppl.lingjdw!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p0sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p1sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p2sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p3sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p4sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p5sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p6sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p7sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p8sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p9sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p10sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.p11sl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${ppl.zhuangt!''}</Data></Cell>
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
     <ActiveCol>24</ActiveCol>
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
