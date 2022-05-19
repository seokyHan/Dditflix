<%@page import="kr.or.ddit.admin.membership.vo.AdminMembershipVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">  
    <div class="bgBox">
        <div class="concord-img-gradient"></div>
        <div class="main">
            <div class="titleWrap mb-5">
                <h2 class="pageTitle pb-3">맴버십 등급 수정</h2>
            </div>
            <%
            	AdminMembershipVO vo = (AdminMembershipVO) request.getAttribute("membership");
            %>
            <form action="update.do" method="post" id="form" enctype="multipart/form-data">
           		<input type="hidden" name="mmbrsId" value="<%=vo.getMmbrsId() %>">
            	<div class="form-group">
            		<label class="label pr-5">맴버십 이름</label>
            		<input class="input-text" type="text" name="mmbrsRating" value="<%=vo.getMmbrsRating() %>">
            	</div>
            	<div class="form-group">
            		<label class="label pr-5">맴버십 가격</label>
            		<input class="input-text" type="number" name="mmbrsPrice" value="<%=vo.getMmbrsPrice() %>">
            	</div>
            	<div class="form-group">
            		<label class="label pr-5">화질 등급</label>
            		<input class="input-text" type="text" name="mmbrsQualityGrade" value="<%=vo.getMmbrsQualityGrade() %>">
            	</div>
            	<div class="form-group">
            		<label class="label pr-5">맴버십 로고</label>
            		<input class="input-text" type="file" name="mmbrsLogoUrl" value="">
            	</div>
            	<div class="text-align-center">
            		<input id="submitBtn" class="btn btn-danger" type="button" value="수정">
            	</div>
            </form>
            <script>
            $("#submitBtn").click(function(){
        		$.ajax({
        			type: "post",
        			url: "update.do",
        			data: $("#form").serialize(),
        			success: function(result){
        				if(result=="성공"){
							alert("수정되었습니다.");
							location.href="list.do"
						} else {
							alert("수정 실패.");
							location.href="list.do"
						}
        			}
        		});
        	});
            </script>
        </div>
    </div>
<jsp:include page="../../common/footer.jsp" />
