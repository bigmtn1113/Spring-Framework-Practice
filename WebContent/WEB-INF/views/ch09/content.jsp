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
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">
	</head>
	<body>
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
			<div class="mainCenter">
				<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	
				<div class="content">
					<div class="sector">
						<h5>게시물 등록</h5>
						<div>
							<form method="post" action="boardUpload" enctype="multipart/form-data">
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">제목</span></div>
									<input type="text" name="title" class="form-control">
								</div>	
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">내용</span></div>
									<input type="text" name="content" class="form-control">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">파일</span></div>
									<input type="file" name="attach" class="form-control">
								</div>
								<input class="btn btn-info" type="submit" value="글올리기"/>
							</form>
						</div>
					</div>
					
					<div class="sector">
						<h5>게시물 등록(AJAX)</h5>
						<div>
							<a class="btn btn-info" href="javascript:boardUploadAjax()">글올리기</a>
							<div>
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">제목</span></div>
									<input type="text" id="title" name="title" class="form-control">
								</div>	
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">내용</span></div>
									<input type="text" id="content" name="content" class="form-control">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend"><span class="input-group-text">파일</span></div>
									<input type="file" id="attach" name="attach" class="form-control">
								</div>
							</div>
						</div>
					</div>
					<script>
						function boardUploadAjax() {
							//문자 파트 값 얻기
							var title = $("#title").val();
							var content = $("#content").val();
							
							//파일 파트의 값을 얻기
							//var file = $("#attach")[0];
							var file = document.querySelector("#attach");
							
							//muiltipart/form-data 인코딩을 위한 FormData 객체 생성
							var multipart = new FormData();
							
							//문자 파트 추가
							multipart.append("title", title);
							multipart.append("content", content);
							
							//파일 파트 추가
							if(file.files.length != 0) {
								//사용자가 파일을 선택했을 경우
								multipart.append("attach", file.files[0]);	// 파일이 여러개 선택가능할 경우가 있는데 그때 0번째 파일 
							}
							
							//AJAX 통신
							$.ajax({
								url: "boardUploadAjax",
								method: "post",
								data: multipart,
								cache: false,	//파일을 메모리에 저장하지 않도록 설정
								processData: false,	//파일을 가공하지 않도록 설정. 멋대로 인코딩하는 걸 방지
								contentType: false,	//요청 헤더에 Content-Type을 추가하지 않도록 설정
								success: function(data) {
									$("#fileListDiv").html(data);
								}
							});
						}
					</script>
					
					<div class="sector">
						<h5>파일 목록</h5>
						<div id="fileListDiv" style="margin-top: 30px"></div>
						<script>
							$(function() {
								getFileList();
							});
							
							function getFileList() {
								$.ajax({
									url: "getFileList",
									success: function(data) {
										$("#fileListDiv").html(data);
									}
								});
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>