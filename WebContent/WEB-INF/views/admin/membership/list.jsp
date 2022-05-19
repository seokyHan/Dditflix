
<%@page import="kr.or.ddit.admin.membership.vo.AdminMembershipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp" />

<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/comm_sub.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/user/cart.css">
<script>
</script>
<div class="bgBox">
	<div class="concord-img-gradient"></div>
	<div class="main">
		<div class="titleWrap mb-5">
			<h2 class="pageTitle pb-3">맴버십 관리</h2>
		</div>
		<div class="conWrap">
			<div class="text-align-right mb-3">
				<a id="insertBtn" class="btn btn-danger" href="insert.do">등록하기</a>
			</div>
			<table id="cardCmnyTable" class="table">
				<thead>
					<tr>
						<th scope="row">순번</th>
						<th scope="col">맴버십 등급</th>
						<th scope="col">가격</th>
						<th scope="col">화질 등급</th>
						<th scope="col">변경</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<AdminMembershipVO> membershipList = (List<AdminMembershipVO>) request.getAttribute("membershipList");
						if (membershipList.size() > 0) {
							for (int i=0; i<membershipList.size(); i++) {
					%>
					<tr>
						<td><%=i+1 %></td>
						<td><%=membershipList.get(i).getMmbrsRating() %></td>
						<td><%=membershipList.get(i).getMmbrsPrice()%>원</td>
						<td><%=membershipList.get(i).getMmbrsQualityGrade() %></td>
						<td>
							<a class="btn btn-primary" href="update.do?mmbrsId=<%=membershipList.get(i).getMmbrsId() %>">수정</a>
							<input class="btn btn-danger" type="button" value="삭제" role="delete" data-id="<%=membershipList.get(i).getMmbrsId() %>">
						</td>
					</tr>
					<%
							}
						} else {
					%>
					<tr>
						<td colspan="100%">등록된 맴버십 등급이 없습니다.</td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<script>
			$("input[role=delete]").click(function(){
				let mmbrsId = $(this).data("id");
				$.ajax({
					type: "post",
					url: "delete.do",
					data: { "mmbrsId": mmbrsId },
					dataType: "json",
					success: function(result){
						if(result>0){
							alert("삭제되었습니다.");
							location.href="list.do"
						} else {
							alert("삭제 실패.");
							location.href="list.do"
						}
					},
					error: function(request, status, error) { alert("code:" + request.status + "\n" + "error:" + error); }
				})
			});
		</script>
	</div>
</div>
<jsp:include page="../../common/footer.jsp" />
