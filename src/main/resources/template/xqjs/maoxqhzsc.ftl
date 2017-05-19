<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-08-25T07:49:10Z</LastSaved>
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
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="70" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Row>
    <Cell><Data ss:Type="String">ID</Data></Cell>
    <Cell><Data ss:Type="String">需求拆分日期</Data></Cell>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">制造路线</Data></Cell>
    <Cell><Data ss:Type="String">单位</Data></Cell>
    <Cell><Data ss:Type="String">S0</Data></Cell>
    <Cell><Data ss:Type="String">S1</Data></Cell>
    <Cell><Data ss:Type="String">S2</Data></Cell>
    <Cell><Data ss:Type="String">S3</Data></Cell>
    <Cell><Data ss:Type="String">S4</Data></Cell>
    <Cell><Data ss:Type="String">S5</Data></Cell>
    <Cell><Data ss:Type="String">S6</Data></Cell>
    <Cell><Data ss:Type="String">S7</Data></Cell>
    <Cell><Data ss:Type="String">S8</Data></Cell>
    <Cell><Data ss:Type="String">S9</Data></Cell>
    <Cell><Data ss:Type="String">S10</Data></Cell>
    <Cell><Data ss:Type="String">S0周序号</Data></Cell>
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
    <Cell><Data ss:Type="String">路径代码</Data></Cell>
    <Cell><Data ss:Type="String">计划员组</Data></Cell>
    <Cell><Data ss:Type="String">订单累计</Data></Cell>
    <Cell><Data ss:Type="String">交付累计</Data></Cell>
    <Cell><Data ss:Type="String">待消耗</Data></Cell>
    <Cell><Data ss:Type="String">系统调整值</Data></Cell>
    <Cell><Data ss:Type="String">指定供应商</Data></Cell>
    <Cell><Data ss:Type="String">交付码</Data></Cell>
    <Cell><Data ss:Type="String">订单终止零件</Data></Cell>
    <Cell><Data ss:Type="String">最小起订量</Data></Cell>
    <Cell><Data ss:Type="String">零件属性</Data></Cell>
    <Cell><Data ss:Type="String">发货地</Data></Cell>
    <Cell><Data ss:Type="String">仓库类型</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">&quot;供应商名称</Data></Cell>
    <Cell><Data ss:Type="String">内部供应商用户中心</Data></Cell>
   </Row>
   <#list res as maoxqhzsc>
   <Row>
    <Cell><Data ss:Type="String">${maoxqhzsc.id!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.xuqcfrq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.usercenter!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.lingjbh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.zhizlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.danw!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s0!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s1!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s2!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s3!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s4!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s5!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s6!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s7!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s8!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s9!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s10!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.s0zxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.cangkdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.dinghcj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.anqkc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.kuc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.gongysdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.gongyslx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.beihzq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.fayzq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.gongysfe!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.dingdnr!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.tiaozjsz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.uabzlx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.uabzuclx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.uabzucsl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.uabzucrl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.baozrl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.ziyhqrq!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.waibghms!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.yugsfqz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.shifylkc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.shifylaqkc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.shifyldjf!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.shifyldxh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.lujdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.jihyz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.dingdlj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.jiaoflj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.daixh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.xittzz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.zhidgys!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.jiaofm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.dingdzzlj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.zuixqdl!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.lingjsx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.fahd!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.cangklx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.gongsmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${maoxqhzsc.neibyhzx!''}</Data></Cell>
   </Row>
   </#list>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Selected/>
   <LeftColumnVisible>38</LeftColumnVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>7</ActiveRow>
     <ActiveCol>48</ActiveCol>
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
