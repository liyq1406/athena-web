<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<link href="<%=request.getContextPath()%>/decorators/athena/footer.css" type="text/css" rel="stylesheet"></link>
<form name="qiehuan" action="<%=request.getContextPath()%>/qiehuan.do" method="post">
<div class="footqh">
	<input type="hidden" name="qiehuan_hidden" value="cangku" >
</div>
<div align="center" class="youi-page-footer">	
	<t:changeTag name="CK">
			切换到&nbsp;&nbsp;<input type="submit" class="footbutton" value="仓  库">
	</t:changeTag>		
	Copyright © 2010-2015  All Rights  Reserved. 版权所有。
</div>
</form>	