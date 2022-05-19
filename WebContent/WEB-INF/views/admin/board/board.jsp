<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="kr.or.ddit.user.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
  	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
  	LoginVO user = null;
	if(session.getAttribute("loginChk") != null){
		user = (LoginVO) session.getAttribute("loginChk");
	}
  %>

 <jsp:include page="../../common/header.jsp" />
 <title>게시판</title>


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.css"/> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user/sub.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user/boardSelect.css">
<!--     script -->
<script src="http://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<style>
#write{
	margin-bottom: 10px;
}
</style>
<body>
<div class="bgBox">
  <div class="concord-img-gradient"></div>
     <div class="main">
        
            <div class="titleWrap mb-5">
               <h2 class="pageTitle pb-3">Review</h2>
            </div>
            
             <div class="text-align-right">
              <input type="button" class="btn btn-primary" value="글쓰기" id="write"
              	onclick="reviewWrite();">
			</div>
            
            
            <table class="table" id="myTable">
                <thead>
                    <tr>
                        <th>Contents</th>
                        <th>Name</th>
                        <th>Title</th>
                        <th>Review</th>
                       	<th>Date</th>
                    </tr>
                </thead>
                <tbody>
                  <%
                  	int boardSize = boardList.size();
                  if(boardSize > 0) {
                	  for(int i=0; i<boardSize; i++) {
                %>
                
                <tr style="cursor:pointer; color:#blue;" 
                onClick="location.href='/Dditflix/admin/board/detail.do?writer=<%=boardList.get(i).getUserId() %>&contTitle=<%=boardList.get(i).getContTitle()%>&rvId=<%=boardList.get(i).getRvId() %>'">
                	<td><%=boardList.get(i).getContTitle() %></td>
                	<td><%=boardList.get(i).getUserId() %></td>
                	<td><%=boardList.get(i).getRvTitle() %></td>
                	<td><%=boardList.get(i).getRvContent() %></td>
                	<td><%=boardList.get(i).getRvDt() %></td>
                </tr>
                <% 		  
                	  }
                  } else {
                %>
                
                <tr>
                	<td>리뷰를 등록해주세요!</td>
                </tr>
                
                <% 	  
                  }
                  %>
                </tbody>
            </table>
            
            <%
            	if(msg.equals("성공")) {
            %>
            
            <script>
            	alert("정상적으로 처리되었습니다.");
            </script>
            
            
            <% 		
            	}
            %>
           
    </div>
</div>
<script>
        $(document).ready( function () {
            $('#myTable').DataTable({
                ordering: false,
                lengthChange: false
            });
        } );
        
        function reviewWrite(){
<%--         	location.href="/Dditflix/user/board/insert.do?userId=<%=user.getUsers_id() %>"; --%>
			
			location.href="/Dditflix/admin/board/insert.do?userId=<%=user.getUsers_id() %>";
        }
        
</script>

</body>
 <jsp:include page="../../common/footer.jsp" />