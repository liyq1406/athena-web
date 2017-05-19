 
      <#list list as bean>
   <Row>
    <Cell><Data ss:Type="String">${bean.xunhbm!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.usercenter!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.lingjbh!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.gonghms!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.xiaohd!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.cangkdm!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.dinghck!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.lujdm!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.umlx!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.uclx!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.umljsl!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.umzucgs!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.ucrl!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.cmj!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.cjmax!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.dangqxhgm!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.jisxhgm!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.xiafxhgm!''}</Data></Cell>
<#if bean.shifzdfs??>
<#if bean.shifzdfs== 0 >
<Cell><Data ss:Type="String">否</Data></Cell>
<#else>
<Cell><Data ss:Type="String">是</Data></Cell>
</#if>
<#else>
<Cell><Data ss:Type="String"></Data></Cell>
</#if>
<Cell><Data ss:Type="String">${bean.zuidyhl!''}</Data></Cell>
<#if bean.shengxzt??>
<#if bean.shengxzt == '0' >
<Cell><Data ss:Type="String">未生效</Data></Cell>
<#else>
<Cell><Data ss:Type="String">已生效</Data></Cell>
</#if>
<#else>
<Cell><Data ss:Type="String"></Data></Cell>
</#if>
<#if bean.dongjjdzt??>
<#if bean.dongjjdzt == '0' >
<Cell><Data ss:Type="String">已冻结</Data></Cell>
<#else>
<Cell><Data ss:Type="String">未冻结</Data></Cell>
</#if>
<#else>
<Cell><Data ss:Type="String"></Data></Cell>
</#if>
<#if bean.leix??>
<#if bean.leix == '1' >
<Cell><Data ss:Type="String">新生成</Data></Cell>
<#elseif bean.leix='2' >
<Cell><Data ss:Type="String">规模调整</Data></Cell>
<#elseif bean.leix='3' >
<Cell><Data ss:Type="String">模式切换</Data></Cell>
</#if>
<#else>
<Cell><Data ss:Type="String"></Data></Cell>
</#if>
<Cell><Data ss:Type="String">${bean.creator!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.create_time!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.jissj!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.weihr!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.weihsj!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.gongysbh!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.jihydm!''}</Data></Cell>
<#if bean.shifyjsyhl??>
<#if bean.shifyjsyhl == '1' >
<Cell><Data ss:Type="String">已计算</Data></Cell>
<#else>
<Cell><Data ss:Type="String">未计算</Data></Cell>
</#if>
<#else>
<Cell><Data ss:Type="String"></Data></Cell>
</#if>
<Cell><Data ss:Type="String">${bean.chanx!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.kehd!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.xianbyhlx!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.yancsxbz!''}</Data></Cell>
<#if bean.jianglms??>
<#if bean.jianglms == '1' >
<Cell><Data ss:Type="String">将来</Data></Cell>
<#else>
<Cell><Data ss:Type="String">当前</Data></Cell>
</#if>
<#else>
<Cell><Data ss:Type="String"></Data></Cell>
</#if>

<#if bean.dongjclbs??>
<#if bean.dongjclbs== '0' >
<Cell><Data ss:Type="String">否</Data></Cell>
<#else>
<Cell><Data ss:Type="String">是</Data></Cell>
</#if>
<#else>
<Cell><Data ss:Type="String"></Data></Cell>
</#if>
<Cell><Data ss:Type="String">${bean.editor!''}</Data></Cell>
<Cell><Data ss:Type="String">${bean.edit_time!''}</Data></Cell>
   </Row>
      </#list>
   