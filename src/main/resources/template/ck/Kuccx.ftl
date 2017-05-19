------------------------------------------
库存查询导出文件  
导出时间: ${date}
------------------------------------------

零件号:${lingjbh}                   供应商编号:${gongysdm}                   仓库:${cangkbh}                   子仓库:${zickbh}
入库时间:${rukrq1}                   至:${rukrq2}




------------------------------------------								
<#list list as table>
${table.cangkbh!''}	${table.ush!''}	${table.ucgs!''}${table.gongysdm!''}	${table.kuwbh!''}	${table.lingjsl!''}	${table.danw!''}	${table.elh!''}	${table.pich!''}	${table.ruklx!''}	${table.rukrq!''}	${table.shixrq!''}	${table.kucts!''}	${table.zhuangtsx!''}
</#list>
