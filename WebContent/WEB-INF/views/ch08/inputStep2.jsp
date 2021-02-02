<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<form>
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">data3</span></div>
		<input type="text" id="data3" name="data3" class="form-control" value="${inputForm.data3}">
	</div>	
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">data4</span></div>
		<input type="text" id="data4" name="data4" class="form-control" value="${inputForm.data4}">
	</div>
	<input class="btn btn-info" type="button" onclick="inputStep1()" value="이전단계"/>
	<input class="btn btn-info" type="button" onclick="inputDone()" value="입력완료"/>
</form>



