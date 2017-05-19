<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-08-03T07:58:14Z</LastSaved>
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
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
  </Style>
  <Style ss:ID="s22">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s23">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s24">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <NumberFormat ss:Format="General Date"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="库位等级与包装">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s21" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="110.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="160.5"/>
   <Column ss:Index="7" ss:StyleID="s21" ss:Width="103.5"/>
   <Column ss:Index="9" ss:StyleID="s21" ss:Width="103.5"/>
   <Row ss:AutoFitHeight="0" ss:StyleID="s22">
    <Cell ss:StyleID="s23"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">仓库编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">库位等级编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">包装类型</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">包装个数</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加时间</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改时间</Data></Cell>
   </Row>
   <#list kuwdjbzData as kuwdjbz>
	   <Row>
	    <Cell><Data ss:Type="String">${kuwdjbz.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.cangkbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.kuwdjbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.baozlx!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.baozgs!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.creator!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.create_time!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.editor!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuwdjbz.edit_time!''}</Data></Cell>
	   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
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
     <ActiveRow>2</ActiveRow>
     <ActiveCol>8</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
