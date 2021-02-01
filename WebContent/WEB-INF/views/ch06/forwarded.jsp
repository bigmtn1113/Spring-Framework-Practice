<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form>
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">param1</span></div>
		<input type="text" name="param1" class="form-control" value="${param1}" readonly>
	</div>
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">param2</span></div>
		<input type="text" name="param2" class="form-control" value="${param2}" readonly>
	</div>
</form>