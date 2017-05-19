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
 </Styles>
 <Worksheet ss:Name="库位">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s21" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="110.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="160.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="109.5"/>
   <Column ss:Index="8" ss:StyleID="s21" ss:Width="76.5"/>
   <Column ss:Index="10" ss:StyleID="s21" ss:Width="63"/>
   <Row ss:AutoFitHeight="0" ss:StyleID="s22">
    <Cell ss:StyleID="s23"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">仓库编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">子仓库编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">库位编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">定置零件</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">库位等级编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">库位状态</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">已放个数</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">包装类型</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">包装个数</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加时间</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改时间</Data></Cell>
   </Row>
   <#list kuwData as kuw>
	   <Row>
	    <Cell><Data ss:Type="String">${kuw.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.cangkbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.zickbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.kuwbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.lingjbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.kuwdjbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.kuwzt!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.yifgs!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.baozlx!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.baozgs!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.creator!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.create_time!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.editor!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${kuw.edit_time!''}</Data></Cell>
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
     <ActiveRow>7</ActiveRow>
     <ActiveCol>7</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
