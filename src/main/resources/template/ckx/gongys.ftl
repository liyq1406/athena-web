<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <LastAuthor>Administrator</LastAuthor>
  <Created>2012-09-07T06:20:25Z</Created>
  <LastSaved>2012-09-07T06:20:36Z</LastSaved>
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
  <Style ss:ID="s21">
   <NumberFormat/>
  </Style>
  <Style ss:ID="s44">
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s64">
   <NumberFormat ss:Format="0.000"/>
  </Style>
  <Style ss:ID="s65">
   <NumberFormat ss:Format="Fixed"/>
  </Style>
  <Style ss:ID="s68">
   <Font x:Family="Swiss"/>
  </Style>
  <Style ss:ID="s69">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s70">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Bold="1"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s71">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Font x:Family="Swiss"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="gongys">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1">
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="58.5"/>
   <Column ss:StyleID="s21" ss:Width="98.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="34.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="46.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="144.75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="148.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="40.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="42.75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="38.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="42.75"/>
   <Column ss:StyleID="s21" ss:Width="40.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="46.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="47.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="69.75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="90"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="88.5"/>
   <Column ss:StyleID="s21" ss:Width="62.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="69.75"/>
   <Column ss:StyleID="s21" ss:Width="109.5" ss:Span="1"/>
   <Column ss:Index="21" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="38.25"/>
   <Row ss:AutoFitHeight="0" ss:Height="19.5" ss:StyleID="s71">
    <Cell ss:StyleID="s70"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">供应商承运商编号</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">类型</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">供货类型</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">公司名称</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">地址</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">邮编</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">联系人</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">电话</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">传真</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">发运地</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">备货周期</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">发运周期</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">开车标准体积</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">每天送货最大频次</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">每天送货最小频次</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">额定装载率</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">波动放大系数</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">内部供应商用户中心</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">内部供应商仓库</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">标识</Data></Cell>
   </Row>
   
   <#list rows as rowData>
   <Row ss:StyleID="s68">
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.usercenter!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.gcbh!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.leix!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.gonghlx!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.gongsmc!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.diz!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.youb!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.lianxr!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.dianh!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.chuanz!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.fayd!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.beihzq!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.fayzq!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.kacbztj!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.songhzdpc!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.songhzxpc!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.edzzl!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.bodfdxs!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.neibyhzx!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.neibgys_cangkbh!''}</Data></Cell>
    <Cell ss:StyleID="s69"><Data ss:Type="String">${rowData.biaos!''}</Data></Cell>
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
     <RangeSelection>R1</RangeSelection>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
