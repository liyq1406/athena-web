------------------------------------------
出库流水查询导出文件  
导出时间: ${date}
------------------------------------------

零件号:${lingjbh}                   供应商编号:${gongysdm}                   仓库:${cangkbh}                   子仓库:${zickbh} 	
客户:${keh}                   上线模式:${shangxms}                   上线类型:${shangxfs}                   配送类别:${peislb} 	
出库时间:${chukrq1}                   至:${chukrq2}                   同步流水号:${zhengclsh1}                   至:${zhengclsh2}




------------------------------------------
要货令号        备货单号       仓库编号 US号         US型号  零件编号        零件名称              数量        零件单位   供应商代码      EL号         批次号         客户         上线类型  出库时间               流水号      配送类别 操作人                 备货人
<#list list as table>
${table.yaohlh!''} ${table.beihdh!''} ${table.cangkbh!''}    ${table.ush!''} ${table.usxh!''} ${table.lingjbh!''} ${table.lingjmc!''} ${table.lingjsl!''} ${table.danw!''}        ${table.gongysdm!''}   ${table.elh!''} ${table.pich!''} ${table.keh!''} ${table.shangxfs!''}    ${table.chukrq!''} ${table.zhengclsh!''} ${table.peislb!''}   ${table.usercode!''} ${table.beihybh!''}
</#list>
