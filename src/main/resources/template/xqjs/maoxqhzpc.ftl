<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-10-19T03:57:46Z</LastSaved>
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
   <Alignment ss:Vertical="Bottom" ss:WrapText="1"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="70" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Row ss:AutoFitHeight="0" ss:Height="16.5">
    <Cell><Data ss:Type="String">ID</Data></Cell>
    <Cell><Data ss:Type="String">需求拆分日期</Data></Cell>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件号</Data></Cell>
    <Cell><Data ss:Type="String">制造路线</Data></Cell>
    <Cell><Data ss:Type="String">单位</Data></Cell>
    <Cell><Data ss:Type="String">P0</Data></Cell>
    <Cell><Data ss:Type="String">P1</Data></Cell>
    <Cell><Data ss:Type="String">P2</Data></Cell>
    <Cell><Data ss:Type="String">P3</Data></Cell>
    <Cell><Data ss:Type="String">P4</Data></Cell>
    <Cell><Data ss:Type="String">P5</Data></Cell>
    <Cell><Data ss:Type="String">P6</Data></Cell>
    <Cell><Data ss:Type="String">P7</Data></Cell>
    <Cell><Data ss:Type="String">P8</Data></Cell>
    <Cell><Data ss:Type="String">P9</Data></Cell>
    <Cell><Data ss:Type="String">P10</Data></Cell>
    <Cell><Data ss:Type="String">P11</Data></Cell>
    <Cell><Data ss:Type="String">P0周期序号</Data></Cell>
    <Cell><Data ss:Type="String">订货仓库（线边仓库）</Data></Cell>
    <Cell><Data ss:Type="String">订货车间</Data></Cell>
    <Cell><Data ss:Type="String">安全库存</Data></Cell>
    <Cell><Data ss:Type="String">库存</Data></Cell>
    <Cell><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell><Data ss:Type="String">内部、外部、第三方库</Data></Cell>
    <Cell><Data ss:Type="String">备货周期</Data></Cell>
    <Cell><Data ss:Type="String">发运周期</Data></Cell>
    <Cell><Data ss:Type="String">供应商份额</Data></Cell>
    <Cell><Data ss:Type="String">订单内容</Data></Cell>
    <Cell><Data ss:Type="String">调整计算值</Data></Cell>
    <Cell><Data ss:Type="String">UA包装类型</Data></Cell>
    <Cell><Data ss:Type="String">UA包装内UC类型</Data></Cell>
    <Cell><Data ss:Type="String">UA包装内UC数量</Data></Cell>
    <Cell><Data ss:Type="String">UA包装内UC容量</Data></Cell>
    <Cell><Data ss:Type="String">包装容量</Data></Cell>
    <Cell><Data ss:Type="String">资源获取日期</Data></Cell>
    <Cell><Data ss:Type="String">外部供货模式</Data></Cell>
    <Cell><Data ss:Type="String">预告是否取整</Data></Cell>
    <Cell><Data ss:Type="String">是否依赖库存</Data></Cell>
    <Cell><Data ss:Type="String">是否依赖安全库存</Data></Cell>
    <Cell><Data ss:Type="String">是否依赖待交付</Data></Cell>
    <Cell><Data ss:Type="String">是否依赖待消耗</Data></Cell>
    <Cell><Data ss:Type="String">计划员组</Data></Cell>
    <Cell><Data ss:Type="String">路径代码</Data></Cell>
    <Cell><Data ss:Type="String">订单累计</Data></Cell>
    <Cell><Data ss:Type="String">交付累计</Data></Cell>
    <Cell><Data ss:Type="String">待消耗</Data></Cell>
    <Cell><Data ss:Type="String">系统调整值</Data></Cell>
    <Cell><Data ss:Type="String">指定供应商</Data></Cell>
    <Cell><Data ss:Type="String">最小起订量</Data></Cell>
    <Cell><Data ss:Type="String">交付码</Data></Cell>
    <Cell><Data ss:Type="String">订单终止零件</Data></Cell>
    <Cell><Data ss:Type="String">供应合同号</Data></Cell>
    <Cell><Data ss:Type="String">使用车间</Data></Cell>
    <Cell><Data ss:Type="String">零件属性</Data></Cell>
    <Cell><Data ss:Type="String">发货地</Data></Cell>
    <Cell><Data ss:Type="String">仓库类型</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">供应商名称</Data></Cell>
    <Cell><Data ss:Type="String">内部供应商用户中心</Data></Cell>
    <Cell><Data ss:Type="String">仓库库物流工艺员组</Data></Cell>
    <Cell><Data ss:Type="String">循环物流工艺员组</Data></Cell>
    <Cell><Data ss:Type="String">卸货站台编号</Data></Cell>
   </Row>
   <#list res as maoxqhzpc>
   <Row>
    <Cell><Data ss:Type="String">${maoxqhzpc.id!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.xuqcfrq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.zhizlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.danw!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p0!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p3!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p4!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p5!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p6!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p7!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p8!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p9!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p10!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p11!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.p0zqxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.cangkdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.dinghcj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.anqkc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.kuc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.gongyslx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.beihzq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.fayzq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.gongysfe!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.dingdnr!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.tiaozjsz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.uabzlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.uabzuclx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.uabzucsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.uabzucrl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.baozrl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.ziyhqrq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.waibghms!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.yugsfqz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.shifylkc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.shifylaqkc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.shifyldjf!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.shifyldxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.jihydz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.lujdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.dingdlj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.jiaoflj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.daixh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.xittzz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.zhidgys!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.zuixqdl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.jiaofm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.dingdzzlj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.gongyhth!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.shiycj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.lingjsx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.fahd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.cangklx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.gongsmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.neibyhzx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.wulgyyz1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.wulgyyz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzpc.xiehztbh!''}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>12</ActiveRow>
     <ActiveCol>3</ActiveCol>
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
