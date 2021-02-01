<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html >
<html>
	<head>
		<meta charset="UTF-8">
			<title>Insert title here</title>
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
						<h5>헤더 읽기</h5>
						<div>
							<a class="btn btn-info" href="method1">브라우저 종류</a>
							<br/>
							브라우저 종류: ${browserKind}
						</div>
					</div>			
					<div class="sector">
						<h5>쿠키 저장 및 읽기</h5>
						<div>
							<a class="btn btn-info" href="method2">쿠키 저장</a>
							<a class="btn btn-info" href="method3">쿠키 읽기</a>
							<br/>
							mid: ${mid}<br/>
							memail: ${memail}<br/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>