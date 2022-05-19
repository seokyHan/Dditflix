<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="kr.or.ddit.user.qna.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../../common/header.jsp" />
    <%
    List<QnaVO> qnaList = (List<QnaVO>)request.getAttribute("qnaList");
    QnaVO qv = (QnaVO) request.getAttribute("qv");
    String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
    LoginVO user = null;
  	if(session.getAttribute("loginChk") != null){
  		user = (LoginVO) session.getAttribute("loginChk");
  	}
    %>

    <title>자주 묻는 질문</title>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="../../../../resources/js/jquery/jquery-3.6.0.min.js"></script>
	<script src="../../../../resources/js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user/sub.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user/boardSelect.css">
<link rel="stylesheet" href="../../resources/css/user/qna.css">

<body>
<div class="bgBox">
<div class="concord-img-gradient"></div>
   <div class="main">
            <div class="titleWrap mb-5">
                <h1 class="pageTitle pb-3">자주 묻는 질문</h1>
            </div>
		 <div class="acco-menu"> 
			<%
		 		int qnaSize = qnaList.size();	
		 		if(qnaSize > 0) {
		 		for(int i=0; i<qnaSize; i++) {
		 	%> 
			
			<button class="accordion"><%=qnaList.get(i).getqQuestion() %></button> 
		 	<div class="panel"> 
			  <p><%=qnaList.get(i).getqAnswer() %></p> 
<%-- 			  <input type="hidden" name="qCode" value="<%=qnaList.get(i).getqCode() %>"> --%>
			  <%
			  
			  if(request.getRequestURL().indexOf("/admin/") > -1 ){
			  
			  %>
			  
			  <input type="button" class="btn btn-primary btn-sm" id="qModify" value="수정" onclick="isIdCheck(<%=qnaList.get(i).getqCode() %>);">
			  <input type="button" class="btn btn-primary btn-sm" id="qCancel" value="삭제" onclick="qnaDelete(<%=qnaList.get(i).getqCode() %>);">
			  
			  <%
			  
			  	} 
			  
			  %>
		 	</div> 
			
			<%
		 		}
		 	  }
		 	%>

		 </div> 
		 
		 <%
		 	if(msg.equals("성공")){
		 %>
		 
		 <script>
		 	alert("정상적으로 처리되었습니다.");
		 </script>
		 
		 <% 		
		 	}
		 %>
            
			<div class="acco-button">
			
			<%
// 				if(user.getUsers_id().equals("admin")) {
					if(request.getRequestURL().indexOf("/admin/") > -1 ){
			%>
			
			<input type="button" class="btn btn-primary" value="등록" onclick="qnaWrite();">
			
			<% 		
				}
			%>
			
			</div>
   </form>
</div>
</div>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}

function qnaWrite(){
	
	<%
		if(request.getRequestURL().indexOf("/admin/") > -1 ){
 	%> 
	
		location.href = "/Dditflix/user/qna/qnainsert.do?userId=<%=user.getUsers_id() %>";
	
	<%
		}else{
 	%> 
	
		alert("QnA는 관리자만 등록할 수 있습니다.");
	
	<%
		}
 	%> 
	
}

function isIdCheck(qcode){
	
	<%
	
	if(request.getRequestURL().indexOf("/admin/") > -1 ){
	%>
	
		location.href = "/Dditflix/user/qna/qnaupdate.do?userId=<%=user.getUsers_id() %>&qCode="+ qcode;
		
	<%
		}else{
	%>
	
		alert("QnA는 관리자만 수정 가능합니다.");
	
	<%
		}
	%>
}

function qnaDelete(qcode){
	<%
	if(user.getUsers_id().equals("admin")){
%>

	location.href = "/Dditflix/user/qna/qnadelete.do?userId=<%=user.getUsers_id()%>&qCode=" + qcode;

<%
	}else{
%>

	alert("QnA는 관리자만 삭제 가능합니다.");

<%
	}
%>
}

</script>
</body>
<jsp:include page="../../common/footer.jsp" />lo