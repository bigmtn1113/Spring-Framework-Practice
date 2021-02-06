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
						<h5>폼요청</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun1()">폼요청</a>
							<script>
								function fun1() {
									$.ajax({
										url: "join1",
										success: function(data) {
											$("#fun1_result").html(data);
										}
									});
								}
							</script>
							<div id="fun1_result"></div>
						</div>
					</div>
					
					<div class="sector">
						<h5>폼요청</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun2()">폼요청</a>
							<script>
								function fun2() {
									$.ajax({
										url: "join2",
										success: function(data) {
											$("#fun2_result").html(data);
										}
									});
								}
							</script>
							<div id="fun2_result"></div>
						</div>
					</div>
					
					<div class="sector">
						<h5>폼요청</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun3()">폼요청</a>
							<script>
								function fun3() {
									$.ajax({
										url: "join3",
										success: function(data) {
											$("#fun3_result").html(data);
										}
									});
								}
							</script>
							<div id="fun3_result"></div>
						</div>
					</div>
					
					<div class="sector">
						<h5>폼요청</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun4()">폼요청</a>
							<script>
								function fun4() {
									$.ajax({
										url: "join4",
										success: function(data) {
											$("#fun4_result").html(data);
										}
									});
								}
							</script>
							<div id="fun4_result"></div>
						</div>
					</div>
					
					<div class="sector">
						<h5>폼요청</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun5()">폼요청</a>
							<script>
								function fun5() {
									$.ajax({
										url: "join5",
										success: function(data) {
											$("#fun5_result").html(data);
										}
									});
								}
							</script>
							<div id="fun5_result"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>