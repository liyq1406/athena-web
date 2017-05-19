<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <LastAuthor> </LastAuthor>
  <Created>2015-06-27T02:51:48Z</Created>
  <Version>12.00</Version>
 </DocumentProperties>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>9840</WindowHeight>
  <WindowWidth>21360</WindowWidth>
  <WindowTopX>120</WindowTopX>
  <WindowTopY>60</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="11" ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s62">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s63">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="11" ss:Color="#000000"
    ss:Bold="1"/>
  </Style>
  <Style ss:ID="s64">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Color="#000000"
    ss:Bold="1"/>
  </Style>
  <Style ss:ID="s65">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s66">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="关联项错误信息">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="13.5">
   <Column ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="65.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="86.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="60"/>
   <Column ss:AutoFitWidth="0" ss:Width="244.5"/>
   
   <Row ss:AutoFitHeight="0" ss:Height="14.25" ss:StyleID="s63">
    <Cell ss:StyleID="s64"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">配送类型</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">生产线</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">CLASS</Data></Cell>
    <Cell><Data ss:Type="String">错误原因</Data></Cell>
   </Row>
   
   <#list rows as rowData>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s65"><Data ss:Type="String">${rowData.usercenter!""}</Data></Cell>
    <Cell ss:StyleID="s65"><Data ss:Type="String">${rowData.peislx!""}</Data></Cell>
    <Cell ss:StyleID="s65"><Data ss:Type="String">${rowData.shengcxbh!""}</Data></Cell>
    <Cell ss:StyleID="s66"><Data ss:Type="String">${rowData.lingjbh!""}</Data></Cell>
    <Cell ss:StyleID="s66"><Data ss:Type="String">${rowData.nclass!""}</Data></Cell>
    <Cell ss:StyleID="s66"><Data ss:Type="String">${rowData.errorMsg!""}</Data></Cell>
   </Row>
   </#list>
   
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Unsynced/>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>0</VerticalResolution>
   </Print>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>1</ActiveRow>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
