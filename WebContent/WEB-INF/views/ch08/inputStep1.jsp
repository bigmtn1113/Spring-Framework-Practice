<%@ page contentType="text/html; charset=UTF-8"%>

<form>
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">data1</span></div>
		<input type="text" id="data1" name="data1" class="form-control" value="${inputForm.data1}">
	</div>	
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">data2</span></div>
		<input type="text" id="data2" name="data2" class="form-control" value="${inputForm.data2}">
	</div>
	<input class="btn btn-info" type="button" onclick="inputStep2()" value="다음단계"/>
</form>


