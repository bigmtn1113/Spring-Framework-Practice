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
					<h5>Redirect로 데이터 전달</h5>
					<div>
						param1: ${param1}<br/>
						param2: ${param2}<br/>
						param3: ${param3}<br/>
						param4: ${param4}<br/>
						param5: ${param5}<br/>
						param6: ${param6}<br/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
