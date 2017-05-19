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
    <Cell><Data ss:Type="String">零件号</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">供应商</Data></Cell>
    <Cell><Data ss:Type="String">制造路线</Data></Cell>
    <Cell><Data ss:Type="String">零件单位</Data></Cell>
    <Cell><Data ss:Type="String">P0基准</Data></Cell>
    <Cell><Data ss:Type="String">P0比较数</Data></Cell>
    <Cell><Data ss:Type="String">P0比例</Data></Cell>
    <Cell><Data ss:Type="String">P1基准</Data></Cell>
    <Cell><Data ss:Type="String">P1比较数</Data></Cell>
    <Cell><Data ss:Type="String">P1比例</Data></Cell>
    <Cell><Data ss:Type="String">P2基准</Data></Cell>
    <Cell><Data ss:Type="String">P2比较数</Data></Cell>
    <Cell><Data ss:Type="String">P2比例</Data></Cell>
    <Cell><Data ss:Type="String">P3基准</Data></Cell>
    <Cell><Data ss:Type="String">P3比较数</Data></Cell>
    <Cell><Data ss:Type="String">P3比例</Data></Cell>
   </Row>
    <#list rows as dingdresult>
   <Row>
    <Cell><Data ss:Type="String">${dingdresult.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.zhongwmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.zhizlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.danw!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.jizhunSlp0!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaoSlp0!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaop0!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.jizhunSlp1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaoSlp1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaop1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.jizhunSlp2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaoSlp2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaop2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.jizhunSlp3!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaoSlp3!''}</Data></Cell>
    <Cell><Data ss:Type="String">${dingdresult.bijiaop3!''}</Data></Cell>
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
