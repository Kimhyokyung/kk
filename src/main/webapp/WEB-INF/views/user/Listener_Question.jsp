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
<!-- If you need RTL support just include here RTL CSS file <link rel="stylesheet" type="text/css" href="css/libs/bootstrap-rtl.min.css" />
	And add "rtl" class to <body> element - e.g. <body class="rtl"> 	-->
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

<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/demo-rtl.js"></script>
<script type="text/javascript">
	$(function Rradio_OnOff(id) {
		alert("r라디오");
		if (id == "optionsRadios1_1") {
			alert("정답");
			return;
		} else {
			alert("아니다");
			return;
		}
	});
</script>
</head>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div id="content-wrapper">
					<div id="login-full-wrapper">
						<div id="myWizard" class="wizard">
							<div class="wizard-inner">
								<ul class="steps">
									<li data-target="#step1" class="active"><span
										class="badge badge-primary">1</span>Step 1<span
										class="chevron"></span></li>
									<li data-target="#step2"><span class="badge badge-primary">2</span>Step
										2<span class="chevron"></span></li>
									<li data-target="#step3"><span class="badge">3</span>Step
										3<span class="chevron"></span></li>
									<li data-target="#step4"><span class="badge">4</span>Step
										4<span class="chevron"></span></li>
									<li data-target="#step5"><span class="badge">5</span>Step
										5<span class="chevron"></span></li>
									<li data-target="#step6"><span class="badge">6</span>Step
										6<span class="chevron"></span></li>
									<li data-target="#step7"><span class="badge">7</span>Step
										7<span class="chevron"></span></li>
									<li data-target="#step8"><span class="badge">8</span>Step
										8<span class="chevron"></span></li>
									<li data-target="#step9"><span class="badge">9</span>Step
										9<span class="chevron"></span></li>
									<li data-target="#step10"><span class="badge">10</span>Step
										10<span class="chevron"></span></li>
									<li data-target="#step11"><span class="badge">11</span>Step
										11<span class="chevron"></span></li>
								</ul>

								<!-- 버튼 -->
								<div class="actions">
									<button type="button" class="btn btn-default btn-mini btn-prev">
										<i class="icon-arrow-left"></i>Prev
									</button>
									<button type="button" class="btn btn-success btn-mini btn-next"
										data-last="Finish">
										Next<i class="icon-arrow-right"></i>
									</button>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="main-box clearfix" style="min-height: 820px;">
										<div class="step-content">

											<div class="step-pane active" id="step1">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz1.
														상담자의 말에 공감해야 하는 이유는?</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios1"
															id="optionsRadios1_1" value="option1"
															Onclick="Rradio_OnOff('Rradio_On');"> <label
															for="optionsRadios1_1">상담자의 이야기를 단어단위로 반복하기 위해 </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios1"
															id="optionsRadios1_2"
															Onclick="Rradio_OnOff('Rradio_Off');" value="option2">
														<label for="optionsRadios1_2">상담자의 이야기 중 실수를 잡아내기
															위해 </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios1"
															id="optionsRadios1_3" value="option3"> <label
															for="optionsRadios1_3">스피커에게 당신이 경청하고 있고, 더 많은
															이야기를 끌어내려고 한다는 것을 보여주기 위해 </label>
													</div>
												</div>
											</div>

											<div class="step-pane" id="step2">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz2.
														한이는 몇 달 동안 구직활동에 실패하고 사기가 저하된 택이의 이야기를 듣고 있다. 한이가 택이의 말을
														공감하고 있음을 표현하기 위해 가장 적절한 말은? </strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios2"
															id="optionsRadios2_1" value="option1" checked> <label
															for="optionsRadios2_1">"나는 당신이 언젠가는 직업을 찾을 것이라고
															생각한다."</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios2"
															id="optionsRadios2_2" value="option2"> <label
															for="optionsRadios2_2">"만약 내가 한동안 직장을 찾지 못하고 미래가
															불확실하다고 느낀다면 무섭고 좌절할 것이다"</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios2"
															id="optionsRadios2_3" value="option3"> <label
															for="optionsRadios2_3">"내가 직장을 갖지 않았을 때도 이렇게까지
															화나지 않았다."</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios2"
															id="optionsRadios2_4" value="option4"> <label
															for="optionsRadios2_4">위의 모든 답.</label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step3">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz3.
														다음 중 경청방법이 아닌 것은?</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios3"
															id="optionsRadios3_1" value="option1" checked> <label
															for="optionsRadios3_1">중요한 이야기를 기억하고, 다음의 대화에서
															그것에 대해 묻는다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios3"
															id="optionsRadios3_2" value="option2"> <label
															for="optionsRadios3_2">상담자의 선택에 대해 개인적인 판단을 하거나
															견해를 제공한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios3"
															id="optionsRadios3_3" value="option3"> <label
															for="optionsRadios3_3">상담자가 슬픈 상황에 대해 이야기할 때, 연민을
															가지고 반응한다. </label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step4">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz4.
														상담자의 정보가 충분하지 않은 경우 당신은 어떻게 할 것인가?</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">내용을 분명히 하기 위한 질문을 한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">상담자에게 이야기가 명확히 말하지 않는 다는 것을
															말하고, 그들이 모호하지 않게 말하도록 한다.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">대화를 계속 진행하면서 그들이 무슨 말을 하는
															것인지 스스로 알아내려고 노력한다. </label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step5">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz5.
														다음 중 kuku를 이용할 때 적절하지 않은 행동은?</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">당신이 다른 상담자들과 이야기한 것을 말하지 않도록
															조심한다.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">당신이 상담자들과 이야기한 것을 기록한다.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">다른 리스너와 상담할 때 개인 정보를 발설하지
															않는다.</label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step6">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz6.
														영희는 리스너 경이와 그녀의 가족 문제에 대해 이야기하고 있다. 그들이 말할 때, 영희는 그녀의
														양아버지가 최근에 그녀를 성적으로 강간했다고 밝혔다. 경이는 어떻게 반응해야하나?</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">경이는 영희에게 반드시 그녀의 어머니에게 이 상황을
															말하도록 말해야한다.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">경이는 영희의 이야기를 듣고 반드시
															한국성폭력상담소(www.sisters.or.kr)에 알린다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">경이는 영희의 이야기를 더 듣고 그녀의 기분이
															나아질 수 있도록 돕는다.</label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step7">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz7.
														휴는 은이를 그녀의 메인리스너로 부른다. 휴는 그녀의 여자친구와 깨진 이후로 극도로 스트레스 받고
														있는데, 그녀의 삶이 얼마나 가치없는지에 대해 이야기한다. <br />그녀는 그녀가 슬플 때 어떻게
														자해해왔는가에 대해 묘사한다. 은이는 어떻게 반응해야하나?
													</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">은이는 휴와 그의 이별에 대해 이야기하고, 그에게
															헤어짐을 극복하는 방법에 대해 조언한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">은이는 그녀가 더 이상 이야기를 나눌 수 없다고
															말해야 한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">은이는 그에게 보다 전문적인 상담을 권하고 생명의
															전화를 추천해준다. </label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step8">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz8.
														당신이 부적절한 채팅을 하게 되었을 때, 어떻게 해야 하는가? </strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">그 사람이 진짜로 도움을 원하는 것인지 깨달을
															때까지 따뜻하고 조심스러운 매너의 채팅을 진행한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">Kuku에 report한다.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">모욕적이고 성적으로 대하는 것이 절대 괜찮지 않다는
															것을 경고한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios4" value="option4"> <label
															for="optionsRadios4">위의 모든 답.</label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step9">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz9.
														리스너로서 관리해야하는 것은?</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">당신이 가진 모든 미해결의 이슈에 대한 대화를
															피한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">이 이슈에 대해 다른 리스너의 도움을 원하는 사람을
															알린다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">짜증을 줄이기 위한 명상을 한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios4" value="option4"> <label
															for="optionsRadios4">동료 리스너와 이야기한다.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios5" value="option5"> <label
															for="optionsRadios5">위에 모든 답. </label>
													</div>

												</div>
											</div>
											<div class="step-pane" id="step10">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz10.
														사이버 범죄자의 사인이 될 수 있는 것은?</strong><br /> <br />
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">당신이 어디 살고 어느 학교/직장에 다니는지 물음.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">당신의 가족을 해치겠다고 협박함.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">당신이 스카이프 해주기 전까지 자신을 자해하겠다고
															말함.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios4" value="option4"> <label
															for="optionsRadios4">위의 모든 답.</label>
													</div>
												</div>
											</div>
											<div class="step-pane" id="step11">
												<br />
												<div class="alert alert-success fade in"
													style="margin: 100px 0;">
													<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz11.
														유저 X가 당신을 괴롭혀왔고 당신은 그들을 차단하려 해왔지만 그들은 다수의 계정을 가지고 있다. 당신은
														어떻게 해야하나?</strong><br /> <br />

													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios1" value="option1" checked> <label
															for="optionsRadios1">당신의 계정을 비활성화한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios2" value="option2"> <label
															for="optionsRadios2">kuku에 연락한다. </label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios3" value="option3"> <label
															for="optionsRadios3">그들을 모욕한다.</label>
													</div>
													<div class="radio">
														<input type="radio" name="optionsRadios"
															id="optionsRadios4" value="option4"> <label
															for="optionsRadios4">그들에게 멈춰달라고 정중히 물어본다.</label>
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


	<!-- global scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/demo-skin-changer.js"></script>
	<!-- only for demo -->

	<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.nanoscroller.min.js"></script>

	<script src="${pageContext.request.contextPath}/assets/js/demo.js"></script>
	<!-- only for demo -->

	<!-- this page specific scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/wizard.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.maskedinput.min.js"></script>

	<!-- theme scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pace.min.js"></script>

	<!-- this page specific inline scripts -->
	<script>
		$(function() {
			$('#myWizard').wizard();

			//masked inputs
			$("#maskedDate").mask("99/99/9999");
			$("#maskedPhone").mask("(999) 999-9999");
			$("#maskedPhoneExt").mask("(999) 999-9999? x99999");
		});
	</script>

</body>
</html>