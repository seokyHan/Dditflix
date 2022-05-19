<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="kr.or.ddit.user.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp" />
 <%
 	BoardVO review = (BoardVO) request.getAttribute("review");
 	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
 	LoginVO user = null;
	if(session.getAttribute("loginChk") != null){
		user = (LoginVO) session.getAttribute("loginChk");
	}
 %>

<title>리뷰작성</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">




<style>
label {
margin-bottom : 10px;
margin-top : 10px;
font-size: 15px;
color: #E65F5F;
font-weight: bold;
}
#send {
	margin-top: 50px;
}
.btn-default {
      background: #000;
      color: #fff;
      float: right;
      margin : 10px;
   }
.btn-default:hover {
      background: #fff;
      color: #000;
   }
span {
	display: flex;
	margin-bottom: 10px;
}

#list {
	float: left;
}

</style>

<body>
<div class="bgBox">
	<div class="concord-img-gradient"></div>

    <div class="main">
        
            <div class="titleWrap mb-5">
                <h2 class="pageTitle pb-3">Review</h2>
            </div>     
            
<div class="container">
  <form action="detail.do" method="post">
  
  <div class="form-group">
    <label for="reviewDate">Date</label>
    <span id="reviewDate" name="reviewDate"><%=review.getRvDt() %></span>
  </div>

<span>-------------------------------------------------------------------</span>

    <div class="form-group">
      <label for="title">Contents</label>
       <span id="contTitle" name="contTitle"><%=review.getContTitle() %></span>
    </div>
    
 <span>-------------------------------------------------------------------</span>
    
  <div class="form-group">
   <label for="content">Name</label>
	<span id="writer" name="writer"><%=review.getUserId() %></span>
  </div>
 
 <span>-------------------------------------------------------------------</span>
 
  <div class="form-group">
   <label for="content">Title</label>
	<span id="reviewTitle" name="reviewTitle"><%=review.getRvTitle() %></span>
 </div>
 
 <span>-------------------------------------------------------------------</span>
 
    <div class="form-group">
   <label for="content">Review</label>
	<span id="reviewContent" name="reviewContent"><%=review.getRvContent() %></span>
 </div>
 

 
<!--     <div class="form-group"> -->
<!--     </div> -->
<!--         등록버튼	 -->
<div class="text-align-center">
    <input type="button" class="btn btn-primary" value="수정" id="modify"
       onclick="isIdCheck();">
    <input type="button" class="btn btn-danger" value="삭제" id="delete" onclick="reviewDelete();">
<!--     <input type = "button" class = "btn btn-primary btn-sm" value = "목록으로" id="list" onclick="list();"> -->
</div>
  </form>
</div>
    </div>
    </div>


<script>
	function isIdCheck(){
		
		<%
			if(review.getUserId().equals(user.getUsers_id())){
		%>
				location.href= "/Dditflix/admin/board/update.do?userId=<%=user.getUsers_id() %>&contTitle=<%=review.getContTitle() %>";		
		<%
			} else{	
		%>
				alert("리뷰는 작성자만 수정 가능합니다!");
		<%
			}
		%>
		
	}
	
	
	function reviewDelete(){
		<%
		if(review.getUserId().equals(user.getUsers_id())){
		%>
		
			location.href= "/Dditflix/admin/board/delete.do?userId=<%=user.getUsers_id() %>&rvId=<%=review.getRvId() %>";		
		
		<%
		} else{	
		%>
			alert("리뷰는 작성자만 삭제 가능합니다!");
		
		<%
		}
		%>
	}
	
	
</script>
</body>
 <jsp:include page="../../common/footer.jsp" />

