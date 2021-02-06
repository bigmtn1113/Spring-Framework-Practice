<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form:form modelAttribute="ch11Member">
	<table style="width:auto; margin-top:20px" class="table table-sm table-bordered">
		<tr>
			<th style="width:100px"><spring:message code="join.form.mid"/></th>
			<td><form:input type="text" path="mid"/></td>
		</tr>
		<tr>
			<th><spring:message code="join.form.mname"/></th>
			<td><form:input type="text" path="mname"/></td>
		</tr>
		<tr>
			<th><spring:message code="join.form.mpassword"/></th>
			<td><form:password path="mpassword"/></td>
		</tr>
		<tr>
			<th><spring:message code="join.form.mnation"/></th>
			<td><form:input type="text" path="mnation"/></td>
		</tr>
	</table>
	<input class="btn btn-info" type="submit" value="<spring:message code="join.form.submit"/>"/>
</form:form>