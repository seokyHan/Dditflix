<%@page import="kr.or.ddit.user.myPage.vo.MemberShipVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	MemberShipVO mv = (MemberShipVO) request.getAttribute("mv");

	session = request.getSession();

	// 1. 파라미터정보 가져오기
	LoginVO usersVo = (LoginVO) session.getAttribute("loginChk");
%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<jsp:include page="../../common/header.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/comm_sub.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/user/myPage.css">
<script	src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.0.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


<style>
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	text-align: center;
	vertical-align: middle;
	border: 1px solid #444444;
	padding: 10px;
}
</style>
</head>

<body>
	<div class="bgBox">
		<div class="concord-img-gradient">
			<nav id="nav">
				<dl>
					<dt>마이페이지</dt>
					<dd>
						<a class="menuLink"	href="<%=request.getContextPath()%>/user/myPage/main.do">개인정보조회 및 수정</a>
					<dd>
						<a class="menuLink"	href="<%=request.getContextPath()%>/user/myPage/myMemberShip.do">My	멤버십</a>
					</dd>
					<dd>
						<a class="menuLink"	href="<%=request.getContextPath()%>/user/myPage/withdrawal.do">회원 탈퇴</a>
					</dd>
				</dl>
			</nav>
		</div>
		<div class="main">
			<div class="titleWrap mb-5">
				<h2 class="pageTitle pb-3">My 멤버십</h2>
			</div>
			<table class="table" id="myTable">
				<thead>
					<tr>
						<td colspan="2" style="font-size: 1.5em; font-weight: bolder;">내
							멤버십 등급</td>
					</tr>
					<tr>
						<td><img class="titleImg" src="<%=mv.getMmbrs_logo()%>"
							alt=""></td>
						<td style="font-weight: bold; font-size: 3em; width: 60%;"><%=mv.getMmbrs_rating()%></td>
					</tr>
				</thead>
			</table>
			<%
				List<MemberShipVO> msList = (List<MemberShipVO>) request.getAttribute("msList");

				String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
			%>
			<div style="display: flex;">
				<table class="table" id="myTable" style="border: 3px;">
					<thead>
						<tr>
							<td colspan="2"><img style="width: 50%" class="titleImg"
								src="<%=msList.get(0).getMmbrs_logo()%>"></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><%=msList.get(0).getMmbrs_rating()%></td>
						</tr>
						<tr>
							<th>서비스 화질</th>
							<td><%=msList.get(0).getMmbrs_quality_grade()%></td>
						</tr>
						<tr>
							<th>가격</th>
							<td>무료</td>
						</tr>
					</thead>
				</table>
				<table class="table" id="myTable" style="border: 3px;">
					<thead>
						<tr>
							<td colspan="2"><img style="width: 50%" class="titleImg"
								src="<%=msList.get(1).getMmbrs_logo()%>"></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><%=msList.get(1).getMmbrs_rating()%></td>
						</tr>
						<tr>
							<th>서비스 화질</th>
							<td><%=msList.get(1).getMmbrs_quality_grade()%></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><%=msList.get(1).getMmbrs_price()%>원</td>
						</tr>
						<%-- 					<form action="<%=request.getContextPath()%>/user/myPage/myMemberShip.do" method="post"> --%>
						<tr>
							<td colspan="2"><button id="check_module1"
									class="btn btn-primary btn-del" type="button"
									style="background-color: red; border-color: black;">
									구독결제</button> <input type="hidden" name="mmbrs_rating"
								value="<%=msList.get(1).getMmbrs_rating()%>"></td>
						</tr>
						<!-- 					</form> -->
					</thead>
				</table>
				<table class="table" id="myTable" style="border: 3px;">
					<thead>
						<tr>
							<td colspan="2"><img style="width: 50%" class="titleImg"
								src="<%=msList.get(2).getMmbrs_logo()%>"></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><%=msList.get(2).getMmbrs_rating()%></td>
						</tr>
						<tr>
							<th>서비스 화질</th>
							<td><%=msList.get(2).getMmbrs_quality_grade()%></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><%=msList.get(2).getMmbrs_price()%>원</td>
						</tr>
						<%-- 					<form action="<%=request.getContextPath()%>/user/myPage/myMemberShip.do" method="post"> --%>
						<tr>
							<td colspan="2"><button id="check_module2"
									class="btn btn-primary btn-del" type="button"
									style="background-color: red; border-color: black;">
									구독결제</button> <input type="hidden" name="mmbrs_rating"
								value="<%=msList.get(2).getMmbrs_rating()%>"></td>
						</tr>
						<!-- 					</form> -->
					</thead>
				</table>
				<table class="table" id="myTable" style="border: 3px;">
					<thead>
						<tr>
							<td colspan="2"><img style="width: 50%" class="titleImg"
								src="<%=msList.get(3).getMmbrs_logo()%>"></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><%=msList.get(3).getMmbrs_rating()%></td>
						</tr>
						<tr>
							<th>서비스 화질</th>
							<td><%=msList.get(3).getMmbrs_quality_grade()%></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><%=msList.get(3).getMmbrs_price()%>원</td>
						</tr>
						<tr>
							<td colspan="2"><button id="check_module3"
									class="btn btn-primary btn-del" type="button"
									style="background-color: red; border-color: black;">
									구독결제</button> <input type="hidden" name="mmbrs_rating"
								value="<%=msList.get(3).getMmbrs_rating()%>"></td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

	<script>
