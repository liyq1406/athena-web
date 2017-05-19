<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <LastAuthor>Administrator</LastAuthor>
  <Created>2012-05-23T03:01:57Z</Created>
  <LastSaved>2012-05-25T03:46:02Z</LastSaved>
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
  <Style ss:ID="s24">
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s27">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9" ss:Color="#000000"
    ss:Bold="1"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s28">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9" ss:Color="#000000"/>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s29">
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="9" ss:Color="#000000"
    ss:Bold="1"/>
   <NumberFormat ss:Format="@"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="lingjxhd">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1">
   <Column ss:StyleID="s21" ss:Width="62.25"/>
   <Column ss:StyleID="s21" ss:Width="69"/>
   <Column ss:StyleID="s21" ss:Width="54"/>
   <Column ss:StyleID="s21" ss:Width="58.5"/>
   <Column ss:StyleID="s24" ss:Width="69"/>
   <Column ss:StyleID="s21" ss:Width="58.5" ss:Span="1"/>
   <Row>
    <Cell ss:StyleID="s27"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">产线仓库编号</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">零件编号</Data></Cell>
    <Cell ss:StyleID="s29"><Data ss:Type="String">工业周期</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">计算日期</Data></Cell>
    <Cell ss:StyleID="s27"><Data ss:Type="String">CMJ</Data></Cell>
   </Row>
   <#list rows as rowData>
	   <Row>
		    <Cell ss:StyleID="s27"><Data ss:Type="String">${rowData.usercenter!''}</Data></Cell>
		    <Cell ss:StyleID="s27"><Data ss:Type="String">${rowData.chanxck!''}</Data></Cell>
		    <Cell ss:StyleID="s27"><Data ss:Type="String">${rowData.lingjbh!''}</Data></Cell>
		    <Cell ss:StyleID="s27"><Data ss:Type="String">${rowData.gongyzq!''}</Data></Cell>
		    <Cell ss:StyleID="s27"><Data ss:Type="String">${rowData.jisrq!''}</Data></Cell>
		    <Cell ss:StyleID="s27"><Data ss:Type="String">${rowData.cmj!''}</Data></Cell>
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
     <ActiveRow>4</ActiveRow>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
