<%@ page contentType="text/html; charset=UTF-8"%>

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
						<h5>파일 다운로드</h5>
						<div>
							<script>
								$(function() {
									$.ajax({
									      url: "fileList",
									      success: function(data) { //json 응답 
									    	  var ulTag = "<ul>";
									    	  for(var i = 0; i < data.length; ++i) {
												 ulTag += "<li>";
												 ulTag += "<a href='fileDownload?fileName=" + data[i] + "'>"+ data[i] + "</a>";
												 ulTag += "</li>";
									    	  }
									    	  ulTag += "</ul>"
									    	  $("#filelist").html(ulTag);
									      }
									});
								});
							</script>
						</div>
						<div id="filelist" style="margin-top:30px;"></div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>