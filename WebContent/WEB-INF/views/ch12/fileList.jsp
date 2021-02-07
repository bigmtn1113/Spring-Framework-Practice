<%@ page contentType="application/json; charset=UTF-8"%>
<%-- json 응답 - 주석을 jsp로 해야 오류가 안뜬다.--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ["a.jpg","b.jpg","c.jpg"] --%>

[
<c:forEach var="fileName" items="${fileNames }" varStatus="status">
	"${fileName}"
	<c:if test="${!status.last}">,</c:if> 
</c:forEach>
]