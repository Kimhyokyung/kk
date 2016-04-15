<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<script type="text/javascript">
	//회원가입 성공 처리
	function selectChkBox(button) {
		var joinform = document.getElementById('join-form');
		
		if (joinform.stress_degree.value == "") {
			alert("스트레스 정도를 선택해주세요.")
			joinform.stress_degree.focus()
			return;
		} else {
			var userType = "${sessionScope.userType}";
			console.log(userType);
				alert("ㅊㅋㅊㅋ회원 가입 되었습니다!");
				joinform.action = "join_success";
				joinform.submit();
		}
	}
</script>
<html>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<div id="login-full-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div id="login-box2">
									<div class="row">
										<div class="col-md-12">
											<header id="login-header">
												<div id="login-logo">
													<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" />
												</div>
											</header>
											<div id="login-box-inner">
												<form id="join-form" name="joinForm" method="post">
													<h1 align="center">스트레스 정도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
													<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3> 
													<input type="radio" name="stress_degree" value="1">&nbsp; 1 &nbsp; 
													<input type="radio" name="stress_degree" value="2">&nbsp; 2 &nbsp; 
													<input type="radio" name="stress_degree" value="3">&nbsp; 3 &nbsp; 
													<input type="radio" name="stress_degree" value="4">&nbsp; 4 &nbsp; 
													<input type="radio" name="stress_degree" value="5">&nbsp; 5 &nbsp; 
													<input type="radio" name="stress_degree" value="6">&nbsp; 6 &nbsp; 
													<input type="radio" name="stress_degree" value="7">&nbsp; 7 &nbsp; 
													<input type="radio" name="stress_degree" value="8">&nbsp; 8 &nbsp; 
													<input type="radio" name="stress_degree" value="9">&nbsp; 9 &nbsp; 
													<input type="radio" name="stress_degree" value="10">&nbsp; 10 &nbsp;
													<div style="width: 340px; height: 80px; margin: auto">
														<br/>
														<button type="submit" class="btn btn-primary col-xs-12 btn-facebook" onClick="selectChkBox(this)">회원가입완료</button>
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