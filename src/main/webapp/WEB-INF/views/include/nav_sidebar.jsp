<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.bit.kuku.vo.UserVo"%>
<%
	UserVo authUser = (UserVo) session.getAttribute("authUser");
%>

<div id="nav-col">
	<section id="col-left" class="col-left-nano">
		<div class="collapse navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
				
			<ul class="nav nav-pills nav-stacked">
			<c:choose>
				<c:when test="${empty authUser }">	
					<li><a href="/kuku/user/loginform"> <span>로그인</span> </a> </li>
					<li><a href="/kuku/user/select_join_type"> <span>회원가입</span> </a> </li>					
				</c:when>
				<c:otherwise>
					<li><a href="logout"> <span>로그아웃</span> </a> </li>
					<li><a href="/kuku/user/update_user"> <span>회원정보수정</span> </a> </li>
					<li>${authUser.email }님 안녕하세요 ^^;</li>
				</c:otherwise>
		    </c:choose>
			</ul>
		</div>
	</section>
</div>