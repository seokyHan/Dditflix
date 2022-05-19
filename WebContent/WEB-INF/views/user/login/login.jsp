<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/user/login2.css">  
    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>

</head>
<body>
    <header id="header">
        <nav class="navbar navbar-expand-md navbar-dark">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/user/login/login.do"><img class="logo" src="../../resources/images/Netflix_logo.svg" alt=""></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
    </header>
    <div class="bgBox">
        <div class="concord-img-gradient"></div>
        <section class="main">
            <div class="titleWrap mb-5 pb-5">
            <div class="sub1">로그인</div>
           		<form action="<%=request.getContextPath()%>/user/login/login.do" method="post">
					<table class="table" border="1">
						<tbody>
							<tr>
								<td id="trp">
								<input type="text" placeholder="아이디" class="inputId" name="userId" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<input type="password" placeholder="비밀번호" class="inputPw" name="userPw" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td id="trp1" colspan="2"><input class="btn btn-danger btn-lg" type="submit" value="로그인"></td>
							</tr>
							<tr>
								<td id="trp2"><a class="join" href="<%=request.getContextPath()%>/user/join/join.do"> 회원가입 하시겠습니까?</a></td>
							</tr>
							<tr>
								<td id="trp2"><a class="join" href="<%=request.getContextPath()%>/user/login/findId.do"> ID 찾기</a>/<a class="join" href="<%=request.getContextPath()%>/user/login/findPw.do"> 비밀번호 찾기 </a></td>
							</tr>
						</tbody>
					</table>                   	
              </form>
            </div>
        </section>
    </div> 
	<script>
		const url = new URL(window.location.href);

		// URLSearchParams 객체
		const urlParams = url.searchParams;

		// URLSearchParams.get()
		if(urlParams.get('msg')=='탈퇴성공'){
			alert("탈퇴가 완료되었습니다.");
		};
	</script>
<jsp:include page="../../common/footer.jsp" />
