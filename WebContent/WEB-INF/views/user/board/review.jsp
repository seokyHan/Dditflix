<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="kr.or.ddit.user.viewHistory.vo.ViewHistoryVO"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="kr.or.ddit.user.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	 List<ViewHistoryVO> htContTitle = (List<ViewHistoryVO>)request.getAttribute("htContTitle");
 	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
 	LoginVO user = null;
	if(session.getAttribute("loginChk") != null){
		user = (LoginVO) session.getAttribute("loginChk");
	}
 %>
<jsp:include page="../../common/header.jsp" />
<title>리뷰작성</title>


    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">
<!--     script -->
<script src="../../../../resources/js/jquery/jquery-3.6.0.min.js"></script>
<script src="../../../../resources/js/bootstrap/bootstrap.min.js"></script>
<style>
p {
	padding : 10px;
}
label {
	padding : 5px;
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

<body>
<div class="bgBox">
  <div class="concord-img-gradient"></div>
    <div class="main">
       <div class="titleWrap mb-5">
          <h2 class="pageTitle pb-3">리뷰 작성</h2>      
       </div>
            
<div class="container">
  <form action="insert.do" method="post">
    <p name="rvmovie">영화</p>
   		<select name = "rvmovie">
   			<option value="none">영화를 선택해주세요^0^</option>
   			
   			
   			<%
   				int historySize = htContTitle.size();
   			if(historySize > 0) {
   				for(int i=0; i<historySize; i++) {
   			%>
   			
   			<option value="<%=htContTitle.get(i).getCont_title() %>"><%=htContTitle.get(i).getCont_title() %></option>
   			
   			<% 		
   				}
   			} else {
   			%>
   			
   			<option value="시청한 영화가 없습니다">시청한 영화가 없습니다</option>
   			
   			<% 	
   			}
   			%>
   			
   		</select>
    	

	  <div class="form-group">
<!--       <label for="userId">글쓴이</label> -->
      <p>
      	<input type="hidden" name="writer" value="<%=user.getUsers_id() %>">
		
      </p>			 
    </div>
    	


    <div class="form-group">
      <label for="title">제목</label>
      	<input type="text" class="form-control" id="title"
      			 placeholder="제목 입력" name="title"
       				maxlength="100" required="required">
    </div>
    
    
    <div class="form-group">
   		<label for="content">내용</label>
   		<textarea class="form-control" rows="5" id="content" name="content" placeholder="내용 작성"></textarea>
    </div>
  
<!--         등록버튼	 -->
    <input type="submit" class="btn btn-primary" value="등록" id="send">
</form>
	</div>
  </div>
</div> 
</body>
 
 <jsp:include page="../../common/footer.jsp" />

