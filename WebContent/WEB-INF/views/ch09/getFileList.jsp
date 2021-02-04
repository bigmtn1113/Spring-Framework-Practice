<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="fileName" items="${fileNames}">
	<a href="download?fileName=${fileName}"><img class="rounded-circle" width="70px" height="70px" src="download?fileName=${fileName}"/></a>
</c:forEach>