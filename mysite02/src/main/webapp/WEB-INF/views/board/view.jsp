<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div id="content">
			<div id="board" class="board-form">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">글보기</th>
					</tr>
					<tr>
						<td class="label">제목</td>
						<td>${content.title}</td>
					</tr>
					<tr>
						<td class="label">내용</td>
						<td>
							<div class="view-content">
							 <% pageContext.setAttribute("newLine", "\n"); %>
                     			${fn:replace(content.contents,newLine,"<br/>")}
							</div>
						</td>
					</tr>
				</table>
				 <input type="hidden" value="${content.no}"><br>
				 <input type="hidden" value="${content.groupNo}"><br>
				 <input type="hidden" value="${content.orderNo}"><br>
				 <input type="hidden" value="${content.depth}"><br>
				 <input type="hidden" value="${content.userVo.no}"><br>
				<div id="board" class="board-form">
				 <table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>
					<div>
						<p1 style="text-align: center">놀랍게도 댓글임</p1>
					</div>
				
					<c:forEach items="${comments}" var="vo"  varStatus="status" >
					<tr>
						<td style="text-align: center">${status.count}</td>
						<td style="text-align: center">${vo.mem_nm}</td>
						<td style="text-align: center">${vo.comm_content}</td>
						<td style="text-align: center">${vo.comm_date}</td>
						<c:if test="${null ne authvo}">
							<c:set var="no" value="${authvo.no}"/>
							<c:if test="${vo.comm_mem_sn eq authvo.no}">
								<td><a href="${pageContext.servletContext.contextPath}/board?a=deletecomment&no=${vo.comm_sn}&bd_sn=${param.board_sn}" class="del"  style='background-image: url("${pageContext.servletContext.contextPath }/assets/images/recycle.png")'>삭제</a></td>
							</c:if>
						</c:if>
					</tr>
					</c:forEach>
				
				</table>
					<c:choose>
						<c:when test="${empty authvo}">
						
						</c:when>
						<c:otherwise>
							<form action="${pageContext.request.contextPath}/board">
							<input type="hidden" name="a" value="writecomment">
							<input type="hidden" name="no" value="${param.board_sn}">
							<input type="hidden" name="mem_sn" value="${authvo.no}">
							<input type="text" name="comment">
							<input type="submit">
							</form>
						</c:otherwise>
					</c:choose>
				 </div>
				<div class="bottom">
					<a href="${pageContext.request.contextPath}/board?a=replyform&no=${content.no}">답글달기</a>
					<a href="${pageContext.request.contextPath}/board">글목록</a>
					<a href="${pageContext.request.contextPath}/board?a=modifyform&no=${content.no}">글수정</a>
				</div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>