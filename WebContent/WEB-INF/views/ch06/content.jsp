<%@ page contentType="text/html;charset=UTF-8"%>

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
						<h5>Forward</h5>
						<div>
							<a class="btn btn-info" href="javascript:forward()">Forward</a>
							<div>
								param1: ${param1} <br/>
								param2: ${param2} <br/>
							</div>
							<script type="text/javascript">
								function forward() {
									$.ajax({
										url:"forward",
										success:function(data) {
											$("#forward_result").html(data);
										}
									});
								}
							</script>
						</div>
						<div id="forward_result" style="margin-top:10px"></div>
					</div>
						
					<div class="sector">
						<h5>Redirect</h5>
						<div>
							<a class="btn btn-info" href="redirect">Redirect</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>