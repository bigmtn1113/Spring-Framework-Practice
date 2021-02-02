<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<title>Spring Framework</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>		
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
			<div class="mainCenter">
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
				
				<div class="content">		
					<div class="sector">
						<h5>HttpSession</h5>
						<div>
							<c:if test="${sessionMid == null}">
								<form method="post" action="login">
									<div class="input-group">
										<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
										<input type="text" name="mid" class="form-control" value="spring">
									</div>
									<div class="input-group">
										<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
										<input type="password" name="mpassword" class="form-control" value="12345">
									</div>
									<input class="btn btn-info" type="submit" value="로그인"/>
								</form>
							</c:if>					
							<c:if test="${sessionMid != null}">
								<a class="btn btn-info" href="userinfo">사용자정보</a>
								<a class="btn btn-info" href="logout">로그아웃</a>
							</c:if>
						</div>
					</div>
					
					<div class="sector">
						<h5>@SessionAttribute</h5>
						<div>
							<a class="btn btn-info" href="javascript:inputStep1()">입력</a>
							<script type="text/javascript">
								function inputStep1() {
									$.ajax({
										url:"inputStep1",
										success:function(data) {
											$("#inputStep").html(data);
										}
									});
								}
								
								function inputStep2() {
									$.ajax({
										url:"inputStep2",
										data:{data1:$("#data1").val(), data2:$("#data2").val()},
										method:"post",
										success:function(data) {
											$("#inputStep").html(data);
										}
									});
								}
								
								function inputDone() {
									$.ajax({
										url:"inputDone",
										data:{data3:$("#data3").val(), data4:$("#data4").val()},
										method:"post",
										success:function(data) {
											$("#inputStep").html("");
										}
									});
								}
							</script>
						</div>
						<div id="inputStep" style="margin-top: 10px"></div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>