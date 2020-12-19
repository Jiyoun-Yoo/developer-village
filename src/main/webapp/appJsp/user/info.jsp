<%@page import="java.util.ArrayList"%>
<%@page import="com.devil.domain.Tag"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.devil.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h1>사용자 정보</h1>
<c:choose>
<c:when test="${user.no != loginUser.no && null ne user}">
	<img src='../../upload/user/${user.photo}_160x160.jpg'
		alt='[${user.photo}.jpg]'>
	<c:choose>
		<c:when test="${followed}">
			<a class="btn btn-outline-danger"
				href="../follow/deleteUser?followeeNo=${user.no}">언팔로우</a>
		</c:when>
		<c:otherwise>
			<a class="btn btn-primary"
				href="../follow/addUser?followeeNo=${user.no}">팔로우</a>
		</c:otherwise>
	</c:choose>
	<br>
	<p>닉네임: ${user.nickname}</p>
	<p>이메일 ${user.email}</p>
	<p>기술 목록 ${user.tech}</p>
	<p><a href="../follow/userList">팔로잉: ${user.followingCount}</a></p>
	<p><a href="../follow/followerList">팔로워: ${user.followerCount}</a></p>
	<div>
		<c:choose>
			<c:when test="${empty user.homepageURL}">
				<a class="btn" href="${user.homepageURL}"><i class="fas fa-home fa-lg"></i></a>
			</c:when>
			<c:when test="${empty user.githubURL}">
				<a class="btn" href="${user.githubURL}"><i class="fab fa-github-alt fa-lg"></i></a>
			</c:when>
			<c:when test="${empty user.instarURL}">
				<a class="btn" href="${user.instarURL}"><i class="fab fa-instagram fa-lg"></i></a>
			</c:when>
			<c:when test="${empty user.twitterURL}">
				<a class="btn" href="${user.twitterURL}"><i class="fab fa-twitter fa-lg"></i></a>
			</c:when>
		</c:choose>
	</div>
	<a class="btn btn-outline-primary"
		href="../article/writtenList?no=${user.no}">작성게시글</a>
	<a class="btn btn-outline-primary"
		href="../comment/writtenList?no=${user.no}">작성댓글</a>
</c:when>


<c:otherwise>
	<img src='../../upload/user/${loginUser.photo}_160x160.jpg'
		alt='[${loginUser.photo}.jpg]'>
	<br>
	<p>닉네임: ${loginUser.nickname}</p>
	<p>이메일 ${loginUser.email}</p>
	<p>기술 목록 ${loginUser.tech}</p>
	 <p><a href="../follow/userList">팔로잉: ${loginUser.followingCount}</a></p>
  <p><a href="../follow/followerList">팔로워: ${loginUser.followerCount}</a></p>
	<div>
			<c:if test="${not empty loginUser.homepageURL}">
				<a class="btn" href="${loginUser.homepageURL}"><i class="fas fa-home fa-lg"></i></a>
			</c:if>
			<c:if test="${not empty loginUser.githubURL}">
				<a class="btn" href="${loginUser.githubURL}"><i class="fab fa-github-alt fa-lg"></i></a>
			</c:if>
			<c:if test="${not empty loginUser.instarURL}">
				<a class="btn" href="${loginUser.instarURL}"><i class="fab fa-instagram fa-lg"></i></a>
			</c:if>
			<c:if test="${not empty loginUser.twitterURL}">
				<a class="btn" href="${loginUser.twitterURL}"><i class="fab fa-twitter fa-lg"></i></a>
			</c:if>
	</div>
	<a class="btn btn-primary" 
	  href="../user/updateForm?no=${loginUser.no}">프로필 수정</a>
	<br>
	<a class="btn btn-outline-primary"
    href="../article/feed">피드</a>
	<a class="btn btn-outline-primary"
		href="../article/writtenList?no=${loginUser.no}">작성게시글</a>
	<a class="btn btn-outline-primary"
		href="../comment/writtenList?no=${loginUser.no}">작성댓글</a>
	<a class="btn btn-outline-primary" href="../follow/tagList">팔로잉 태그</a>
	<a class="btn btn-outline-primary" href="../follow/userList">팔로잉
		유저</a>
	<a class="btn btn-outline-primary" href="../follow/followerList">팔로워</a>
	<a class="btn btn-outline-primary" href="../bookmark/list">북마크</a>
	<a class="btn btn-outline-primary" href="../collect/list">뱃지</a>
</c:otherwise>
</c:choose>