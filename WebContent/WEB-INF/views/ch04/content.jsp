<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
						<h5>joinForm Validate</h5>
						<div>
							<form method="post" action="join">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
									<input type="text" name="mid" class="form-control" value="${joinForm.mid}">
									<form:errors cssClass="error" path="joinForm.mid"/>
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
									<input type="password" name="mpassword" class="form-control" value="${joinForm.mpassword}">
									<form:errors cssClass="error" path="joinForm.mpassword"/>
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">memail</span></div>
									<input type="text" name="memail" class="form-control" value="${joinForm.memail}">
									<form:errors cssClass="error" path="joinForm.memail"/>
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mtel</span></div>
									<input type="text" name="mtel" class="form-control" value="${joinForm.mtel}">
									<form:errors cssClass="error" path="joinForm.mtel"/>
								</div>
								<input class="btn btn-info" type="submit" value="가입"/>
							</form>
						</div>
					</div>
					
					<div class="sector">
						<h5>loginForm Validate</h5>
						<div>
							<form method="post" action="login">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
									<input type="text" name="mid" class="form-control" value="${loginForm.mid}">
									<form:errors cssClass="error" path="loginForm.mid"/>
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
									<input type="password" name="mpassword" class="form-control" value="${loginForm.mpassword}">
									<form:errors cssClass="error" path="loginForm.mpassword"/>
								</div>
								<input class="btn btn-info" type="submit" value="로그인"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>