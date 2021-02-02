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
		<td>${board3.no}</td>
		<td>${board3.title}</td>
		<td>${board3.content}</td>
		<td>${board3.writer}</td>
		<td><fmt:formatDate value="${board3.date}" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>

