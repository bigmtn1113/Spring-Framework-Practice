<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<form id="boardUpdateForm">
	<input type="hidden" id="bno" name="bno" value="${board.bno}"/>
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">btitle</span></div>
		<input id="btitle" type="text" name="btitle" class="form-control" value="${board.btitle}">
		<span id="btitleError" class="error"></span>
	</div>
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">bcontent</span></div>
		<textarea id="bcontent" name="bcontent" class="form-control">${board.bcontent}</textarea>
		<span id="bcontentError" class="error"></span>
	</div>
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
		<input id="mid" type="text" name="mid" class="form-control" 
			<c:if test="${sessionMid!=null}">value="${sessionMid}"</c:if>
			<c:if test="${sessionMid==null}">value="id"</c:if>
			readonly>
		<span id="btitleError" class="error"></span>
	</div>
		
	<div style="margin-top: 10px">
		<a class="btn btn-info" href="javascript:boardUpdate()">글수정</a>
		<script type="text/javascript">
			function boardUpdate() {
				var bno = $("#bno").val();
				
				var btitle = $("#btitle").val().trim();
				if(btitle == "") {
					$("#btitleError").text("필수");
				} else {
					$("#btitleError").text("");
				}
				
				var bcontent = $("#bcontent").val().trim();
				if(bcontent == "") {
					$("#bcontentError").text("필수");
				} else {
					$("#bcontentError").text("");
				}
				
				if(btitle == "" || bcontent == "") {
					return;	
				}
				
				$.ajax({
					url:"boardUpdate",
					method:"post",
					data: {bno:bno, btitle:btitle, bcontent:bcontent},
					success:function(data) {
						if(data.result == "success") {
							boardList();
						}
					}
				});
			}
		</script>
		
		<a class="btn btn-info" href="javascript:boardList()">취소</a>
	</div>
</form>
