<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>2006-09-13T11:21:51Z</Created>
  <LastSaved>2016-01-18T03:09:14Z</LastSaved>
  <Version>12.00</Version>
 </DocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <RemovePersonalInformation/>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>11640</WindowHeight>
  <WindowWidth>19200</WindowWidth>
  <WindowTopX>0</WindowTopX>
  <WindowTopY>90</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="11" ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s21">
   <Alignment ss:Vertical="Center"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="${MAXCOLS}" ss:ExpandedRowCount="${MAXROWS+1}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="13.5">
   
   <Row>
    <Cell><Data ss:Type="String">计划员</Data></Cell>
     <#list rows.factoryList as rowData>
	    <Cell><Data ss:Type="String">${rowData!''}</Data></Cell>
    </#list>
    <Cell><Data ss:Type="String">合计</Data></Cell>
   </Row>
   
   <#list rows.list as rowData>
	   <Row>
	    <Cell ><Data ss:Type="String">${rowData.jihy!''}</Data></Cell>
	    <Cell ><Data ss:Type="String">${rowData.num_1!''}</Data></Cell>
		<#if rows.factoryList ? size== 2 >
		    <Cell ><Data ss:Type="String">${rowData.num_2!''}</Data></Cell>
		</#if> 
	    <Cell ><Data ss:Type="String">${rowData.num_1 + rowData.num_2}</Data></Cell>
	   </Row>
   </#list>
   
   <Row>
   		<Cell><Data ss:Type="String">合计</Data></Cell>
		<Cell ><Data ss:Type="String">${rows.total1!''}</Data></Cell>
		<#if (rows.total2?exists)>
		    <Cell ><Data ss:Type="String">${rows.total2!''}</Data></Cell>
		</#if> 
		<Cell ><Data ss:Type="String">${rows.total3!''}</Data></Cell>
  </Row>
   
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>200</HorizontalResolution>
    <VerticalResolution>200</VerticalResolution>
   </Print>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>3</ActiveRow>
     <ActiveCol>4</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
