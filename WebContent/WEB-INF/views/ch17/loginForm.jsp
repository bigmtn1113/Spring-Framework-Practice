<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
			<div class="mainCenter">
				<div class="content">	
					<div class="sector" style="width:500px; margin: auto;">
						<h5>Login Form</h5>
						<img src="<%=application.getContextPath()%>/resources/images/security.png" width="100%"/>
						<div>
							<form method="post" action="<%=application.getContextPath()%>/login">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
									<input type="text" name="mid" class="form-control" value="${mid}"/>
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
									<input type="password" name="mpassword" class="form-control"/>
								</div>
								<input class="btn btn-info" style="margin-top:10px; width:49.5%;" name="submit" type="submit" value="Login"/>
								<input class="btn btn-info" style="margin-top:10px; width:49.5%;" name="submit" type="button" value="Cancel" onclick="loginCancel()"/>
								<script>
									function loginCancel() {
										location.href = "<%=application.getContextPath()%>/ch17/content";
									}
								</script>
							</form>
							<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">		
								<div class="alert alert-danger" style="margin-top:10px" role="alert" style="width:auto;">
									아이디 또는 비밀번호가 틀렸습니다.
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>