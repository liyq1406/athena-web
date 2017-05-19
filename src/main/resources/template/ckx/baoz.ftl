<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <LastAuthor>Administrator</LastAuthor>
  <Created>2012-09-07T05:40:00Z</Created>
  <LastSaved>2012-09-07T05:40:00Z</LastSaved>
  <Version>11.9999</Version>
 </DocumentProperties>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>6795</WindowHeight>
  <WindowWidth>11340</WindowWidth>
  <WindowTopX>360</WindowTopX>
  <WindowTopY>15</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font x:Family="Swiss" ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s44">
   <Alignment ss:Vertical="Center"/>
   <Font x:Family="Swiss"/>
  </Style>
  <Style ss:ID="s46">
   <Alignment ss:Vertical="Center"/>
  </Style>
  <Style ss:ID="s47">
   <Alignment ss:Vertical="Center"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s48">
   <Alignment ss:Vertical="Center"/>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s49">
   <Alignment ss:Vertical="Center"/>
   <NumberFormat ss:Format="0.000"/>
  </Style>
  <Style ss:ID="s51">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Bold="1"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s52">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font x:Family="Swiss"/>
  </Style>
  <Style ss:ID="s53">
   <Alignment ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s54">
   <Alignment ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9" ss:Color="#000000"/>
   <NumberFormat ss:Format="@"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="baoz">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s46">
   <Column ss:StyleID="s47" ss:Width="51"/>
   <Column ss:StyleID="s47" ss:AutoFitWidth="0" ss:Width="176.25"/>
   <Column ss:StyleID="s47" ss:Width="40.5"/>
   <Column ss:StyleID="s47" ss:Width="35.25"/>
   <Column ss:StyleID="s47" ss:Width="30"/>
   <Column ss:StyleID="s47" ss:Width="51"/>
   <Column ss:StyleID="s47" ss:AutoFitWidth="0" ss:Width="34.5"/>
   <Column ss:StyleID="s47" ss:Width="51"/>
   <Column ss:StyleID="s47" ss:AutoFitWidth="0" ss:Width="34.5"/>
   <Column ss:StyleID="s47" ss:Width="51" ss:Span="2"/>
   <Column ss:Index="13" ss:StyleID="s47" ss:AutoFitWidth="0" ss:Width="38.25"/>
   <Row ss:AutoFitHeight="0" ss:Height="19.5" ss:StyleID="s52">
    <Cell ss:StyleID="s51"><Data ss:Type="String">包装类型</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">包装名称</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">长度</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">宽度</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">高度</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">包装重量</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">材质</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">是否回收</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">类别</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">折叠高度</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">堆垛层数</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">摆放方向</Data></Cell>
    <Cell ss:StyleID="s51"><Data ss:Type="String">标识</Data></Cell>
   </Row>
   
   <#list rows as rowData>
   <Row ss:StyleID="s44">
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.baozlx!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.baozmc!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.changd!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.kuand!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.gaod!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.baozzl!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.caiz!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.shifhs!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.leib!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.zhedgd!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.duidcs!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.baiffx!''}</Data></Cell>
    <Cell ss:StyleID="s53"><Data ss:Type="String">${rowData.biaos!''}</Data></Cell>
   </Row>
   </#list>
   
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <PageMargins x:Left="0.8" x:Right="0.8"/>
   </PageSetup>
   <DisplayPageBreak/>
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
     <ActiveRow>29</ActiveRow>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
