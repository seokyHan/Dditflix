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
            <form action="update.do" method="post" id="form" enctype="multipart/form-data">
            	<div class="form-group">
            		<label class="label pr-5">맴버십 이름</label>
            		<input class="input-text" type="text" name="mmbrsRating">
            	</div>
            	<div class="form-group">
            		<label class="label pr-5">맴버십 가격</label>
            		<input class="input-text" type="number" name="mmbrsPrice">
            	</div>
            	<div class="form-group">
            		<label class="label pr-5">화질 등급</label>
            		<input class="input-text" type="text" name="mmbrsQualityGrade">
            	</div>
            	<div class="form-group">
            		<label class="label pr-5">맴버십 로고</label>
            		<input class="input-text" type="file" name="mmbrsLogoUrl">
            	</div>
            	<div class="text-align-center">
            		<input id="submitBtn" class="btn btn-danger" type="button" value="등록">
            	</div>
            </form>
            <script>
            $("#submitBtn").click(function(){
        		$.ajax({
        			type: "post",
        			url: "insert.do",
        			data: $("#form").serialize(),
        			success: function(result){
        				if(result=="성공"){
							alert("입력되었습니다.");
							location.href="list.do"
						} else {
							alert("입력 실패.");
							location.href="list.do"
						}
        			}
        		});
        	});
            </script>
        </div>
    </div>
<jsp:include page="../../common/footer.jsp" />
