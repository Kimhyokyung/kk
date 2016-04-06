<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(document).ready( function() {
    var now = new Date();
    var month = (now.getMonth() + 1);               
    var day = now.getDate();
    if(month < 10) 
        month = "0" + month;
    if(day < 10) 
        day = "0" + day;
    var today = now.getFullYear() + '-' + month + '-' + day;
    $('#datePicker').val(today);
});
</script>​
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body id="login-page">
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div id="content-wrapper">
					<div class="row" id="user-profile">
						<div class="main-box clearfix">

							<div>
								<div class="btn-group pagination pull-left" style="padding:10px">
									<input type="date" id="datePicker">
								</div>

								<div class="btn-group pagination pull-right" style="padding:10px">
									<button class="btn btn-outline btn-primary btn-xs">
										bar grape</button>
									<button class="btn btn-outline btn-primary btn-xs">
										pie graph</button>
									<button class="btn btn-outline btn-primary btn-xs">
										line graph</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<img
										src="${pageContext.request.contextPath}/assets/img/error-404.png"
										alt="" class="profile-img img-responsive center-block">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>