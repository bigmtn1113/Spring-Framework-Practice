<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h6 style="margin-top: 5px">[HTML 태그로 작성된 양식]</h6>
<form method="post" action="join2">
	회원종류: <select id="mtype" name="mtype">
		<c:forEach var="type" items="${typeList}">
			<c:if test="${type == ch11Member.mtype}">
				<option value="${type}" selected>${type}</option>
			</c:if>
			<c:if test="${type != ch11Member.mtype}">
				<option value="${type}">${type}</option>
			</c:if>
		</c:forEach>
	</select><br/>
	직업: <select id="mjob" name="mjob">
		<option>---선택하세요---</option>
		<c:forEach var="job" items="${jobList}">
			<c:if test="${job == ch11Member.mjob}">
				<option value="${job}" selected>${job}</option>
			</c:if>
			<c:if test="${job != ch11Member.mjob}">
				<option value="${job}">${job}</option>
			</c:if>
		</c:forEach>
	</select><br/>
	회원도시: <select id="mcity" name="mcity">
		<c:forEach var="city" items="${cityList}">
			<c:if test="${city.value == ch11Member.mcity}">
				<option value="${city.value}" selected>${city.label}</option>
			</c:if>
			<c:if test="${city.value != ch11Member.mcity}">
				<option value="${city.value}">${city.label}</option>
			</c:if>
		</c:forEach>
	</select><br/>
	<input class="btn btn-danger" type="submit" value="가입"/>
</form>

<h6 style="margin-top: 5px">[Spring 제공 태그로 작성된 양식]</h6>
<form:form modelAttribute="ch11Member">
	회원종류: <form:select path="mtype" items="${typeList}"/><br/>
	직업: <form:select path="mjob">
			<option>---선택하세요---</option>
			<form:options items="${jobList}"/>
	</form:select><br/>
	회원도시: <form:select path="mcity" items="${cityList}" itemLabel="label" itemValue="value"/><br/>
	<input class="btn btn-danger" type="submit" value="가입"/>
</form:form>