<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>kukuMental</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/kuku/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/kuku/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function(){
	$("#email").change( function(){
		 $("#button-checkemail").show();
// 		 $("#image-checkemail").hide();		
	});
	
	$( "#button-id" ).click( function(){
		var email = $("#email").val();
		if( email == "" ) {
			return;
		} 
		
		$.ajax( {
		   url : "/kuku/user/checkemail?email=" + email,
		   type: "get",
		   dataType: "json",
		   data: "",
	  //  contentType: "application/json",
  	       success: function( response ){
			 console.log( response );
			 if(response.data == true) {
				 $("#email").val( "" );
				 alert( "이미 존재하는 아이디입니다. 다른 아이디를 사용해 주세요."  );
				 $("#email").focus();
				 return;
			 }
			                                                       
			 // 사용 가능한 경우
			 $("#button-checkemail").hide();
// 			 $("#image-checkemail").show();
	       },
		   error: function( jqXHR, status, error ){
			  console.error( status + " : " + error );
		   }
	   });
	});
});
</script>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div id="content-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div id="login-box">
									<div class="row">
										<div class="col-xs-12">
											<header id="login-header">
												<div id="login-logo">
													<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" />
												</div>
											</header>
											<div id="login-box-inner">
											<form id="join-form" name="joinForm" method="post" action="join1">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-user"></i></span>
														<input class="form-control" type="text" placeholder="ID ( Email )" name="email">
													</div>
													
													<div id="remember-me-wrapper" class="row" >
													<div class="col-xs-12" >
														<input class="btn btn-success col-xs-12" id="button-checkemail" type="button" value="중복 확인 ">
<!-- 														<img src="/kukuMental/assets/images/check.png" id="image-checkemail" style="display:none; width:16px"> -->
													</div></div>			
													
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
														<input class="form-control"	type="password" placeholder="PassWord" name ="password">
													</div>
													
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-unlock-alt"></i></span>
														<input type="text" class="form-control" placeholder="NickName" name="nickname">
													</div>
													
													<div id="remember-me-wrapper"><div class="row">
															<div class="col-xs-12">
																<div class="checkbox-nice">
																	<input type="checkbox" id="terms-cond"	checked="checked" />
																	<label for="terms-cond"> I accept terms and conditions </label>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<button type="submit" class="btn btn-success col-xs-12">Register</button>
														</div>
													</div>
												</form>
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