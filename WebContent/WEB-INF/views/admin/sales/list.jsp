<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../common/header.jsp" />

<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/comm_sub.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/salesGrid.css">

<div class="bgBox">
	<div class="concord-img-gradient"></div>
	<div class="main">
		<div class="titleWrap mb-5">
			<h2 class="pageTitle pb-3">매출 현황</h2>
		</div>
		<div class="d-flex justify-content-end mb-3">
			<select class="form-select" style="width: 9rem" name="chartCase">
				<option value="totalSales">총 매출</option>
				<option value="membershipSales">맴버쉽</option>
				<option value="dwnldSales">다운로드</option>
			</select>
		</div>
		<div class="conWrap" id="chartArea"></div>
	</div>
</div>



<link id="load-css-0" rel="stylesheet" type="text/css" href="https://www.gstatic.com/charts/51/css/core/tooltip.css">
<link id="load-css-1" rel="stylesheet" type="text/css" href="https://www.gstatic.com/charts/51/css/util/util.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://www.gstatic.com/charts/51/loader.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://www.gstatic.com/charts/51/js/jsapi_compiled_default_module.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://www.gstatic.com/charts/51/js/jsapi_compiled_graphics_module.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://www.gstatic.com/charts/51/js/jsapi_compiled_ui_module.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://www.gstatic.com/charts/51/js/jsapi_compiled_corechart_module.js"></script>
<script>
	//선택한 정보 불러오기
	getChart = function(chartCaseUrl){	
		$.ajax({
			type: "post",
			url: chartCaseUrl + ".do",
			success: function(result){
					$("#chartArea").html(result);
			},
			error: function(request, status, error) { alert("code:" + request.status + "\n" + "error:" + error); }
		});
	}
	$("select[name=chartCase]").change(function(){
		let chartCaseUrl = $(this).val();
		getChart(chartCaseUrl)
	});
	//기본 세팅
	getChart($("select[name=chartCase]").val());
</script>

<jsp:include page="../../common/footer.jsp" />
