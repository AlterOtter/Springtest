<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="user">
				<form id="login-form" name="loginform" method="post" action="${pageContext.request.contextPath}/user/auth">
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="${empty email?'':email}">
					<label class="block-label" >패스워드</label>
					<input name="password" type="password" value="${empty password?'':password}">
					<p>
						<c:set var="str" value="fail" />
						<c:if test="${result eq str}">
							로그인에 실패하셨습니다.
						</c:if>
					</p>
					<input type="submit" value="로그인">
				</form>
			</div>
		</div>
    	<c:import url="/WEB-INF/views/include/nav.jsp"/>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>