<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="kr.or.ddit.user.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp" />
<%
	BoardVO reviewVo = (BoardVO) request.getAttribute("reviewVO");
%>
<title>리뷰 수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">
<title>리뷰작성</title>
    <jsp:include page="../../common/header.jsp" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">


<style>
p {
	padding : 10px;
}
label {
	padding : 5px;
}
#modify {
	margin-top: 50px;
}
.btn-default {
      background: #000;
      color: #fff;
   }
.btn-default:hover {
      background: #fff;
      color: #000;
   }

</style>

<body>
<div class="bgBox">
	<div class="concord-img-gradient"></div>
    	<div class="main">
            <div class="titleWrap mb-5">
                <h2 class="pageTitle pb-3">리뷰 수정</h2> 
            </div>        
<div class="container">


<!-- 수정페이지 출력 -->
  <form action="update.do" method="post">
  
   <label for="reviewDate">날짜</label>
    <p id="reviewDate" name="reviewDate"><%=reviewVo.getRvDt() %></p>



    <div class="form-group">
      <label for="title">영화</label>
       <%=reviewVo.getContTitle() %>
       <input type="hidden" name="contTitle" value="<%=reviewVo.getContTitle() %>">
    </div>
	  
	  <div class="form-group">
	  	<label for="content">글쓴이</label>
		  <p>
		  	<%=reviewVo.getUserId() %>
       		<input type="hidden" name="userId" value="<%=reviewVo.getUserId() %>">
		  </p>
	  </div>
  
    <div class="form-group">
      <label for="title">리뷰 제목</label>
        <p>
       		<input type="text" name="rvTitle" placeholder="<%=reviewVo.getRvTitle() %>">
		</p>
    </div>
    
    
    <div class="form-group">
   <label for="content">내용</label>
   <textarea class="form-control" rows="5" id="content" name="content" placeholder="<%=reviewVo.getRvContent() %>"></textarea>
 </div>
 
 
 
    <div class="form-group">
    </div>
<!--         등록버튼	 -->
<div class="text-align-center">
    <input type="submit" class="btn btn-primary" value="수정" id="modify">
</div>

  </form>


	</div>
   </div>
 </div> 
</body>

 <jsp:include page="../../common/footer.jsp" />

