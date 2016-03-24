<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Centaurus - Bootstrap Admin Template</title>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap.min.css" />

<!-- RTL support - for demo only -->
<script src="js/demo-rtl.js"></script>
<!-- 
	If you need RTL support just include here RTL CSS file <link rel="stylesheet" type="text/css" href="css/libs/bootstrap-rtl.min.css" />
	And add "rtl" class to <body> element - e.g. <body class="rtl"> 
	-->
<!-- libraries -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/libs/nanoscroller.css" />

<!-- global styles -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/compiled/theme_styles.css" />

<!-- this page specific styles -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/compiled/wizard.css">

<!-- Favicon -->
<link type="image/x-icon" href="favicon.png" rel="shortcut icon" />

<!-- google font libraries -->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div class="container">
					<div id="content-wrapper">
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-12">
										<div class="main-box no-header clearfix">
											<div class="main-box-body clearfix">
												<div class="table-responsive">
													<table class="table user-list table-hover">
														<thead>
															<tr>
																<th><span>User</span></th>
																<th class="text-center"><span>Status</span></th>
																<th>&nbsp;</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><img src="img/samples/george.png" alt="" /> <a
																	href="#" class="user-link">Talker one</a> <span
																	class="user-subhead">Talker</span></td>
																<td class="text-center"><span
																	class="label label-success">Login</span></td>
																<td style="width: 20%;"><a href="#"
																	class="table-link"> <span class="fa-stack">
																			<i class="fa fa-wechat"></i>
																	</span>
																</a></td>
															</tr>
															<tr>
																<td><img src="img/samples/ryan.png" alt="" /> <a
																	href="#" class="user-link">Talker two</a> <span
																	class="user-subhead">Talker</span></td>
																<td class="text-center"><span
																	class="label label-danger">Logout</span></td>
																<td style="width: 20%;"><a href="#"
																	class="table-link"> <span class="text-muted">
																			<i class="fa fa-wechat"></i>
																	</span>
																</a></td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
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
