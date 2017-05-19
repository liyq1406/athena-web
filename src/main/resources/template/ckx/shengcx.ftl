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
  <Style ss:ID="s23">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Color="#000000" ss:Bold="1"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s24">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s25">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s27">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
  </Style>
  <Style ss:ID="s31">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="生产线">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s27" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="110.25"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="160.5"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="109.5" ss:Span="1"/>
   <Column ss:Index="8" ss:StyleID="s27" ss:Width="39"/>
   <Column ss:Index="10" ss:StyleID="s27" ss:Width="76.5"/>
   <Column ss:Index="12" ss:StyleID="s27" ss:Width="63"/>
   <Row ss:StyleID="s25">
    <Cell ss:StyleID="s24"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">生产线编号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">整车生产节拍</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">整车未来生产节拍</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">整车未来生产节拍切换时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">排产计划处理天数</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">安全天数默认值</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">标识</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">增加人</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">增加时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">修改人</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">修改时间</Data></Cell>
   </Row>
   
   <#list shengcxData as shengcx>
	   <Row>
	    <Cell><Data ss:Type="String">${shengcx.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.shengcxbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.shengcjp!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.weilscjp!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.qiehsj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.chults!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.anqkctsmrz!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.biaos!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.creator!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.create_time!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.editor!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${shengcx.edit_time!''}</Data></Cell>
	   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
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
     <RangeSelection>R1:R65536</RangeSelection>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="分配区">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s27" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="110.25"/>
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="160.5"/>
   <Column ss:StyleID="s27" ss:Width="39"/>
   <Column ss:Index="8" ss:StyleID="s27" ss:Width="76.5"/>
   <Column ss:Index="10" ss:StyleID="s27" ss:Width="63"/>
   <Row ss:StyleID="s25">
    <Cell ss:StyleID="s24"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">生产线编号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">分配区编号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">分配区名称</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">物流工艺员组</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">标识</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">增加人</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">增加时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">修改人</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">修改时间</Data></Cell>
   </Row>
   
   <#list fenpqData as fenpq>
	   <Row>
	    <Cell><Data ss:Type="String">${fenpq.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.shengcxbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.fenpqh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.fenpqmc!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.wulgyyz!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.biaos!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.creator!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.create_time!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.editor!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${fenpq.edit_time!''}</Data></Cell>
	   </Row>
	</#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>1</ActiveRow>
     <RangeSelection>R2</RangeSelection>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
