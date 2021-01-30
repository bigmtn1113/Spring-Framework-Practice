<%@ page contentType="text/html; charset=UTF-8"%>

<div class="menu">
	<ul>
		<li class="chapter">Ch01. <a href="<%=request.getContextPath()%>/ch01/content">Development Environment</a></li>
		<li class="chapter">Ch02. <a href="<%=application.getContextPath()%>/ch02/content"> Controller - RequestMapping</a></li>
		<li class="chapter">Ch03. <a href="${pageContext.request.contextPath}/ch03/content">Controller - Request Parameter</a></li>
		<li class="chapter">Ch04. <a href="<%=application.getContextPath()%>/ch04/content">Controller - Validation</a></li>
	</ul>
</div>