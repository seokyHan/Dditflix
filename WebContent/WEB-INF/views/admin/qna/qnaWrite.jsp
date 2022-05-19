<%@page import="kr.or.ddit.user.qna.vo.QnaVO"%>
<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="kr.or.ddit.user.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	List<QnaVO> qnaList = (List<QnaVO>)request.getAttribute("qnaList");
 	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
 	LoginVO user = null;
	if(session.getAttribute("loginChk") != null){
		user = (LoginVO) session.getAttribute("loginChk");
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 작성</title>
    <jsp:include page="../../common/header.jsp" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">

<!--     script -->
<script src="../../../../resources/js/jquery/jquery-3.6.0.min.js"></script>
<script src="../../../../resources/js/bootstrap/bootstrap.min.js"></script>
<style>
label {
	padding : 10px;
}
#send {
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
</head>
<body>
<div class="bgBox">
 <div class="concord-img-gradient"></div>

  <div class="main">
    <div class="titleWrap mb-5">
      <h2 class="pageTitle pb-3">QnA 등록</h2>
    </div>     
<div class="container">
  <form action="qnainsert.do" method="post">

    <div class="form-group">
      <label for="title">질문</label>
      <input type="text" class="form-control" id="question"
       placeholder="제목 입력" name="question"
       maxlength="100" required="required">
    </div>
 
    <div class="form-group">
   <label for="content">답</label>
   <textarea class="form-control" rows="5" id="answer" name="answer" placeholder="내용 작성"></textarea>
 </div>
 
    <div class="form-group">
<!--     	<label>글쓴이</label> -->
    	<input type="hidden" name="writer" value="<%=user.getUsers_id() %>">
    </div>
    
    
<!--         등록버튼	 -->
    <input type="submit" class="btn btn-primary" value="등록" id="send">
  </form>
</div>
</div>
</div>
</body>
 
</html>
 <jsp:include page="../../common/footer.jsp" />