$("#check_module1").click(function(){
   IMP.init('imp22830422');   //아임포트 관리자계정
   //결제 시스템을 실행시키는 함수
     IMP.request_pay({
      pay_method: 'card',
      name: '베이직',
      amount: '8000',   //테스트 완료 후 가격정보 넣기

      buyer_name:"<%=usersVo.getUsers_name()%>"
         }, function(rsp) {
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               msg += rsp.buyer_name;
               msg += rsp.paid_amount;

               // 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
               // 결제내역을 사용자에게 보여주기 위해 필요함.
               $.ajax({
                  url : "<%=request.getContextPath()%>/user/myPage/myMemberShip1.do",
                  type : "post",
                  data : {
                     "users_id" : "<%=usersVo.getUsers_id()%>",
                     "mmbrs_rating" : rsp.name,
                     "mmbrs_price" : rsp.paid_amount
                  },
                  dataType : "json",
                  success : function(result) {
                     if (result == "1") {
                        alert(msg);

                     } else {
                        alert("DB입력실패");
                        return false;
                     }
                  },
                  error : function(a, b, c) {
                  }
               });
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '\n에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
         });
      });
      
      
$("#check_module2").click(function(){
   IMP.init('imp22830422');   //아임포트 관리자계정
   //결제 시스템을 실행시키는 함수
     IMP.request_pay({
      pay_method: 'card',
      name: '스탠다드',
      amount: '10000',   //테스트 완료 후 가격정보 넣기
      buyer_name:"<%=usersVo.getUsers_name()%>"
         }, function(rsp) {
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               msg += rsp.buyer_name;
               msg += rsp.paid_amount;

               // 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
               // 결제내역을 사용자에게 보여주기 위해 필요함.
               $.ajax({
                  url : "<%=request.getContextPath()%>/user/myPage/myMemberShip1.do",
                  type : "post",
                  data : {
                      "users_id" : "<%=usersVo.getUsers_id()%>",
                      "mmbrs_rating" : rsp.name,
                      "mmbrs_price" : rsp.paid_amount
                  },
                  dataType : "json",
                  success : function(result) {
                     if (result == "1") {
                        alert(msg);
						
                     } else {
                        alert("디비입력실패");
                        return false;
                     }
                  },
                  error : function(xhr) {
                	  alert(xhr.status);
                  }
               });
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '\n에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
         });
      });
      
      
$("#check_module3").click(function(){
      IMP.init('imp22830422');   //아임포트 관리자계정
      //결제 시스템을 실행시키는 함수
        IMP.request_pay({
         pay_method: 'card',
         name: '프리미엄',
         amount: '15000',   //테스트 완료 후 가격정보 넣기

         buyer_name:"<%=usersVo.getUsers_name()%>"
            }, function(rsp) {
               if (rsp.success) {
                  var msg = '결제가 완료되었습니다.';
                  msg += rsp.buyer_name;
                  msg += rsp.paid_amount;

                  // 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
                  // 결제내역을 사용자에게 보여주기 위해 필요함.
                  $.ajax({
                     url : "<%=request.getContextPath()%>/user/myPage/myMemberShip1.do",
                     type : "post",
                     data : {
                         "users_id" : "<%=usersVo.getUsers_id()%>",
                         "mmbrs_rating" : rsp.name,
                         "mmbrs_price" : rsp.paid_amount
					 },
					 dataType : "json",
					 success : function(result) {
					     if (result == "1") {
							alert(msg);

							} else {
								alert("디비입력실패");
								return false;
							}
							},
							 error : function(a, b, c) {
								}
															});
												} else {
													var msg = '결제에 실패하였습니다.';
													msg += '\n에러내용 : '
															+ rsp.error_msg;
												}
												alert(msg);
											});
						});
						

	const url = new URL(window.location.href);

	// URLSearchParams 객체
	const urlParams = url.searchParams;

	// URLSearchParams.get()
	if(urlParams.get('msg')=='성공'){
		alert("멤버십 등급이 변경되었습니다.");
	}else if(urlParams.get('msg')=='실패'){
		alert("멤버십 등급이 변경을 실패하였습니다. \n고객센터로 문의해주세요\n(☎042-222-8202)");
	};

		
	</script>

</body>
</html>


<jsp:include page="../../common/footer.jsp" />