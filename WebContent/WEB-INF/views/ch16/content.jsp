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
						<h5>계좌 현황</h5>
						<div style="margin-top: 20px;">
							<table style="width:auto" class="table table-sm table-bordered">
								<tr>
									<th style="width:50px">번호</th>
									<th style="width:100px">소유주</th>
									<th style="width:200px">잔고</th>
								</tr>
								
								<c:forEach var="account" items="${list}">
									<tr>
										<td>${account.ano}</td>
										<td>${account.owner}</td>
										<td style="text-align:right;">${account.balance}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					
					<div class="sector">
						<h5>코드를 이용한 트랜잭션</h5>
						<div>
							<form id="accountTransferForm1" method="post" action="transaction1">
								<table style="width:auto" class="table table-sm table-bordered">
									<tr>
										<th style="width:150px">출금 계좌</th>
										<td><input type="text" name="fromAno" value="1"/></td>
									</tr>
									<tr>
										<th>입금 계좌</th>
										<td><input type="text" name="toAno" value="2"/></td>
									</tr>
									<tr>
										<th>이체 금액</th>
										<td><input type="text" name="amount" value="10000"/></td>
									</tr>
								</table>
								<input class="btn btn-info" type="submit" value="이체하기"/>						
							</form>
						</div>
					</div>				
				
					<div class="sector">
						<h5>선언적 트랜잭션</h5>
						<div>
							<form id="accountTransferForm2" method="post" action="transaction2">
								<table style="width:auto" class="table table-sm table-bordered">
									<tr>
										<th style="width:150px">출금 계좌</th>
										<td><input type="text" name="fromAno" value="1"/></td>
									</tr>
									<tr>
										<th>입금 계좌</th>
										<td><input type="text" name="toAno" value="2"/></td>
									</tr>
									<tr>
										<th>이체 금액</th>
										<td><input type="text" name="amount" value="10000"/></td>
									</tr>
								</table>
								<input class="btn btn-info" type="submit" value="이체하기"/>						
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>