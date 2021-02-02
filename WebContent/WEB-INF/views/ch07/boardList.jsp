<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<table style="width:auto" class="table table-sm table-bordered">
	<tr>
		<th style="width:50px">번호</th>
		<th style="width:200px">제목</th>
		<th style="width:100px">글쓴이</th>
		<th style="width:100px">날짜</th>
	</tr>
	
	<c:forEach var="board" items="${list}">
		<tr>
			<td>${board.no}</td>
			<td>${board.title}</td>
			<td>${board.writer}</td>
			<td><fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
</table>
