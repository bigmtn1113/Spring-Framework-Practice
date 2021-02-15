<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
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
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css"/>
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
			<div class="mainCenter">
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
				
				<div class="content">
					<div class="sector">
						<h5>Advice</h5>
						<div>
							<a class="btn btn-info" href="before">@Before</a>
							<a class="btn btn-info" href="after">@After</a>
							<a class="btn btn-info" href="afterReturning">@AfterReturning</a>
							<a class="btn btn-info" href="afterThrowing">@AfterThrowing</a>
							<a class="btn btn-info" href="around">@Around</a>
						</div>
					</div>
	
					<div class="sector">
						<h5>실행 시간 측정</h5>
						<div>
							<a class="btn btn-info" href="runtimeCheck">실행시간 측정</a>
						</div>
						<div id="sec02_result" style="margin-top:20px">
							<c:if test="${runtime != null}">
								${runtime} 나노초
							</c:if>
						</div>
					</div>
				
					<div class="sector">
						<h5>로그인 체크</h5>
						<div>
							<a class="btn btn-info" href="javascript:boardList()">게시물 목록</a>
							<script type="text/javascript">
								function boardList() {
									$.ajax({
										url:"boardList",
										success:function(data) {
											console.log(data);
											if(data.result == "loginNeed") {
												window.location.href = "<%=application.getContextPath()%>/ch14/content";	
											} else {
												$("#board_result").html(data);
											}
										}
									});
								}
							</script>	
							<div id="board_result" style="margin-top:20px"></div>				
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>