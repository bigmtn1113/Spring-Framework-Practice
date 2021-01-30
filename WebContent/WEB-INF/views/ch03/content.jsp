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
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css" />
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
			<div class="mainCenter">
				<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	
				<div class="content">
					<div class="sector">
						<h5>요청 파라미터 읽기</h5>
						<div>
							<a class="btn btn-info" href="method1?param1=문자열&param2=5&param3=3.14&param4=true&param5=2030-12-05">요청 파라미터 전송</a>
							<br/><br/>
							<form method="post" action="method1">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param1</span>
									</div>
									<input type="text" name="param1" class="form-control" value="문자열">
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param2</span>
									</div>
									<input type="text" name="param2" class="form-control" value="5">
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param3</span>
									</div>
									<input type="text" name="param3" class="form-control" value="3.14">
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param4</span>
									</div>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary active">
											<input type="radio" name="param4" value="true" checked> true
										</label>
										<label class="btn btn-secondary">
											<input type="radio" name="param4" value="false"> false
										</label>
									</div>
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param5</span>
									</div>
									<input type="date" name="param5" class="form-control" value="2030-12-05">
								</div>
								<input class="btn btn-info" type="submit" value="요청 파라미터 전송" />
							</form>
						</div>
					</div>
	
					<div class="sector">
						<h5>요청 파라미터와 매개변수 이름이 다를 경우</h5>
						<div>
							<a class="btn btn-info" href="method2?param1=문자열&param2=5&param3=3.14&param4=true">요청 파라미터 전송</a>
						</div>
					</div>
	
					<div class="sector">
						<h5>필수 요청 파라미터 지정</h5>
						<div>
							<a class="btn btn-info" href="method3?param1=문자열1&param2=문자열2">올바른 요청 파라미터 전송</a>
							<a class="btn btn-danger" href="method3?param1=문자열1">잘못된 요청 파라미터 전송</a> <br />
						</div>
					</div>
	
					<div class="sector">
						<h5>디폴트값</h5>
						<div>
							<a class="btn btn-info" href="method4">요청 파라미터 없이 전송</a>
						</div>
					</div>
	
					<div class="sector">
						<h5>객체로 받기</h5>
						<div>
							<form method="post" action="method5">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param1</span>
									</div>
									<input type="text" name="param1" class="form-control" value="문자열" readonly>
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param2</span>
									</div>
									<input type="text" name="param2" class="form-control" value="5" readonly>
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param3</span>
									</div>
									<input type="text" name="param3" class="form-control" value="3.14" readonly>
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param4</span>
									</div>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary active">
											<input type="radio" name="param4" value="true" checked> true
										</label>
										<label class="btn btn-secondary">
											<input type="radio" name="param4" value="false"> false
										</label>
									</div>
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">param5</span>
									</div>
									<input type="date" name="param5" class="form-control" value="2030-12-05" readonly>
								</div>
								<input class="btn btn-info" type="submit" value="요청 파라미터 전송" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>