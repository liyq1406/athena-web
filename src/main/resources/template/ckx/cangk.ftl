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
  <ActiveSheet>1</ActiveSheet>
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
 <Worksheet ss:Name="仓库">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s21" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="110.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="160.5"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="109.5" ss:Span="2"/>
   <Column ss:Index="9" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="126.75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="125.25" ss:Span="1"/>
   <Column ss:Index="12" ss:StyleID="s21" ss:Width="39"/>
   <Column ss:Index="14" ss:StyleID="s21" ss:Width="76.5"/>
   <Column ss:Index="16" ss:StyleID="s21" ss:Width="63"/>
   <Row ss:AutoFitHeight="0" ss:StyleID="s22">
    <Cell ss:StyleID="s23"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">仓库编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">站台类型</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">仓库类型</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">到车提前期(分钟)</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">计划员组编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">容器场编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">物流工艺员组</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">安全库存天数默认值</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">最大库存天数默认值</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">卸货站台编组</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">出库模式</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">工厂</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">线号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">标识</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加时间</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改时间</Data></Cell>
   </Row>
   <#list cangkData as cangk>
	   <Row>
	    <Cell><Data ss:Type="String">${cangk.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.cangkbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.zhantlx!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.cangklx!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.daoctqq!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.jihyzbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.rongqcbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.wulgyyz!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.anqkctsmrz!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.zuidkctsmrz!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.xiehztbz!''}</Data></Cell>
            <Cell><Data ss:Type="String">${cangk.chukms!''}</Data></Cell>
        	<Cell><Data ss:Type="String">${cangk.gongc!''}</Data></Cell>
        	<Cell><Data ss:Type="String">${cangk.xianh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.biaos!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.creator!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.create_time!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.editor!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${cangk.edit_time!''}</Data></Cell>
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
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveCol>4</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="子仓库">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s21" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="89.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="110.25"/>
   <Column ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="160.5" ss:Span="2"/>
   <Column ss:Index="8" ss:StyleID="s21" ss:Width="39"/>
   <Column ss:Index="10" ss:StyleID="s21" ss:Width="76.5"/>
   <Column ss:Index="12" ss:StyleID="s21" ss:Width="63"/>
   <Row ss:AutoFitHeight="0" ss:StyleID="s22">
    <Cell ss:StyleID="s23"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">仓库编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">子仓库编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">饱和度百分比%</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">是否按EL号管理</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">管理员组编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">站台编号</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">标识</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">增加时间</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改人</Data></Cell>
    <Cell ss:StyleID="s23"><Data ss:Type="String">修改时间</Data></Cell>
   </Row>
   <#list zickData as zick>
	   <Row>
	    <Cell><Data ss:Type="String">${zick.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.cangkbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.zickbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.baohd!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.shifelgl!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.guanlyzbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.zhantbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.biaos!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.creator!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.create_time!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.editor!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${zick.edit_time!''}</Data></Cell>
	   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Unsynced/>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveCol>6</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
