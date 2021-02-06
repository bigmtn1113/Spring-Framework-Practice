<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h6 style="margin-top: 5px">[HTML 태그로 작성된 양식]</h6>
<form method="post" action="join3">
	개발언어:
	<c:forEach var="lang" items="${languageList}">
		<c:set var="checked" value="false"/>
		<c:forEach var="temp" items="${ch11Member.mlanguage}">
			<c:if test="${lang == temp}">
				<c:set var="checked" value="true"/>
			</c:if>
		</c:forEach>

		<c:if test="${checked}">
			<input type="checkbox" name="mlanguage" value="${lang}" checked/>${lang}
		</c:if>
		<c:if test="${!checked}">
			<input type="checkbox" name="mlanguage" value="${lang}"/>${lang}
		</c:if>
	</c:forEach>
	<br />
	개발스킬:
	<c:forEach var="skill" items="${skillList}">
		<c:set var="checked" value="false"/>
		<c:forEach var="temp" items="${ch11Member.mskill}">
			<c:if test="${skill.value == temp}">
				<c:set var="checked" value="true"/>
			</c:if>
		</c:forEach>

		<c:if test="${checked}">
			<input type="checkbox" name="mskill" value="${skill.value}" checked/>${skill.label}
		</c:if>
		<c:if test="${!checked}">
			<input type="checkbox" name="mskill" value="${skill.value}"/>${skill.label}
		</c:if>
	</c:forEach>
	<br/>
	<input class="btn btn-danger" type="submit" value="가입"/>
</form>

<h6 style="margin-top: 5px">[Spring 제공 태그로 작성된 양식]</h6>
<form:form modelAttribute="ch11Member">
	개발언어: <form:checkboxes path="mlanguage" items="${languageList}"/>
	<br/>
	개발스킬: <form:checkboxes path="mskill" items="${skillList}" itemLabel="label" itemValue="value"/>
	<br/>
	<input class="btn btn-danger" type="submit" value="가입"/>
</form:form>