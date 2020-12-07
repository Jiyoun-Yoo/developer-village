<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 조회</title>
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
		<input style="font-size: 20x;" type='text'
			name='title' value='${article.title}' size='50'><br>

		<p>
			작성자: <img src='/upload/user/${article.writer.photo}_40x40.jpg'
				style='border-radius: 70px' alt='[${article.writer.photo}]_40x40]'>${article.writer.nickname}</p>

		<ul id='tags'>
			<c:forEach items="${tags}" var="tag">
				<li id='color' style="background-color: blue; color: white;">${tag.name}</li>
			</c:forEach>
		</ul>

		<p>
			등록일:
			<fmt:formatDate value="${article.createdDate}" pattern="yyyy.MM.dd" />
		</p>
		<p>조회수: ${article.viewCount}</p>

		<textarea name='content'>${article.content}</textarea>
		<br>
		<button>수정</button>
		<button type='button' class='btn-danger'
			onclick="location.href='delete?no=${article.no}'">삭제</button>
		<button type='button' class='btn-danger'
			onclick="location.href='../report/reportArticle?no=${article.no}'">게시글
			신고</button>
	</form>
	<jsp:include page="/comment/list?no=${article.no}"></jsp:include>
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>