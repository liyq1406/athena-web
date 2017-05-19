<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-08-22T03:45:16Z</LastSaved>
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
  <Table ss:ExpandedColumnCount="19" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:AutoFitWidth="0" ss:Width="98.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="119.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="99"/>
   <Column ss:AutoFitWidth="0" ss:Width="95.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="117.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="85.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="102.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="93"/>
   <Row ss:Index="1">
   <Cell ss:StyleID="s21"><Data ss:Type="String">要货令号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">备货单号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">仓库编号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">US号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">US型号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">零件编号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">零件名称</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">数量</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">零件单位</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">EL号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">批次号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">客户</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">上线类型</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">出库时间</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">流水号</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">配送类别</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">操作人</Data></Cell>
    <Cell ss:StyleID="s21"><Data ss:Type="String">备货人</Data></Cell>

   </Row>
<#list list as table>
   <Row>
     <Cell><Data ss:Type="String">${table.yaohlh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.beihdh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.cangkbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.ush!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.usxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.lingjsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.danw!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.elh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.pich!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.keh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.shangxfs!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.chukrq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.zhengclsh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.peislb!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.usercode!''}</Data></Cell>
    <Cell><Data ss:Type="String">${table.beihybh!''}</Data></Cell>
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
