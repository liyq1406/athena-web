<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>1996-12-17T01:32:42Z</Created>
  <LastSaved>2012-08-30T03:20:06Z</LastSaved>
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
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="80" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
   <Row>
    <Cell><Data ss:Type="String">ID</Data></Cell>
    <Cell><Data ss:Type="String">S0所属周序号</Data></Cell>
    <Cell><Data ss:Type="String">用户中心</Data></Cell>
    <Cell><Data ss:Type="String">零件编号</Data></Cell>
    <Cell><Data ss:Type="String">制造路线</Data></Cell>
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
    <Cell><Data ss:Type="String">S11</Data></Cell>
    <Cell><Data ss:Type="String">S12</Data></Cell>
    <Cell><Data ss:Type="String">S13</Data></Cell>
    <Cell><Data ss:Type="String">S14</Data></Cell>
    <Cell><Data ss:Type="String">S15</Data></Cell>
    <Cell><Data ss:Type="String">S16</Data></Cell>
    <Cell><Data ss:Type="String">S17</Data></Cell>
    <Cell><Data ss:Type="String">S18</Data></Cell>
    <Cell><Data ss:Type="String">S19</Data></Cell>
    <Cell><Data ss:Type="String">S20</Data></Cell>
    <Cell><Data ss:Type="String">S21</Data></Cell>
    <Cell><Data ss:Type="String">S22</Data></Cell>
    <Cell><Data ss:Type="String">S23</Data></Cell>
    <Cell><Data ss:Type="String">UA包装类型</Data></Cell>
    <Cell><Data ss:Type="String">UA包装内UC类型</Data></Cell>
    <Cell><Data ss:Type="String">UA包装内UC数量</Data></Cell>
    <Cell><Data ss:Type="String">UA包装内UC容量</Data></Cell>
     <Cell><Data ss:Type="String">UA容量</Data></Cell>
    <Cell><Data ss:Type="String">单位</Data></Cell>
    <Cell><Data ss:Type="String">供应商代码</Data></Cell>
    <Cell><Data ss:Type="String">供应商份额</Data></Cell>
    <Cell><Data ss:Type="String">备货周期</Data></Cell>
    <Cell><Data ss:Type="String">发运周期</Data></Cell>
    <Cell><Data ss:Type="String">发货地</Data></Cell>
    <Cell><Data ss:Type="String">订货车间</Data></Cell>
    <Cell><Data ss:Type="String">订货仓库</Data></Cell>
    <Cell><Data ss:Type="String">库存</Data></Cell>
    <Cell><Data ss:Type="String">安全库存</Data></Cell>
    <Cell><Data ss:Type="String">订货安全库存</Data></Cell>
    <Cell><Data ss:Type="String">系统调整值</Data></Cell>
    <Cell><Data ss:Type="String">计算调整值</Data></Cell>
    <Cell><Data ss:Type="String">订单累计</Data></Cell>
    <Cell><Data ss:Type="String">交付累计</Data></Cell>
     <Cell><Data ss:Type="String">订单终止累计</Data></Cell>
    <Cell><Data ss:Type="String">待消耗</Data></Cell>
    <Cell><Data ss:Type="String">资源获取日期</Data></Cell>
    <Cell><Data ss:Type="String">计划员组</Data></Cell>
    <Cell><Data ss:Type="String">路径代码</Data></Cell>
    <Cell><Data ss:Type="String">外部供货模式</Data></Cell>
    <Cell><Data ss:Type="String">订单内容</Data></Cell>
    <Cell><Data ss:Type="String">供应商类型</Data></Cell>
    <Cell><Data ss:Type="String">零件名称</Data></Cell>
    <Cell><Data ss:Type="String">供应商名称</Data></Cell>
    <Cell><Data ss:Type="String">内部供应商用户中心</Data></Cell>
    <Cell><Data ss:Type="String">卸货站台</Data></Cell>
    <Cell><Data ss:Type="String">指定供应商</Data></Cell>
    <Cell><Data ss:Type="String">关键零件级别</Data></Cell>
   </Row>
    <#list res as kdmxqhzc>
   <Row>
    <Cell ><Data ss:Type="String">${kdmxqhzc.id!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s0sszxh!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.usercenter!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.lingjbh!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.zhizlx!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s0!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s1!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s2!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s3!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s4!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s5!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s6!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s7!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s8!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s9!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s10!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s11!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s12!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s13!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s14!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s15!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s16!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s17!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s18!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s19!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s20!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s21!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s22!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.s23!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.uabzlx!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.uabzuclx!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.uabzucsl!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.uabzucrl!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.uarl!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.danw!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.gongysdm!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.gongysfe!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.beihzq!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.fayzq!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.fahd!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.dinghcj!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.dinghck!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.kuc!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.anqkc!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.dinghaqkc!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.xittzz!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.jstzsz!''}</Data></Cell>
    <Cell ><Data ss:Type="String">${kdmxqhzc.dingdlj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.jiaoflj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.dingdzzlj!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.daixh!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.ziyhqrq!''} </Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.jihyz!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.lujdm!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.waibghms!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.dingdnr!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.gongyslx!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.lingjmc!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.gongsmc!''}</Data></Cell>
    <Cell><Data ss:Type="String"> ${kdmxqhzc.neibyhzx!''}</Data></Cell>
    <Cell><Data ss:Type="String"> ${kdmxqhzc.xiehzt!''}</Data></Cell>
    <Cell><Data ss:Type="String">${kdmxqhzc.zhidgys!''}</Data></Cell>
    <Cell><Data ss:Type="String"> ${kdmxqhzc.guanjljjb!''}</Data></Cell>
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
   <LeftColumnVisible>54</LeftColumnVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>20</ActiveRow>
     <ActiveCol>68</ActiveCol>
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
