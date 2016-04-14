<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#bar').hide();

		$('#bar').on('click', function() {
			$('#pie').show();
			$('#bar').hide();
		})
		$('#pie').on('click', function() {
			document.getElementById("bar").innerHTML = "bar graph 변경";
			$('#bar').show();
			$('#pie').hide();
		})
		var now = new Date();
		var month = (now.getMonth() + 1);
		var day = now.getDate();
		if (month < 10)
			month = "0" + month;
		if (day < 10)
			day = "0" + day;
		var today = now.getFullYear() + '-' + month + '-' + day;
		$('#datePicker').val(today);

		var kukuday = $('#datePicker').val();

		//click_graph();

	});

	function click_graph(button) {
		var kukuday = $('#datePicker').val();
		var fileName;
		if (button == null) {
			fileName = '${sessionScope.authUser.email}' + kukuday + 'bar_graph';
		} else {
			fileName = '${sessionScope.authUser.email}' + kukuday
					+ button.value + '_graph';
		}

		// 현재 채팅방 로그 정보 가져오기
		$.ajax({
					beforeSend : function() {
						var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/img/loading.gif>';
						var graphDiv = document.getElementById("kukugraph");
						graphDiv.innerHTML = html;
					},
					/* complete: function(){
						$("#loading-excel").remove();
					}, */
					error : function() {
						alert("이 날의 데이터가 없습니다!");
						var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/img/empty_data.png>';
						var graphDiv = document.getElementById("kukugraph");
						graphDiv.innerHTML = html;
					},
					url : "saveEmotionImage?fileName=" + fileName,
					type : "get",
					dataType : "json",
					data : "",
					success : function(response) {
						var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/graph_image/' + fileName + '.png>';
						var graphDiv = document.getElementById("kukugraph");
						graphDiv.innerHTML = html;
					}
				});

		/* var html2 = '<img src=" '+ '${pageContext.request.contextPath}'+'/assets/graph_image/' + fileName + '.png"  onerror="this.src=\''+'${pageContext.request.contextPath}'+'/assets/img/loading.gif\'" >';
		console.log(html2);
		console.log(fileName);
		var graphDiv = document.getElementById("kukugraph");
		graphDiv.innerHTML = html2; */

	}
</script>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body id="login-page">
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<div class="row" id="user-profile">
					<div class="main-box clearfix">
						<div>
							<div>
								<div align="center">
									<div class="btn-group pagination" style="padding: 10px">
										<input type="date" id="datePicker" style="text-align: center">
									</div>

									<div class="btn-group pagination" style="padding: 10px">
										<button class="btn btn-outline btn-primary btn-xs"
											onclick="click_graph(this)" value="bar" id="bar">bar
											graph 변경</button>

										<button class="btn btn-outline btn-primary btn-xs"
											onclick="click_graph(this)" value="pie" id="pie">pie
											graph 변경</button>
									</div>
								</div>
							</div>

							<div align="center" style="height: 80%">
								<div id="kukugraph"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>