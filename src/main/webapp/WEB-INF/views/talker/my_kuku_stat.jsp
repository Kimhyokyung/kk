<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<script type="text/javascript">
	$(document).ready(function() {
		$('#bar').hide();

		$('#bar').on('click', function() {
			$('#pie').show();
			$('#bar').hide();
		})
		
		$('#pie').on('click', function() {
			$('#bar').show();
			$('#pie').hide();
		})
		
		// 오늘 날짜 정보 가져오기
		var now = new Date();
		var month = (now.getMonth() + 1);
		var day = now.getDate();
		if (month < 10)
			month = "0" + month;
		if (day < 10)
			day = "0" + day;
		var today = now.getFullYear() + '-' + month + '-' + day;
		$('#datePicker').val(today);
		
		click_graph(null);
	});

	function click_graph(button) {
		var kukuday = $('#datePicker').val();
		var fileName;
		if (button == null) {
			fileName = '${sessionScope.authUser.email}' + kukuday + 'bar_graph';
		} else {
			fileName = '${sessionScope.authUser.email}' + kukuday + button.value + '_graph';
		}

		console.log(fileName);
		
		// 감정그래프 불러오기
		$.ajax({
			beforeSend : function() {
				var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/img/loading.gif>';
				var graphDiv = document.getElementById("kukugraph");
				graphDiv.innerHTML = html;
			},
			error : function() {
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
	}
</script>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<html>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<div class="row" id="user-profile">
					<div>
						<div align="center" style="margin:60px">
							<div class="btn-group pagination" style="padding: 10px">
								<input type="date" id="datePicker" style="text-align: center">
							</div>
							<div class="btn-group pagination" style="padding: 10px">
								<button class="btn btn-outline btn-primary btn-xs" onclick="click_graph(this)" value="bar" id="bar">막대그래프 결과보기</button>
								<button class="btn btn-outline btn-primary btn-xs" onclick="click_graph(this)" value="pie" id="pie">원그래프 결과보기</button>
							</div>
						</div>
						<div align="center">
							<div id="kukugraph"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>