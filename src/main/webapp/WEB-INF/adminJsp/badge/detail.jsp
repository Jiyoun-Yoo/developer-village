<%@page import="com.devil.domain.Badge"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뱃지 조회</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href='../style.css'>
<link rel="stylesheet"
  href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
  integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
  crossorigin="anonymous" />
</head>
<body>
<h1>뱃지 조회</h1>

<form action='updatePhoto' method='post' enctype='multipart/form-data'>
<input type='text' name='no' value='${badge.no}' readonly style='display:hidden;'><br>
<img src='../../upload/badge/${badge.photo}_160x160.png' alt='[뱃지 이미지]'>
<input type='file' name='photoFile'><br>
<button class="btn btn-primary">이미지 변경</button>
</form>
<form action='update' method='post'>
<input type='hidden' name='no' value='${badge.no}'>
<p>이름 : ${badge.name}</p>
<textarea name='content'>${badge.content}</textarea><br>
<p>태그 : ${badge.tag.name}</p>
<button>뱃지 수정</button>
</form>
<p><a class='btn' href='list'>뱃지 목록으로</a></p>
<a class="btn btn-primary" href='delete?no=${badge.no}'>삭제</a>

<jsp:include page="../footer.jsp"></jsp:include>
  <script src="../../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>