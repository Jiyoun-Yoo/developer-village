<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 조회</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href='../style.css'>

</head>

<body>

	<jsp:include page="/header.jsp"></jsp:include>

	<h1>
		<c:choose>
			<c:when test="${article.categoryNo == 1}">
				<p>커뮤니티</p>
			</c:when>
			<c:when test="${article.categoryNo == 2}">
				<p>QnA</p>
			</c:when>
			<c:when test="${article.categoryNo == 3}">
				<p>채용공고</p>
			</c:when>
			<c:otherwise>
				<p>스터디</p>
			</c:otherwise>
		</c:choose>
	</h1>

	<form action='update' method='post'>
		<input type='hidden' name='no' value='${article.no}'><br>

		<ul id='tags'>
			<c:forEach items="${tags}" var="tag">
				<li id='color' style="background-color: #${tag.tagColor}">${tag.name}</li>
			</c:forEach>
		</ul>


		<input type='text' name='title'
			value='${article.title}' size='50'><br>

		<p>
		<img src='../upload/user/${article.writer.photo}_40x40.jpg'
				style='border-radius: 70px' alt='[${article.writer.photo}_40x40]'>${article.writer.nickname}</p>

			<fmt:formatDate value="${article.createdDate}" pattern="yyyy.MM.dd" />
		
		<p>조회수: ${article.viewCount}</p>

		<textarea name='content' cols='50px'>${article.content}</textarea>
		<br>
		<button class="btn btn-primary">수정</button>
	</form>
	<a class="btn btn-primary" href='delete?no=${article.no}'>삭제</a>
	<a class="btn btn-danger"
		href='../report/reportArticle?no=${article.no}'>신고</a>

	<%
	  boolean bookmarked = (Boolean) request.getAttribute("bookmarked");
	%>
	<a class="btn <%=bookmarked ? "btn-outline-primary" : ""%>"
		href="../bookmark/<%=bookmarked ? "delete" : "add"%>?articleNo=${article.no}">
		<%=bookmarked ? "북마크취소" : "북마크"%></a>

	<jsp:include page="/comment/list?no=${article.no}"></jsp:include>
	<jsp:include page="/footer.jsp"></jsp:include>

	<script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>