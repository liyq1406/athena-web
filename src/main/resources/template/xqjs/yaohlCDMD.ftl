<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>猫酷酷的</Created>
  <LastSaved>2000-11-18T06:53:49Z</LastSaved>
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
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="50" ss:ExpandedRowCount="200000" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s21" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:Index="3" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="72"/>
   <Column ss:Index="8" ss:StyleID="s21" ss:AutoFitWidth="0" ss:Width="88.5"
    ss:Span="3"/>
   <Row>
    <Cell><Data ss:Type="String">前段要货令号</Data></Cell>
    <Cell><Data ss:Type="String">前段要货令状态</Data></Cell>
    <Cell><Data ss:Type="String">后段要货令号</Data></Cell>
    <Cell><Data ss:Type="String">后段要货令状态</Data></Cell>
    <Cell><Data ss:Type="String">产线</Data></Cell>
    <Cell><Data ss:Type="String">消耗点</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">包装类型</Data></Cell>
    <Cell><Data ss:Type="String">要货数量</Data></Cell>
    <Cell><Data ss:Type="String">前段交付数量</Data></Cell>
    <Cell><Data ss:Type="String">订单号</Data></Cell>
    <Cell><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell><Data ss:Type="String">承运商代码</Data></Cell>
    <Cell><Data ss:Type="String">订货仓库</Data></Cell>
    <Cell><Data ss:Type="String">订货子仓库</Data></Cell>
    <Cell><Data ss:Type="String">线边仓库</Data></Cell>
    <Cell><Data ss:Type="String">线边子仓库</Data></Cell>
    <Cell><Data ss:Type="String">要货令表达时间</Data></Cell>
    <Cell><Data ss:Type="String">前段预计交付时间</Data></Cell>
    <Cell><Data ss:Type="String">前段实际交付时间</Data></Cell>
    <Cell><Data ss:Type="String">前段到达状态</Data></Cell>
    <Cell><Data ss:Type="String">小火车号</Data></Cell>
    <Cell><Data ss:Type="String">小火车趟次</Data></Cell>
    <Cell><Data ss:Type="String">小火车车厢</Data></Cell>
    <Cell><Data ss:Type="String">小火车备货时间</Data></Cell>

    <Cell><Data ss:Type="String">小火车预计上线时间</Data></Cell>
    <Cell><Data ss:Type="String">小火车实际上线时间</Data></Cell>
   </Row>
   <#list list as bean>
   <Row>
    <Cell><Data ss:Type="String">${bean.qiandYaohlh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.qiandYaohlhzt!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.houdYaohlh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.houdYaohlhzt!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.chanx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.mudd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.baozxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.yaohsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.qiandJiaofsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.dingdh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.chengysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.dinghCangkbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.dinghZick!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xianbCangkbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xianbZick!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.yaohlbdsj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.qiandYjjfsj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.qiandSjjfsj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.qiandDdzt!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xiaohch!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.tangc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.chex!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xiaohcBhsj!''}</Data></Cell>

    <Cell><Data ss:Type="String">${bean.xiaohcYjsxsj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xiaohcSjsxsj!''}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>6</ActiveRow>
     <ActiveCol>2</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="Sheet2">
  <Table ss:ExpandedColumnCount="0" ss:ExpandedRowCount="0" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25"/>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="Sheet3">
  <Table ss:ExpandedColumnCount="0" ss:ExpandedRowCount="0" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25"/>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
