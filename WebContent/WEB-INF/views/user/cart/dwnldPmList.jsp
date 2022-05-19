<%@page import="kr.or.ddit.user.login.vo.LoginVO"%>
<%@page import="kr.or.ddit.user.downloadPayment.vo.UserDownloadPaymentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/user/mainModal.css">
<div class="modal fade" id="cardListModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="modal-title">결제하기</h2>
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
			</div>
			<div class="modal-body">
				<div class="mb-10 pt-4">
					<h3 class="con-title mb-3">결제 목록</h3>
					<table class="table">
						<colgroup>
								<col>
								<col>
								<col width="20%">
						</colgroup>
						<tbody class="tbody">
						<%
							List<UserDownloadPaymentVO> cartList = (List<UserDownloadPaymentVO>) session.getAttribute("cartList");
								int amount = 0;
								for(int i=0; i<cartList.size(); i++){
									amount += cartList.get(i).getDwnldPymPrice();
						%>
							<tr>
								<th scope="row"><%=i+1%></th>
								<td class="text-align-left">
										<span><%=cartList.get(i).getContTitle()%></span>
										<%if(cartList.get(i).getVideoSerno() != 0){%>
											<span>시즌<%=cartList.get(i).getVideoSerno()%></span>
										<%}%>
										<%if(cartList.get(i).getEpNum() != 0){%>
											<span><%=cartList.get(i).getEpNum()%>화</span>
										<%}%>
								</td>
								<td><%=cartList.get(i).getDwnldPymPrice()%>원</td>
							</tr>
						<%
						}
						%>
						</tbody>
					</table>
				</div>
				<div class="mb-10 pt-4">
					<h3 class="con-title mb-3">결제 방법 선택</h3>
					<table class="table">
						<tr>
							<td class="text-align-left"><span>카드 결제</span></td>
							<td><input type="radio" name="payMethod" value="card" checked></td>
						</tr>
						<tr>
							<td class="text-align-left"><span>카카오페이</span></td>
							<td><input type="radio" name="payMethod" value="kakaopay"></td>
						</tr>
						<tr>
							<td class="text-align-left"><span>토스간편결제 </span></td>
							<td><input type="radio" name="payMethod" value="tosspay"></td>
						</tr>
						<tr>
							<td class="text-align-left"><span>휴대폰소액결제 </span></td>
							<td><input type="radio" name="payMethod" value="phone"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-footer justify-content-end border-0 mb-4">
				<p><%=amount %>원을 결제 하시겠습니까?</p>
				<button type="button" class="btn btn-danger" id="payment">결제</button>			
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$.each($(".fmtNum"),function(){
				var val = $(this).text(); 
				$(this).text(numberFomatter(val,1));
			});
		});
		
		// 숫자 변환
		function numberFomatter(num,type){
		    var formatNum = '';
		    
		    if(num.length == 16){
		        if(type==0){
		            formatNum = num.replace(/(\d{4})(\d{4})(\d{4})(\d{4})/, '$1-$2-$3-$4');
		        }else{
		            formatNum = num.replace(/(\d{4})(\d{4})(\d{4})(\d{4})/, '$1-****-****-$4');
		        }

		    } else if(num.length==8){
		        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
		    } else {
		    	
		        if(num.indexOf('02') == 0){
		            if(type==0){
		                formatNum = num.replace(/(\d{2})(\d{3})(\d{4})/, '$1-****-$3');
		            }else{
		                formatNum = num.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
		            }
		        } else {
		            if(type==0){
		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
		            }else{
		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
		            }
		        }
		    }
		    return formatNum;
		}
		
		</script> 
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<script>
		$("#cardList").prepend($("tr[data-rCheck=Y]"));
		$("#cardList tr[data-rCheck=Y] input[name=cardSelect]").prop("checked", true);
		<%
		LoginVO user = (LoginVO) request.getAttribute("user");
		%>
		$("#payment").on('click', function(){
			
			let payMethod = $("input[name=payMethod]:checked").val();
			//아임포트 관리자계정
			IMP.init('imp22830422');   
	        
			//결제 시스템을 실행시키는 함수
	        IMP.request_pay({
		         pay_method: payMethod,
		         name: '장바구니 목록',
		         amount: '<%=amount%>',   
		         buyer_name:"<%=user.getUsers_name()%>"
	         }, function(rsp) {
	        	   let msg= "";
	               if (rsp.success) {//결제 성공시 로직
	                  msg = '결제가 완료되었습니다.';

	                  // 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
	                  // 결제내역을 사용자에게 보여주기 위해 필요함.
	                  $.ajax({
	                     url : "userDwnldPymInsert.do",
	                     type : "post",
						success : function(result) {
							if (result > 0) {
								alert(msg);
							} else {
								alert("DB입력 실패");
								return false;
							}
							location.href="list.do";
						}
					});
				} else {//결제 실패시 로직
					alert(rsp.error_msg);
				}
			});
			
		});
	      
		</script>