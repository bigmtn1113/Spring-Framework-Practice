<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
				
				<div class="content">	
					<div class="sector">
						<h5>인증(Authentication)</h5>
						<div>
							<sec:authorize access="isAnonymous()">
								<a class="btn btn-info" href="loginForm">Login Form</a>
							</sec:authorize>
							
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="name"/>님 환영합니다.
								<form method="post" action="<%=application.getContextPath()%>/logout" style="display:inline-block;">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								    <input class="btn btn-info" type="submit" value='Logout'/>
								</form>
								<%-- Spring form 태그를 사용할 경우에는 자동으로 CSRF 파라미터 및 토근이 포함됨
								<form:form method="post" action="${pageContext.request.contextPath}/logout">
									<input class="btn btn-info" type="submit" value='Logout' />
								</form:form> --%>
								<a class="btn btn-info" href="loginInfo">Login Info</a>
							</sec:authorize>							
						</div>
					</div>				
					
					<div class="sector">
						<h5>접근 권한(Authorization)</h5>
						<div>
							<div>
								<a class="btn btn-info" href="adminAction">Admin Action</a>
								<a class="btn btn-info" href="managerAction">Manager Action</a>
								<a class="btn btn-info" href="userAction">User Action</a>
							</div>						
							<ul>
								<sec:authorize access="hasAuthority('ROLE_ADMIN')">
									<li>Admin Menu</li>
								</sec:authorize>
								
								<sec:authorize access="hasRole('ROLE_MANAGER')">
									<li>Manager Menu</li>
								</sec:authorize>
								
								<sec:authorize access="isAuthenticated()">
									<li>User Menu</li>	
								</sec:authorize>	
							</ul>
						</div>
					</div>
						
	
					<div class="sector">
						<h5>비밀번호 인코딩</h5>
						<div>
							<form method="post" action="encodePassword">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
									<input type="text" name="mpassword" class="form-control" value="12345" readonly>
								</div>
								<input style="margin-top:10px;" class="btn btn-info" type="submit" value="인코딩"/>
							</form>
						</div>
					</div>
						
					<div class="sector">
						<h5>회원가입</h5>
						<div>
							<form method="post" action="join" enctype="multipart/form-data">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
									<input type="text" name="mid" class="form-control">
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mname</span></div>
									<input type="text" name="mname" class="form-control">
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
									<input type="password" name="mpassword" class="form-control">
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mrole</span></div>
									<select name="mrole" class="form-control">
										<option value="ROLE_ADMIN">ROLE_ADMIN</option>
										<option value="ROLE_MANAGER">ROLE_MANAGER</option>
										<option value="ROLE_USER" selected>ROLE_USER</option>
									</select>
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">mphoto</span></div>
									<input type="file" name="mphotoAttach" class="form-control">
								</div>
								<input style="margin-top:10px;" class="btn btn-info" type="submit" value="회원가입"/>
							</form>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</body>
</html>