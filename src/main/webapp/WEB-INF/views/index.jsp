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
		</div>
	</body>
</html>