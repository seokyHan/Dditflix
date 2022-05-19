<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.sub1 {
    color: red;
    font-weight: bolder;
    font-size: 2.5em;
    padding-bottom: 40px;
}

input{
	text-align: center;
    padding: 8px 0px;
    /* border-radius: 5px; */
    color: gray;
    background: none;
    border-radius: 0.7ex;
    width: 250px;
    border: 1px solid rgba(225,225,225,0.3)
}

#btn{
	background-color: #7a7a7a;
	border : none;
	color: white;
}


label {
 	display: block;
 	width: 120px;
 	align: center;
}


</style>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dditflix</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/comm_sub.css">
	<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/user/myPage.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login/validation.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소api -->
 
 </head>
<body>
    
<jsp:include page="../../common/header.jsp" />
    <div class="bgBox">
        <div class="concord-img-gradient"></div>
        <section class="main">
            <div class="titleWrap mb-5">
            	<div class="pageTitle pb-3">컨텐츠 등록</div>
            </div>
          	<form class="form-horizontal" action="insertContent.do" method="post" enctype="multipart/form-data">
				<table class="table" border="1">
					<thead class="thead">
						<tr>
							<td>
								<div class="form-group">
									<label for="conTitle">컨텐츠 제목</label>
									<input type="text" class="inputId"  name="conTitle" autocomplete="off">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label for="cast">주연</label>
									<input type="text" class=""  name="cast" autocomplete="off">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label for="genre">장르</label>
									<input type="text" class=""  name="genre" autocomplete="off">
									
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label for="director">감독</label>
									<input type="text" class=""  name="director" autocomplete="off">
									
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label for="nation">국가</label>
									<input type="text" class=""  name="nation" autocomplete="off">
									
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<label for="time">상영시간</label>
									<input type="text" class=""  name="time" autocomplete="off">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label for="plot">줄거리</label>
								<input type="text" class=""  name="plot" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label for="poster">포스터 등록</label>
									<input type="file" class=""  name="poster" autocomplete="off">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label for="movie">영상등록</label>
									<input type="file" class=""  name="movie" autocomplete="off">	
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" class="btn btn-primary btn-sm"> 등록</button>
							</td>
						</tr>					
				</table>                   	
             </form>
        </section>
    </div>  


<script>
</script>

<jsp:include page="../../common/footer.jsp" />




