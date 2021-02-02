<%@ page contentType="text/html;charset=UTF-8"%>

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
						<h5>ModelAndView 이용</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun1()">게시물 상세보기</a>
							<script type="text/javascript">
								function fun1() {
									$.ajax({
										url:"method1",
										success:function(data) {
											$("#fun1_result").html(data);
										}
									});
								}
							</script>
						</div>
						<div id="fun1_result" style="margin-top: 10px"></div>
					</div>
						
					<div class="sector">
						<h5>Model 이용</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun2()">게시물 상세보기</a>
							<script type="text/javascript">
								function fun2() {
									$.ajax({
										url:"method2",
										success:function(data) {
											$("#fun2_result").html(data);
										}
									});
								}
							</script>
						</div>
						<div id="fun2_result" style="margin-top: 10px"></div>
					</div>
					
					<div class="sector">
						<h5>@ModelAttribute 이용</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun3()">게시물 상세보기</a>
							<script type="text/javascript">
								function fun3() {
									$.ajax({
										url:"method3",
										success:function(data) {
											$("#fun3_result").html(data);
										}
									});
								}
							</script>
						</div>
						<div id="fun3_result" style="margin-top: 10px"></div>
					</div>
					
					<div class="sector">
						<h5>Command 객체 이용</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun4()">게시물 상세보기</a>
							<script type="text/javascript">
								function fun4() {
									$.ajax({
										url:"method4",
										method:"post",
										data: {no:4, title:"제목4", content:"내용4", writer:"홍길동", date:"2018-07-10"},
										success:function(data) {
											$("#fun4_result").html(data);
										}
									});
								}
							</script>
						</div>
						<div id="fun4_result" style="margin-top: 10px"></div>
					</div>
					
					<div class="sector">
						<h5>Model 이용</h5>
						<div>
							<a class="btn btn-info" href="javascript:fun5()">게시물 목록</a>
							<script type="text/javascript">
								function fun5() {
									$.ajax({
										url:"method5",
										success:function(data) {
											$("#fun5_result").html(data);
										}
									});
								}
							</script>
						</div>
						<div id="fun5_result" style="margin-top: 10px"></div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>