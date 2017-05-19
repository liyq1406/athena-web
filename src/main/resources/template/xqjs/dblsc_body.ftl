 
    <#list list as bean>
   <Row ss:Height="14.25">
    <Cell ss:StyleID="s70"><Data ss:Type="String">${bean.lingjbh!''}</Data></Cell>
    <Cell ss:StyleID="s72"><Data ss:Type="String">${bean.lux!''}</Data></Cell>
    <Cell ss:StyleID="s68"><Data ss:Type="Number">${bean.shenbsl!''}</Data></Cell>
    <Cell ss:StyleID="s75"><Data ss:Type="DateTime">${bean.yaohsj!''}</Data></Cell>
   	<Cell><Data ss:Type="String">${bean.tishi!''}</Data></Cell>
   </Row>
      </#list>
   