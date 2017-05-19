------------------------------------------
质检零件导出文件  
导出时间: ${date!''}
------------------------------------------

质检单		仓库号		US号		零件编号		零件名称		零件数量		EL号		质检单类型		交货单号		批次号		质检组		质检员		供应商编号		供应商名称
<#list list as table>
${table.zhijqdh!''}		${table.cangkbh!''}		${table.ush!''}		${table.lingjbh!''}		${table.lingjmc!''}		${table.lingjsl!''}		${table.elh!''}		${table.zhijlx!''}		${table.blh!''}		${table.pich!''}		${table.zhijz!''}		${table.zhijy!''}		${table.gongysdm!''}		${table.gongysmc!''}
</#list>
