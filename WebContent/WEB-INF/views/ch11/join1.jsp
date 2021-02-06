<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h6 style="margin-top: 5px">[HTML 태그로 작성된 양식]</h6>
<form method="post" action="join1">
	아이디: <input type="text" id="mid" name="mid" value="${ch11Member.mid}"/><br/>
	이름: <input type="text" id="mname" name="mname" value="${ch11Member.mname}"/><br/>
	비밀번호: <input type="password" id="mpassword" name="mpassword" value="${ch11Member.mpassword}"/><br/>
	국가: <input type="text" id="mnation" name="mnation" value="${ch11Member.mnation}"/><br/>
	<input class="btn btn-danger" type="submit" value="가입"/>
</form>

<h6 style="margin-top: 5px">[Spring 제공 태그로 작성된 양식]</h6>
<form:form modelAttribute="ch11Member">
	아이디: <form:input type="text" path="mid"/><br/>
	이름: <form:input path="mname"/><br/>
	비밀번호: <form:password path="mpassword"/><br/>
	국가: <form:input path="mnation"/><br/>
	<input class="btn btn-danger" type="submit" value="가입"/>
</form:form>