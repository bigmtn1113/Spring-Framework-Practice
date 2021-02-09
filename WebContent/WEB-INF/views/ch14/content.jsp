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
						<h5>DataSource</h5>
						<div>
							<a class="btn btn-info" href="connTest">연결 테스트</a>
						</div>
					</div>	
					
					<div class="sector">
						<h5>회원가입</h5>
						<div>
							<form method="post" action="join" enctype="multipart/form-data">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">id</span></div>
									<input type="text" name="mid" class="form-control">
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">name</span></div>
									<input type="text" name="mname" class="form-control">
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">password</span></div>
									<input type="password" name="mpassword" class="form-control">
								</div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">photo</span></div>
									<input type="file" name="mphotoAttach" class="form-control">
								</div>
								<input class="btn btn-info" type="submit" value="가입"/>
							</form>
						</div>
					</div>
					
					<div class="sector">
						<h5>로그인</h5>
						<c:if test="${sessionMid == null}">
							<div>
								<form method="post" action="login">
									<div class="input-group">
										<div class="input-group-prepend"><span class="input-group-text">id</span></div>
										<input type="text" name="mid" class="form-control" value="${ch14Member.mid}">
										<c:if test="${error == 'wrongMid'}">
											<span style="color:red">*아이디가 존재하지 않습니다.</span>
										</c:if>
									</div>
									<div class="input-group">
										<div class="input-group-prepend"><span class="input-group-text">password</span></div>
										<input type="password" name="mpassword" class="form-control" value="${ch14Member.mpassword}">
										<c:if test="${error == 'wrongMpassword'}">
											<span style="color:red">*비밀번호가 일치하지 않습니다.</span>
										</c:if>
									</div>
									<input class="btn btn-info" type="submit" value="로그인"/>
								</form>
							</div>
						</c:if>
						<c:if test="${sessionMid != null}">
							<a class="btn btn-info" href="logout">로그아웃</a>
						</c:if>
					</div>
					
					<div class="sector">
						<h5>게시판</h5>
						<div>
							<a class="btn btn-info" href="javascript:boardList()">게시물 목록</a>
							<script type="text/javascript">
								function boardList(pageNo) {
									if(!pageNo) pageNo = 1;
									
									$.ajax({
										url:"boardList",
										data: {pageNo : pageNo},
										success:function(data) {
											$("#board_result").html(data);
										}
									});
								}
							</script>
						</div>
						<div id="board_result" style="margin-top:30px"></div>
					</div>	
				</div>
			</div>
		</div>
	</body>
</html>