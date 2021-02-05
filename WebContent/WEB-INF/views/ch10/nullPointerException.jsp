<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<title>Spring Framework</title>
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.5.1.min.js"></script>
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
						<h5>예외 처리</h5>
						<div>
							서버에서 데이터가 없어서 처리를 하지 못합니다.<br/>
							올바르게 데이터를 전송했는지 확인해주세요.
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>