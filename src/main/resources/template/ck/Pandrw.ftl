------------------------------------------
盘点任务导出文件  
导出时间: ${date!''}
------------------------------------------

任务编号:${renwbh!''}		状态:${zhuangt!''}		生成库存时间:${shengckcsj!''} 	  创建人:${pandr!''}

------------------------------------------
任务编号	          用户中心	          仓库		          盘点方式	          生成库存时间	         创建人	       库存生成方式	          状态
<#list list as table>
${table.renwbh!''}			${table.usercenter!''}		${table.cangkbh!''}	${table.pandfs!''}		${table.shengckcsj!''}	   ${table.pandr!''}   	${table.kucscfs!''}		${table.zhuangt!''}
</#list>
