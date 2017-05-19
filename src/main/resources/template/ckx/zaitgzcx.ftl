<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-08-03T02:58:30Z</LastSaved>
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
  <Style ss:ID="s26">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Font ss:FontName="宋体" x:CharSet="134"/>
  </Style>
  <Style ss:ID="s27">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="zaitgzcx">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s27" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="82.5"/>
   <Column ss:StyleID="s27" ss:Width="82.5"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="82.5"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="120.75"/>
   <Column ss:StyleID="s27" ss:Width="120.75"/>
   <Column ss:StyleID="s27" ss:Width="120.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="82.5"/>
   <Column ss:StyleID="s27" ss:Width="82.5"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="120.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Column ss:StyleID="s27" ss:Width="120.75"/>
   <Column ss:StyleID="s27" ss:Width="69.75"/>
   <Row ss:StyleID="s25">
    <Cell ss:StyleID="s24"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">运输计划号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">要货令号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">零件编号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">零件数量</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">承运商代码</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">产线</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">目的地</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">仓库</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">预计到达时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">实际到达时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">预计到货时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">车牌号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">物流路径</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">FLAG</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">异常计划号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">卡车号</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">最新物理点</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">到达物理点时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">上次物理点</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">到达上次物理点时间</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">运输状态</Data></Cell>
   </Row>
  
   <#list rows as rowData>
   	<Row>
	    <Cell><Data ss:Type="String">${rowData.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.yunsjhh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.yaohlh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.lingjbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.lingjsl!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.gongysdm!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.chengysdm!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.chanx!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.mudd!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.cangkbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.yujddsj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.shijddsj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.yujdhsj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.cheph!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.wullj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.flag!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.yicjhh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.kach!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.wulddm!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.daodwldsj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.shangcwld!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.daodscwldsj!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.yunszt!''}</Data></Cell>
   	</Row>
   </#list>
   
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
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
