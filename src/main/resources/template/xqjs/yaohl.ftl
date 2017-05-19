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
    <Cell><Data ss:Type="String">要货令号</Data></Cell>
    <Cell><Data ss:Type="String">订单号</Data></Cell>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件号</Data></Cell>
    <Cell><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell><Data ss:Type="String">承运商代码</Data></Cell>
    <Cell><Data ss:Type="String">供货模式</Data></Cell>
    <Cell><Data ss:Type="String">发货地</Data></Cell>
    <Cell><Data ss:Type="String">仓库</Data></Cell>
    <Cell><Data ss:Type="String">子仓库</Data></Cell>
    <Cell><Data ss:Type="String">目的地</Data></Cell>
    <Cell><Data ss:Type="String">客户</Data></Cell>
    <Cell><Data ss:Type="String">包装类型</Data></Cell>
    <Cell><Data ss:Type="String">零件数量</Data></Cell>
    <Cell><Data ss:Type="String">预计发出时间</Data></Cell>
    <Cell><Data ss:Type="String">实际发出时间</Data></Cell>
    <Cell><Data ss:Type="String">产线</Data></Cell>
    <Cell><Data ss:Type="String">预计交付时间</Data></Cell>
    <Cell><Data ss:Type="String">原最晚交付时间</Data></Cell>
    <Cell><Data ss:Type="String">修改后预计交付时间</Data></Cell>
    <Cell><Data ss:Type="String">实际交付时间</Data></Cell>
    <Cell><Data ss:Type="String">到达状态</Data></Cell>
    <Cell><Data ss:Type="String">要货令状态</Data></Cell>
    <Cell><Data ss:Type="String">计划员组</Data></Cell>
    <Cell><Data ss:Type="String">实际交付数量</Data></Cell>
    <Cell><Data ss:Type="String">是否发送供应商</Data></Cell>
    <Cell><Data ss:Type="String">是否临时卡</Data></Cell>
    <Cell><Data ss:Type="String">备注</Data></Cell>
   </Row>
   <#list dataSource as bean>
   <Row>
    <Cell><Data ss:Type="String">${bean.yaohlh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.dingdh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.chengysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.yaohllx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.fahd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.cangkbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.zickbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.mudd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.keh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.baozxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.yaohsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.faysj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.shijfysj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.chanx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.zuiwsj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.yuanzuiwsj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.xiughyjjfsj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.jiaofj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.jiaofzt!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.yaohlzt!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.jihyz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.daijfsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.shifpz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.shiflsk!''}</Data></Cell>
    <Cell><Data ss:Type="String">${bean.beiz!''}</Data></Cell>
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
