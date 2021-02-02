<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<table style="width:auto" class="table table-sm table-bordered">
	<tr>
		<th style="width:50px">번호</th>
		<th style="width:200px">제목</th>
		<th style="width:200px">내용</th>
		<th style="width:100px">글쓴이</th>
		<th style="width:100px">날짜</th>
	</tr>
	
	<tr>
		<%-- @ModelAttribute("board4") 설정 안 할 경우
		<td>${ch07Board.no}</td>
		<td>${ch07Board.title}</td>
		<td>${ch07Board.content}</td>
		<td>${ch07Board.writer}</td>
		<td><fmt:formatDate value="${ch07Board.date}" pattern="yyyy-MM-dd"/></td> --%>
		<td>${board4.no}</td>
		<td>${board4.title}</td>
		<td>${board4.content}</td>
		<td>${board4.writer}</td>
		<td><fmt:formatDate value="${board4.date}" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>

