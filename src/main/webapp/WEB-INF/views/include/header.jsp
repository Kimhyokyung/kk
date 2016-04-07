<%@ page contentType="text/html;charset=UTF-8" %>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>KukuMental</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap.min.css" />
	
	<!-- RTL support - for demo only -->
	<script src="${pageContext.request.contextPath}/assets/js/demo-rtl.js"></script>
	
	<!-- 
	If you need RTL support just include here RTL CSS file <link rel="stylesheet" type="text/css" href="css/libs/bootstrap-rtl.min.css" />
	And add "rtl" class to <body> element - e.g. <body class="rtl"> 
	-->
	
	<!-- libraries -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/libs/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/libs/nanoscroller.css" />

	<!-- global styles -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/compiled/theme_styles.css" />

	<!-- this page specific styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/libs/fullcalendar.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/libs/fullcalendar.print.css" type="text/css" media="print" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/compiled/calendar.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/libs/morris.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/libs/daterangepicker.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/libs/jquery-jvectormap-1.2.2.css" type="text/css" />

	<!-- Favicon -->
	<link type="image/x-icon" href="${pageContext.request.contextPath}/assets/favicon.png" rel="shortcut icon"/>
	
	<!-- google font libraries -->
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400' rel='stylesheet' type='text/css'>

	<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
	<![endif]-->
	
	<!-- global scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.nanoscroller.min.js"></script>
	
	<!-- this page specific scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/modernizr.custom.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/modalEffects.js"></script>

	<!-- theme scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pace.min.js"></script>
</head>