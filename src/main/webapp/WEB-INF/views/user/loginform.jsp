<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    console.log(email);
    var email = getCookie("email");
    console.log(email);
    $("input[name='email']").val(email); 
    if($("input[name='email']").val() != "" || $("input[name='email']").val() != 'undefined'){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#remember-me").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName){
    var cookieValue=null;
    if(document.cookie){
        var array=document.cookie.split((escape(cookieName)+'=')); 
        if(array.length >= 2){
            var arraySub=array[1].split(';');
            cookieValue=unescape(arraySub[0]);
        }
    }
    return cookieValue;
}
	
	function clickLogin(loginBtn) {
		if(loginBtn.value == "talker") {
			console.log("talker click");
			document.getElementById('userType').setAttribute('value', "talker");
		} else if(loginBtn.value == "listener") {
			console.log("listener click");
			document.getElementById('userType').setAttribute('value', "listener");
		}
		
		console.log(document.getElementById('userType').value);
		
		// 로그인 이메일 쿠키 설정
    	if($("#remember-me").is(":checked")) {
        	var email = $("#email").val();
            setCookie("email", email, 7);
            console.log("set cookie");
        } else { 	
            deleteCookie("email");
            console.log("delete cookie");
        }
		
		var loginform = document.getElementById('loginform');
		loginform.action="login";
		loginform.submit();
	}
</script>

<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				
					<div id="login-full-wrapper">
						<div id="login-box">
							<div id="login-box-holder">
								<div class="row">
									<div class="col-xs-12">
										<header id="login-header">
											<div id="login-logo">
												<img src="${pageContext.request.contextPath}/assets/img/logo.png"alt="" />
											</div>
										</header>
										<div id="login-box-inner">
											<form role="form" method="post" id="loginform">
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-user"></i></span> <input class="form-control"
														type="text" placeholder="email" name="email" id="email">
												</div>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-key"></i></span>
													<input type="password" class="form-control"
														placeholder="password" name="password">
												</div>
												<div id="remember-me-wrapper">
													<div class="row">
														<div class="col-xs-6">
															<div class="checkbox-nice">
																<input type="checkbox" id="remember-me"
																	checked="checked" /> <label for="remember-me">
																	Remember me </label>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12">
														<p class="social-text">환영합니다</p>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12 col-sm-6">
														<button
															class="btn btn-primary col-xs-12 btn-facebook"
															onclick="clickLogin(this)"
															value="talker">
															</i> TALKER로 로그인
														</button>
													</div>
													<div class="col-xs-12 col-sm-6">
														<button
															class="btn btn-primary col-xs-12 btn-twitter"
															onclick="clickLogin(this)"
															value="listener">
															</i> LISTENER로 로그인
														</button>
													</div>
													<input type="hidden" id="userType" name="userType"/>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div id="login-box-footer">
								<div class="row">
									<div class="col-xs-12">
										계정이 없으십니까 ? <a href="/kuku/user/select_join_type">
											지금 당장 가입하세요! </a>
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