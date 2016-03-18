<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<body>
		<div id="theme-wrapper">
			<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
			<div id="page-wrapper" class="container">
			
				<div class="row">
					<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
					<div id="content-wrapper">
					</div>
				</div>
			</div>
		<div class="btn-group">
			<button type="button" class="btn btn-danger dropdown-toggle"
				data-toggle="dropdown">
				상담주제 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			</ul>
		</div>
	</div>
	</body>
</html>