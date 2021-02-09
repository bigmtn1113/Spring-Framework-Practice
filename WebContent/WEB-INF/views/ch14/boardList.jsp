<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<a class="btn btn-info" href="javascript:boardWrite()" style="margin-bottom: 10px">글쓰기</a>
	<script type="text/javascript">
		function boardWrite() {
			$.ajax({
				url:"boardWrite",
				success:function(data) {
					$("#board_result").html(data);
				}
			});
		}
	</script>
	
	<div>
		<table style="width:auto" class="table table-sm table-bordered">
			<tr>
				<th style="width:50px">번호</th>
				<th style="width:200px">제목</th>
				<th style="width:100px">글쓴이</th>
				<th style="width:100px">날짜</th>
			</tr>
			
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.bno}</td>
					<td><a href="javascript:boardDetail(${board.bno})">${board.btitle}</a></td>
					<td><img class="rounded-circle" width=30px height=30px src="photodownload?fileName=${board.mphoto}"/></td>
					<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="4" style="text-align: center">
					<a class="btn btn-outline-primary btn-sm" href="javascript:boardList(1)">처음</a>
					<c:if test="${pager.groupNo > 1}">
						<a class="btn btn-outline-info btn-sm" href="javascript:boardList(${pager.startPageNo - 1})">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo == i}">
							<a class="btn btn-primary btn-sm" href="javascript:boardList(${i})">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo != i}">
							<a class="btn btn-outline-success btn-sm" href="javascript:boardList(${i})">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo < pager.totalPageNo}">
						<a class="btn btn-outline-info btn-sm" href="javascript:boardList(${pager.endPageNo + 1})">다음</a>
					</c:if>
					<a class="btn btn-outline-primary btn-sm" href="javascript:boardList(${pager.totalPageNo})">맨끝</a>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function boardDetail(bno) {
				$.ajax({
					url:"boardDetail",
					data: {bno:bno},
					success:function(data) {
						$("#board_result").html(data);
					}
				});
			}
		</script>
	</div>
</div>