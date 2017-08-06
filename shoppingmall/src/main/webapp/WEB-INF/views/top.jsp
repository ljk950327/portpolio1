<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	String member_admin=(String)request.getAttribute("member_admin");
	String id=(String)session.getAttribute("id");
%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://pingendo.github.io/templates/blank/theme.css"
	type="text/css">
<script type="text/javascript">

	function check() {
		if (loginform.id.value == "") {
			alert("아이디를 입력하세요!!");
			f.id.focus();
			return;
		}
		if (loginform.passwd.value=="") {
			alert("비밀번호를 입력하세요!!");
			f.pwd.focus();
			return;
		}
		document.loginform.submit();
	}
	

	
</script>

</head>

<body>
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="alert alert-info w-100 my-1 px-5 text-justify"
						role="alert">
						<h1 class="display-1">KYU'S</h1>
						<p class="mb-0 lead">
							&nbsp;* Email : ljk950327@gmail.com <br>&nbsp;* H.P. :
							010-7644-5774 <br>&nbsp;* Lee Jae Kyu <br>&nbsp;*
							Shopping mall
						</p>
					</div>
				</div>
				<div class="col-md-6 bg-faded">

		<% if(member_admin!=null){ %>
						<br>
							<br>
							<div class="card">
								<div class="card-block">
									<h4>관리자님</h4>
									<br>
									<p>환영합니다. 오늘도 좋은하루 보내세요.</p>
								</div>
							</div>
							<br>
							<br>
							<div class="btn-group bg-inverse">
								<a href="memberLogin.me" class="btn btn-primary">Logout </a> 
								<a href="#" class="btn btn-primary">관리자 페이지</a> 
							</div>
		<% } else if(id!=null){ %>

							<br>
							<br>
							<div class="card">
								<div class="card-block">
									<h4>${id}님</h4>
									<br>
									<p>환영합니다. 오늘도 좋은하루 보내세요.</p>
								</div>
							</div>
							<br>
							<br>
							<div class="btn-group bg-inverse">
								<a href="memberLogin.me" class="btn btn-primary">Logout </a> <a
									href="memberModify.me" class="btn btn-primary">회원정보 수정</a> <a href="#"
									class="btn btn-primary">장바구니</a> <a href="#"
									class="btn btn-primary">주문 내역</a>
							
							</div>
		<%}else{ %>
		
							<form name="loginform" action="memberLogin.me" method="post">
							<input type="hidden" name="login" value="login">
								<p class="lead">LOGIN</p>
								<div class="form-group">
									<label>ID</label> <input type="text" class="form-control"
										name="id" placeholder="Enter Id">
								</div>
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control" name="passwd" placeholder="Password">
								</div>
								<a href="javascript:check()" class="btn btn-primary" id="login">Login</a>
								<div class="btn-group bg-inverse">
									<!-- 로그인 안되어있을때 -->
									<a href="memberCheck.me" class="btn btn-primary">회원가입</a>
								</div>
							</form>
		<%} %>

				</div>
			</div>
			