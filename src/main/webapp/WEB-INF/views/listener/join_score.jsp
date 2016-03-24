<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
</head>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div id="content-wrapper">
					<div id="login-full-wrapper">
						<div class="container">
							<div class="row">
								<div class="col-xs-12">
									<div style="width: 510px; height: 420px; margin-left: 550; margin-top: 70;">
										<div id="login-box2">
											<div class="row">
												<div class="col-md-12">
													<header id="login-header">
														<div id="login-logo">
															<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" />
														</div>
													</header>
													<div id="login-box-inner">
													<h2>평가 수 : </h2>
													<h3></h3>
														
														<div class="profile-stars">
															<h2>도움성
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															</h2>
														</div>
														
														<div class="profile-stars">
															<h2>공감성
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															</h2>
														</div>
														<div class="profile-stars">
															<h2>응답 수준
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															</h2>
														</div>
														<h3></h3>
														
														<div class="profile-stars">
															<h2>총점
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															</h2>
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

	<!-- global scripts -->
	<script src="js/demo-skin-changer.js"></script>
	<!-- only for demo -->

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.nanoscroller.min.js"></script>

	<script src="js/demo.js"></script>
	<!-- only for demo -->

	<!-- this page specific scripts -->
	<script src="js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>

	<!-- theme scripts -->
	<script src="js/scripts.js"></script>
	<script src="js/pace.min.js"></script>

	<!-- this page specific inline scripts -->
	<script type="text/javascript">
		// When the window has finished loading create our google map below
		google.maps.event.addDomListener(window, 'load', init);

		function init() {
			var latlng = new google.maps.LatLng(40.763986, -73.958674);

			//APPLE MAP
			var mapOptionsApple = {
				zoom : 12,
				scrollwheel : false,
				center : latlng,

				// How you would like to style the map. 
				// This is where you would paste any style found on Snazzy Maps.
				styles : [ {
					"featureType" : "water",
					"elementType" : "geometry",
					"stylers" : [ {
						"color" : "#a2daf2"
					} ]
				}, {
					"featureType" : "landscape.man_made",
					"elementType" : "geometry",
					"stylers" : [ {
						"color" : "#f7f1df"
					} ]
				}, {
					"featureType" : "landscape.natural",
					"elementType" : "geometry",
					"stylers" : [ {
						"color" : "#d0e3b4"
					} ]
				}, {
					"featureType" : "landscape.natural.terrain",
					"elementType" : "geometry",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "poi.park",
					"elementType" : "geometry",
					"stylers" : [ {
						"color" : "#bde6ab"
					} ]
				}, {
					"featureType" : "poi",
					"elementType" : "labels",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "poi.medical",
					"elementType" : "geometry",
					"stylers" : [ {
						"color" : "#fbd3da"
					} ]
				}, {
					"featureType" : "poi.business",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "road",
					"elementType" : "geometry.stroke",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "road",
					"elementType" : "labels",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "road.highway",
					"elementType" : "geometry.fill",
					"stylers" : [ {
						"color" : "#ffe15f"
					} ]
				}, {
					"featureType" : "road.highway",
					"elementType" : "geometry.stroke",
					"stylers" : [ {
						"color" : "#efd151"
					} ]
				}, {
					"featureType" : "road.arterial",
					"elementType" : "geometry.fill",
					"stylers" : [ {
						"color" : "#ffffff"
					} ]
				}, {
					"featureType" : "road.local",
					"elementType" : "geometry.fill",
					"stylers" : [ {
						"color" : "black"
					} ]
				}, {
					"featureType" : "transit.station.airport",
					"elementType" : "geometry.fill",
					"stylers" : [ {
						"color" : "#cfb2db"
					} ]
				} ]
			};

			var mapElementApple = document.getElementById('map-apple');

			// Create the Google Map using out element and options defined above
			var mapApple = new google.maps.Map(mapElementApple, mapOptionsApple);

			var markerApple = new google.maps.Marker({
				position : latlng,
				map : mapApple
			});
		}

		$(document).ready(function() {
			$('.conversation-inner').slimScroll({
				height : '340px'
			});
		});

		$(function() {
			$(document).ready(function() {
				$('#newsfeed .story-images').magnificPopup({
					type : 'image',
					delegate : 'a',
					gallery : {
						enabled : true
					}
				});
			});
		});
	</script>
</body>
</html>