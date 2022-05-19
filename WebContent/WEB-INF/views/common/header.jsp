<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	LoginVO user = null;
	if(session.getAttribute("loginChk") != null){
		user = (LoginVO) session.getAttribute("loginChk");
%>
	<!DOCTYPE html>
	<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Dditflix</title>
	
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.1.1/css/all.min.css" integrity="sha512-ioRJH7yXnyX+7fXTQEKPULWkMn3CqMcapK0NNtCN8q//sW7ZeVFcbMJ9RvX99TwDg6P8rAH2IqUSt2TLab4Xmw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.css"/> 
	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
	    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user/mainModal.css">
	    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.0.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
	    <script src="http://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	</head>
	
	<script>
		window.history.forward();
		function noBack(){
			window.history.forward();
		}
	    $(function() {
	
	        var url = window.location.pathname,
	    	urlRegExp = new RegExp(url);  
	        $('.nav-link').each(function () {
	            if(urlRegExp.test(this.href)) {
	                $(this).addClass('active');
	            }
	        });
	    });
	</script>
	
<%
	//관리자 메뉴
	if(request.getRequestURL().indexOf("/admin/") > -1 ){
%>
	<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	    <header id="header">
	        <nav class="navbar navbar-expand-md navbar-dark">
	            <a class="navbar-brand" href="<%=request.getContextPath()%>/admin/sales/list.do"><img class="logo" src="<%=request.getContextPath()%>/resources/images/Netflix_logo.svg" alt=""></a>
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	            <div class="collapse navbar-collapse" id="navbarSupportedContent">
	                <ul class="navbar-nav mr-auto">
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/sales/list.do">Sales</a></li>
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/content/contentList.do">Contents</a></li>
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/membership/list.do">Membership</a></li>
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/board/board.do">Review</a></li>
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/notice/notice.do">Notice</a></li>
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/qna/qna.do">QnA</a></li>
	                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/member/AdminMember.do">Member Management</a></li>
	                </ul>
	                </div>
	                <span style="margin-right:15px; font-weight:bold;"><%=user.getUsers_name() %>님</span>
	                <button type="button" class="btn" style="color:#fff; font-size: 1.7rem;" id="logout"><i class="fas fa-sign-out-alt"></i></button>
	        </nav>
	          
		<div class="d-flex justify-content-end" style="box-shadow: 3px 3px 5px #00000088; position: fixed; right: 4vw; bottom: 7vh;">
			<a class="btn btn-primary" href="../../user/home/main.do">사용자 모드</a>
		</div>
	    </header>
<%		
	//일반 유저메뉴
	} else{
%>		
	
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/search.css">    
    <script src="${pageContext.request.contextPath}/resources/js/content/searchContent.js"></script>
	    
    <header id="header">
        <nav class="navbar navbar-expand-md navbar-dark">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/user/home/main.do"><img class="logo" src="<%=request.getContextPath()%>/resources/images/Netflix_logo.svg" alt=""></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/home/main.do">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/board/board.do">Review</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/myPage/wishList.do">Wish List</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/myPage/viewRecord.do">View Record</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/myPage/DownPym.do">PayMent List</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/notice/notice.do">Notice</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/qna/qna.do">QnA</a></li>
                </ul>
                </div>
				  
				    <input type="text" class="searchText inputField" id="input">
				    <button class="search" id="shbtn"><i class="fa fa-search"></i></button>
				  
                <span id="nickname" style="margin-right:15px; font-weight:bold; "><%=user.getUsers_name() %>님</span>
                <a class="btn" style="color:#fff; font-size: 1.8rem;" style="margin-right:5px" href="<%=request.getContextPath()%>/user/myPage/main.do"><i class="far fa-user-circle"></i></a>
                <button type="button" class="btn" style="color:#fff; font-size: 1.7rem;" id="logout"><i class="fas fa-sign-out-alt"></i></button>
        </nav>
        <a style="display: block; line-height: 0; border-radius: 3rem; padding: 1rem; font-size: 1.3rem; background-color: #dc3545; color: #fff; text-shadow: 2px 2px 2px gray;box-shadow: 3px 3px 5px #00000088; position: fixed; right: 4vw; top: 10vh;" href="<%=request.getContextPath()%>/user/cart/list.do">
        	<i class="fas fa-shopping-cart" style="text-shadow: 2px 2px 5px #00000088;"></i>
        </a>
        <%
		//관리자 페이지 보기
		if(user.getUsers_type().equals("1")){
		%>
		<div class="d-flex justify-content-end" style="box-shadow: 3px 3px 5px #00000088; position: fixed; right: 4vw; bottom: 7vh">
			<a class="btn btn-warning" href="../../admin/sales/list.do">관리자 모드</a>
		</div>
		<%
		}
		%>
    </header>

<% 		
	}
%>
  	<div id="modal"></div>
  	
    <script>	   
	    $('#logout').on('click', function(){
	    	location.href = "<%=request.getContextPath()%>/user/login/logout.do";
	    })
    </script>

<% 
	//로그인 없이 main.do로 접근 못함.
	}else{
%>	
		<script>
			alert('로그인이 필요합니다.');
			location.href = "<%=request.getContextPath()%>/user/login/login.do";
		</script>
<%
	}
%>