<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css"/>
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
			
			<div class="mainCenter">
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
				
				<div class="content">
					<div class="sector">
						<h5>GET 방식 매핑</h5>
						<div>
							<a class="btn btn-info" href="getMethod">getMethod() 요청</a>
							<a class="btn btn-danger" href="postMethod">postMethod() 요청</a>
						</div>
					</div>
					
					<div class="sector">
						<h5>POST 방식 매핑</h5>
						<div>
							<form method="post" action="getMethod" style="display:inline-block;">
								<input class="btn btn-danger" type="submit" value="getMethod() 요청"/>
							</form>
							<form method="post" action="postMethod" style="display:inline-block;">
								<input class="btn btn-info" type="submit" value="postMethod() 요청"/>
							</form>
						</div>
					</div>
					
					<div class="sector">
						<h5>폼요청(GET)과 폼처리(POST)를 동일한 요청으로 매핑</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun()">폼요청(GET)</a>
							<script>
								function fun() {
									$.ajax({
										url:"join",
										method:"GET",
										success: function(data) {
											$("#fun_result").append(data);
										}
									});
								}
							</script>
							<br/><br/>
							<div id="fun_result"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>