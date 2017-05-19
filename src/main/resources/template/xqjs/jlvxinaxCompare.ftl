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
  <Table ss:ExpandedColumnCount="50" ss:ExpandedRowCount="200000" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s21" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:Index="3" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="72"/>
   <Column ss:Index="8" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="88.5"
    ss:Span="3"/>
    <Row>
    <Cell ss:MergeAcross="13"><Data ss:Type="String">${kaisrq!''}</Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
    <Cell><Data ss:Type="String"></Data></Cell>
   </Row>
   <Row>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">产线</Data></Cell>
    <Cell><Data ss:Type="String">JLV J0</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J0</Data></Cell>
    <Cell><Data ss:Type="String">差额J0</Data></Cell>
    <Cell><Data ss:Type="String">JLV J1</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J1</Data></Cell>
    <Cell><Data ss:Type="String">差额J1</Data></Cell>
    <Cell><Data ss:Type="String">JLV J2</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J2</Data></Cell>
    <Cell><Data ss:Type="String">差额J2</Data></Cell>
    <Cell><Data ss:Type="String">JLV J3</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J3</Data></Cell>
    <Cell><Data ss:Type="String">差额J3</Data></Cell>
    <Cell><Data ss:Type="String">JLV J4</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J4</Data></Cell>
    <Cell><Data ss:Type="String">差额J4</Data></Cell>
    <Cell><Data ss:Type="String">JLV J5</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J5</Data></Cell>
    <Cell><Data ss:Type="String">差额J5</Data></Cell>
    <Cell><Data ss:Type="String">JLV J6</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J6</Data></Cell>
    <Cell><Data ss:Type="String">差额J6</Data></Cell>
    <Cell><Data ss:Type="String">JLV J7</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J7</Data></Cell>
    <Cell><Data ss:Type="String">差额J7</Data></Cell>
    <Cell><Data ss:Type="String">JLV J8</Data></Cell>
    <Cell><Data ss:Type="String">DDBH J8</Data></Cell>
    <Cell><Data ss:Type="String">差额J8</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">比较日期</Data></Cell>
   </Row>
   <#list rows as bean>
   <Row>
    <Cell><Data ss:Type="String">${bean.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.chanx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.jlvj0!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj0!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj0!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj1!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj2!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj3!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj3!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj3!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj4!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj4!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj4!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj5!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj5!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj5!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj6!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj6!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj6!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj7!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj7!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj7!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.jlvj8!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xinaxj8!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.marginj8!''}</Data></Cell>
    
    <Cell><Data ss:Type="String">${bean.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.bijrq!''}</Data></Cell>
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
