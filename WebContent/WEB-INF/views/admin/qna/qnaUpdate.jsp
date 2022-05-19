<%@page import="kr.or.ddit.user.qna.vo.QnaVO"%>
<%@page import="kr.or.ddit.user.notice.vo.NoticeVO"%>
<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="kr.or.ddit.user.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp" />
<%
	QnaVO qnaVO = (QnaVO) request.getAttribute("qnaVO");
// 	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
// 	LoginVO user = null;
// 	if(session.getAttribute("loginChk") != null){
// 	user = (LoginVO) session.getAttribute("loginChk");
// }
%>
<title>QnA 수정</title>
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
                <h2 class="pageTitle pb-3">QnA 수정</h2> 
            </div>        
<div class="container">


<!-- 수정페이지 출력 -->
  <form action="qnaupdate.do" method="post">
	  
	    <div class="form-group">
	  	<label for="content">질문</label>
		  <p>
       		<textarea class="form-control" rows="5" id="content" name="qQuestion"><%=qnaVO.getqQuestion() %></textarea>
		  </p>
	  </div>
	  
	  
	  
	  
	  <div class="form-group">
	  	<label for="content">답</label>
		  <p>
       		<textarea class="form-control" rows="5" id="content" name="qAnswer"><%=qnaVO.getqAnswer() %></textarea>
		  </p>
	  </div>
 
   <div class="form-group">
<!--     <label for="reviewDate">글번호</label> -->
    <input type="hidden" name="qCode" value="<%=qnaVO.getqCode() %>">
  </div>

<!--         등록버튼	 -->
    <input type="submit" class="btn btn-primary" value="수정" id="modify">
  </form>


	</div>
   </div>
 </div> 
</body>

 <jsp:include page="../../common/footer.jsp" />

