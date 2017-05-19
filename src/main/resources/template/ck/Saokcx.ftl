------------------------------------------
扫卡查询导出文件  
导出时间: ${date}
------------------------------------------


零件编号:${lingjbh}                                   客户:${keh}                                        循环编号:${xunhbm} 	
扫卡时间段:${saoksj1}                       至:${saoksj2}                                用户编号:${oper_no}



------------------------------------------																	
 循环编号                    循环规模        	循环类型	       要货令号                            状态		               零件号	   		      零件名称                                               装车数量                          零件单位                           临时卡标识                            取消标识                             客户                               扫卡时间                                            最晚交付时间                                 交付时间                                 用户编号                                              供应商			            发送编号
<#list list as table>
${table.xunhbm}                    ${table.dangqxhgm}        	${table.gonghms} ${table.yaohlh}                      ${table.yaohlzt}		              ${table.lingjbh}	             ${table.lingjmc}             ${table.yaohsl}                          ${table.danw}                                ${table.shiflsk}                                   ${table.quxbs}                               ${table.keh}                      ${table.saoksj}                              ${table.zuiwsj}                       ${table.jiaofsj}                      ${table.oper_no}                    ${table.gongysdm}                         ${table.fasbh}
</#list>
