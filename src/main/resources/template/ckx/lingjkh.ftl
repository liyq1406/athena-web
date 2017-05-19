<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-07-18T06:32:20Z</LastSaved>
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
  <Style ss:ID="s22">
   <NumberFormat ss:Format="@"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="lingjkh">
  <Table ss:ExpandedColumnCount="13" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Column ss:AutoFitWidth="0" ss:Width="84"/>
   <Column ss:AutoFitWidth="0" ss:Width="69.75"/>
   <Column ss:Index="6" ss:AutoFitWidth="0" ss:Width="69"/>
   <Column ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:Index="11" ss:StyleID="s22" ss:AutoFitWidth="0" ss:Width="65.25"/>
   <Column ss:StyleID="s22" ss:AutoFitWidth="0"/>
   <Column ss:AutoFitWidth="0" ss:Width="66"/>
   <Row ss:AutoFitHeight="0">
    <Cell><Data ss:Type="String">usercenter</Data></Cell>
    <Cell><Data ss:Type="String">lingjbh</Data></Cell>
    <Cell><Data ss:Type="String">kehbh</Data></Cell>
    <Cell><Data ss:Type="String">kehljh</Data></Cell>
    <Cell><Data ss:Type="String">kehljmc</Data></Cell>
    <Cell><Data ss:Type="String">fahzt</Data></Cell>
    <Cell><Data ss:Type="String">uabaoz</Data></Cell>
    <Cell><Data ss:Type="String">ualjsl</Data></Cell>
    <Cell><Data ss:Type="String">ucbaoz</Data></Cell>
    <Cell><Data ss:Type="String">ucljsl</Data></Cell>
    <Cell><Data ss:Type="String">shengxrq</Data></Cell>
    <Cell><Data ss:Type="String">shixrq</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">客户编号</Data></Cell>
    <Cell><Data ss:Type="String">客户零件号</Data></Cell>
    <Cell><Data ss:Type="String">客户零件名称</Data></Cell>
    <Cell><Data ss:Type="String">发货站台</Data></Cell>
    <Cell><Data ss:Type="String">UA包装</Data></Cell>
    <Cell><Data ss:Type="String">UA零件数量</Data></Cell>
    <Cell><Data ss:Type="String">UC包装</Data></Cell>
    <Cell><Data ss:Type="String">UC零件数量</Data></Cell>
    <Cell><Data ss:Type="String">生效日期</Data></Cell>
    <Cell><Data ss:Type="String">失效日期</Data></Cell>
   </Row>
 <#list rows as rowData>
   <Row>
    <Cell><Data ss:Type="String">${rowData.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.kehbh!''}</Data></Cell>   
    <Cell><Data ss:Type="String">${rowData.kehljh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.kehljmc!''}</Data></Cell>   
    <Cell><Data ss:Type="String">${rowData.fahzt!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.uabaoz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.ualjsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.ucbaoz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.ucljsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.shengxrq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${rowData.shixrq!''}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Unsynced/>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>2</ActiveRow>
     <ActiveCol>10</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
