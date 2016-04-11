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

<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
	<![endif]-->
d
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	function Rradio_OnOff(id) {
		document.getElementById('next').disabled = false;
		if (id == "Rradio_On") {
			alert("정답입니다. 다음 화면(Next)을 선택해주세요.");
			document.getElementById('next').disabled = false;
		} else {
			alert("정답이 아닙니다. 다시 선택해주세요");
			document.getElementById('next').disabled = true;
		}
	}

	// function
</script>
</head>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<form id="join_listener" name="join_listener" method="POST"
					action="join_success2">
					<div id="myWizard" class="wizard">
						<div class="wizard-inner">
							<ul class="steps">
								<li data-target="#step1" class="active"><span
									class="badge badge-primary">1</span>Step 1<span class="chevron"></span></li>
								<li data-target="#step2"><span class="badge badge-primary">2</span>Step
									2<span class="chevron"></span></li>
								<li data-target="#step3"><span class="badge">3</span>Step 3<span
									class="chevron"></span></li>
								<li data-target="#step4"><span class="badge">4</span>Step 4<span
									class="chevron"></span></li>
								<li data-target="#step5"><span class="badge">5</span>Step 5<span
									class="chevron"></span></li>
								<li data-target="#step6"><span class="badge">6</span>Step 6<span
									class="chevron"></span></li>
								<li data-target="#step7"><span class="badge">7</span>Step 7<span
									class="chevron"></span></li>
							</ul>
							<!---------------- 버튼------------------------------------------------------------------------------------------------------------------->
							<div class="actions">
								<button type="button" class="btn btn-success btn-mini btn-next"
									name="next" id="next" data-last="Finish" disabled="disabled">
									Next<i class="icon-arrow-right"></i>
								</button>
							</div>
						</div>
						<!------------------------------------------------------------------------------------------------------------------------------------->
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
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
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
														id="optionsRadios1_3" Onclick="Rradio_OnOff('Rradio_On');"
														value="option3"> <label for="optionsRadios1_3">스피커에게
														당신이 경청하고 있고, 더 많은 이야기를 끌어내려고 한다는 것을 보여주기 위해 </label>
												</div>
											</div>
										</div>
										<!------------------------------------------------------------------------------------------------------------------------------------->
										<div class="step-pane" id="step2">
											<br />
											<div class="alert alert-success fade in"
												style="margin: 100px 0;">
												<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz2.
													한이는 몇 달 동안 구직활동에 실패하고 사기가 저하된 택이의 이야기를 듣고 있다. 한이가 택이의 말을
													공감하고 있음을 표현하기 위해 가장 적절한 말은? </strong><br /> <br />

												<div class="radio">
													<input type="radio" name="optionsRadios2"
														id="optionsRadios2_1" value="option1"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios2_1">"나는 당신이 언젠가는 직업을 찾을 것이라고
														생각한다."</label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios2"
														id="optionsRadios2_2" value="option2"
														Onclick="Rradio_OnOff('Rradio_On');"> <label
														for="optionsRadios2_2">"만약 내가 한동안 직장을 찾지 못하고 미래가
														불확실하다고 느낀다면 무섭고 좌절할 것이다"</label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios2"
														id="optionsRadios2_3" value="option3"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios2_3">"내가 직장을 갖지 않았을 때도 이렇게까지 화나지
														않았다."</label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios2"
														id="optionsRadios2_4" value="option4"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios2_4">위의 모든 답.</label>
												</div>
											</div>
										</div>
										<!------------------------------------------------------------------------------------------------------------------------------------->
										<div class="step-pane" id="step3">
											<br />
											<div class="alert alert-success fade in"
												style="margin: 100px 0;">
												<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz3.
													다음 중 경청방법이 아닌 것은?</strong><br /> <br />

												<div class="radio">
													<input type="radio" name="optionsRadios3"
														id="optionsRadios3_1" value="option1"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios3_1">중요한 이야기를 기억하고, 다음의 대화에서 그것에
														대해 묻는다. </label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios3"
														id="optionsRadios3_2" value="option2"
														Onclick="Rradio_OnOff('Rradio_On');"> <label
														for="optionsRadios3_2">상담자의 선택에 대해 개인적인 판단을 하거나
														견해를 제공한다. </label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios3"
														id="optionsRadios3_3" value="option3"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios3_3">상담자가 슬픈 상황에 대해 이야기할 때, 연민을
														가지고 반응한다. </label>
												</div>
											</div>
										</div>
										<!------------------------------------------------------------------------------------------------------------------------------------->
										<div class="step-pane" id="step4">
											<br />
											<div class="alert alert-success fade in"
												style="margin: 100px 0;">
												<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz4.
													다음 중 kuku를 이용할 때 적절하지 않은 행동은?</strong><br /> <br />

												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios4_1" value="option1"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios4_1">당신이 다른 상담자들과 이야기한 것을 말하지
														않도록 조심한다.</label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios4_2" value="option2"
														Onclick="Rradio_OnOff('Rradio_On');"> <label
														for="optionsRadios4_2">당신이 상담자들과 이야기한 것을 기록한다.</label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios4_3" value="option3"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios4_3">다른 리스너와 상담할 때 개인 정보를 발설하지
														않는다.</label>
												</div>
											</div>
										</div>
										<!------------------------------------------------------------------------------------------------------------------------------------->
										<div class="step-pane" id="step5">
											<br />
											<div class="alert alert-success fade in"
												style="margin: 100px 0;">
												<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz5.
													영희는 리스너 경이와 그녀의 가족 문제에 대해 이야기하고 있다. 그들이 말할 때, 영희는 그녀의 양아버지가
													최근에 그녀를 성적으로 강간했다고 밝혔다. 경이는 어떻게 반응해야하나?</strong><br /> <br />

												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios5_1" value="option1"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios5_1">경이는 영희에게 반드시 그녀의 어머니에게 이
														상황을 말하도록 말해야한다.</label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios5_2" value="option2"
														Onclick="Rradio_OnOff('Rradio_On');"> <label
														for="optionsRadios5_2">경이는 영희의 이야기를 듣고 반드시
														한국성폭력상담소(www.sisters.or.kr)에 알린다. </label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios5_3" value="option3"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios5_3">경이는 영희의 이야기를 더 듣고 그녀의 기분이
														나아질 수 있도록 돕는다.</label>
												</div>
											</div>
										</div>
										<!------------------------------------------------------------------------------------------------------------------------------------->
										<div class="step-pane" id="step6">
											<br />
											<div class="alert alert-success fade in"
												style="margin: 100px 0;">
												<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz6.
													휴는 은이를 그녀의 메인리스너로 부른다. 휴는 그녀의 여자친구와 깨진 이후로 극도로 스트레스 받고 있는데,
													그녀의 삶이 얼마나 가치없는지에 대해 이야기한다. <br />그녀는 그녀가 슬플 때 어떻게 자해해왔는가에
													대해 묘사한다. 은이는 어떻게 반응해야하나?
												</strong><br /> <br />

												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios6_1" value="option1"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios6_1">은이는 휴와 그의 이별에 대해 이야기하고, 그에게
														헤어짐을 극복하는 방법에 대해 조언한다. </label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios6_2" value="option2"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios6_2">은이는 그녀가 더 이상 이야기를 나눌 수 없다고
														말해야 한다. </label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios6_3" value="option3"
														Onclick="Rradio_OnOff('Rradio_On');"> <label
														for="optionsRadios6_3">은이는 그에게 보다 전문적인 상담을 권하고 생명의
														전화를 추천해준다. </label>
												</div>
											</div>
										</div>
										<!------------------------------------------------------------------------------------------------------------------------------------->
										<div class="step-pane" id="step7">
											<br />
											<div class="alert alert-success fade in"
												style="margin: 100px 0;">
												<i class="fa fa-info-circle fa-fw fa-lg"></i> <strong>Quiz7.
													당신이 부적절한 채팅을 하게 되었을 때, 어떻게 해야 하는가? </strong><br /> <br />

												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios7_1" value="option1"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios7_1">그 사람이 진짜로 도움을 원하는 것인지 깨달을
														때까지 따뜻하고 조심스러운 매너의 채팅을 진행한다. </label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios7_2" value="option2"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios7_2">Kuku에 report한다.</label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios7_3" value="option3"
														Onclick="Rradio_OnOff('Rradio_Off');"> <label
														for="optionsRadios7_3">모욕적이고 성적으로 대하는 것이 절대 괜찮지
														않다는 것을 경고한다. </label>
												</div>
												<div class="radio">
													<input type="radio" name="optionsRadios"
														id="optionsRadios7_4" value="option4"
														Onclick="Rradio_OnOff('Rradio_On');"> <label
														for="optionsRadios7_4">위의 모든 답.</label>
												</div>
											</div>
										</div>
										<!------------------------------------------------------------------------------------------------------------------------------------->
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
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