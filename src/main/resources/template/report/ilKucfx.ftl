﻿<?xml version="1.0"?>
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
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS}" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s27" ss:DefaultColumnWidth="54"
   ss:DefaultRowHeight="14.25">
   <Column ss:StyleID="s27" ss:AutoFitWidth="0" ss:Width="63"/>
   <Column ss:StyleID="s27" ss:Width="61.5" ss:Span="4"/>
   <Column ss:Index="7" ss:StyleID="s27" ss:Width="36"/>
   <Column ss:StyleID="s27" ss:Width="61.5" ss:Span="2"/>
   <Column ss:Index="11" ss:StyleID="s27" ss:Width="63"/>
   <Column ss:StyleID="s27" ss:Width="48.75"/>
   <Column ss:StyleID="s27" ss:Width="61.5"/>
   <Column ss:StyleID="s27" ss:Width="90"/>
   <Column ss:StyleID="s27" ss:Width="61.5" ss:Span="1"/>
   <Column ss:Index="17" ss:StyleID="s27" ss:Width="75.75"/>
   <Column ss:StyleID="s27" ss:Width="104.25"/>
   <Column ss:StyleID="s27" ss:Width="61.5"/>
   <Column ss:Index="22" ss:StyleID="s27" ss:Width="90"/>
   <Column ss:StyleID="s27" ss:Width="75.75"/>
   <Column ss:StyleID="s27" ss:Width="39"/>
   <Column ss:Index="26" ss:StyleID="s27" ss:Width="76.5"/>
   <Column ss:Index="28" ss:StyleID="s27" ss:Width="63"/>
   <Row ss:StyleID="s25">
    <Cell ss:StyleID="s24"><Data ss:Type="String">用户中心</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">零件编号</Data></Cell>
<Cell ss:StyleID="s24"><Data ss:Type="String">使用车间</Data></Cell>
<Cell ss:StyleID="s24"><Data ss:Type="String">仓库代码</Data></Cell>
<Cell ss:StyleID="s24"><Data ss:Type="String">仓库库存</Data></Cell>
<Cell ss:StyleID="s24"><Data ss:Type="String">CMJ</Data></Cell>
<Cell ss:StyleID="s24"><Data ss:Type="String">天数</Data></Cell>
    <Cell ss:StyleID="s24"><Data ss:Type="String">计划员</Data></Cell>
   </Row>
  
   <#list rows as rowData>
   	<Row>
  	    <Cell><Data ss:Type="String">${rowData.usercenter!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.lingjbh!''}</Data></Cell>
	    <Cell><Data ss:Type="String">${rowData.shiycj!''}</Data></Cell>
<Cell><Data ss:Type="String">${rowData.cangkdm!''}</Data></Cell>
<Cell><Data ss:Type="String">${rowData.kucsl!''}</Data></Cell>
<Cell><Data ss:Type="String">${rowData.cmj!''}</Data></Cell>
<Cell><Data ss:Type="String">${rowData.tians!''}</Data></Cell>
<Cell><Data ss:Type="String">${rowData.jihy!''}</Data></Cell>
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
