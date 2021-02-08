<%@ page contentType="text/html; charset=UTF-8"%>

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
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css"/>
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
			<div class="mainCenter">
				<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	
				<div class="content">
					<div class="sector">
						<h5>XML 객체 생성 및 주입</h5>
						<div>
							spring/root/ch13_di.xml 참조
						</div>
					</div>
					<div class="sector">
						<h5>@Annotation을 이용한 객체 생성 및 주입</h5>
						<div>
							<ul>
								<li><a href="useAutowired">@Autowired 이용</a></li>
								<li><a href="useResource">@Resource 이용</a></li>
								<li><a href="useInject">@Inject 이용</a></li>
							</ul>
						</div>
					</div>
					<div class="sector">
						<h5>properties의 값을 주입</h5>
						<div>
							<a class="btn btn-info btn-sm" href="useProperties1">값 주입(XML 방식)</a>
							<a class="btn btn-info btn-sm" href="useProperties2">값 주입(@Annotation 방식)</a>
						</div>
					</div>
					<div class="sector">
						<h5>인터페이스 타입 주입</h5>
						<div>
							<a class="btn btn-info btn-sm" href="useInterface">인터페이스 타입 주입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>