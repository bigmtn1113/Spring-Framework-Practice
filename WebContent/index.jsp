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
						<h5>개발환경 구축</h5>
						<ul>
							<li>1. JDK 설치</li>
							<li>2. Eclipse 설치</li>
							<li>3. Tomcat 등록</li>
							<li>4. Dynamic Web Project</li>
							<li>5. Convert to Maven Project</li>
							<li>6. pom.xml 의존 라이브러리 설정</li>
							<li>7. web.xml ContextLoaderListener 설정</li>
							<li>8. web.xml DispatcherServlet 설정</li>
							<li>9. web.xml CharacterEncodingFilter 설정</li>
							<li>10. dispatcher 설정 파일 작성</li>
							<li>11. root 설정 파일 작성</li>
							<li>12. 컨트롤러 클래스 작성</li>
							<li>13. JSP 작성</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>