<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table style="width:auto" class="table table-sm table-bordered">
	<tr>
		<th style="width:50px">번호</th>
		<th style="width:200px">제목</th>
		<th style="width:100px">글쓴이</th>
		<th style="width:100px">날짜</th>
	</tr>
	
	<c:forEach var="board" items="${list}">
		<tr>
			<td>${board.bno}</td>
			<td>${board.btitle}</td>
			<td>${board.mid}</td>
			<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
</table>