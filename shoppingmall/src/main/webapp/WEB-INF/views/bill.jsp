<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://pingendo.github.io/templates/blank/theme.css" type="text/css">
  <style>
    th {
      text-align: center;
    }

    td {
      text-align: center;
    }
  </style>
</head>

<body>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="alert alert-info w-100 my-1 px-5 text-justify" role="alert">
            <h1 class="display-1">KYU'S</h1>
            <p class="mb-0 lead">&nbsp;* Email : ljk950327@gmail.com
              <br>&nbsp;* H.P. : 010-7644-5774
              <br>&nbsp;* Lee Jae Kyu
              <br>&nbsp;* Shopping mall</p>
          </div>
        </div>
        <div class="col-md-6 bg-faded">
					<c:choose>
						<c:when test="${member_admin==1}">
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
								<a href="memberLogout.me" class="btn btn-primary">Logout </a> 
								<a href="#" class="btn btn-primary">관리자 페이지</a> 
							</div>
						</c:when>
						<c:when test="${loginSession}">
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
								<a href="memberLogout.me" class="btn btn-primary">Logout </a> <a
									href="#" class="btn btn-primary">회원정보 수정</a> <a href="#"
									class="btn btn-primary">장바구니</a> <a href="#"
									class="btn btn-primary">주문 내역</a>
							
							</div>
						</c:when>
						<c:otherwise>
							<form name="loginform" action="memberLogin.me" method="post">
								<p class="lead">LOGIN</p>
								<div class="form-group">
									<label>ID</label> <input type="email" class="form-control"
										name="id" placeholder="Enter Id">
								</div>
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control" name="passwd" placeholder="Password">
								</div>
								<button type="submit" class="btn btn-primary" id="login">Login</button>
								<div class="btn-group bg-inverse">
									<!-- 로그인 안되어있을때 -->
									<a href="#" class="btn btn-primary">회원가입</a>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <ul class="nav nav-tabs mr-auto">
            <li class="nav-item">
              <a href="#" class="active nav-link"><i class="fa fa-home fa-home"></i>&nbsp;Home </a>
            </li>
            <li class="nav-item">
              <a href="hatlist.me" class="nav-link">Hat</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="acclist.me">Accessory</a>
            </li>
            <li class="nav-item">
              <a href="qnalist.me" class="nav-link">Q&amp;A</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12"> <b>주문 내역</b>
          <table border="1" class="table">
            <tbody>
              <tr>
                <th>제품 사진</th>
                <th>제품 이름</th>
                <th>가격</th>
                <th>수량</th>
              </tr>
              <tr>
                <td>=dto.getTitle() %&gt;</td>
                <td>=dto.getAuthor() %&gt;</td>
                <td>dto.getPrice() %&gt;</td>
                <td>dto.getQty() %&gt;</td>
              </tr>
              <tr align="center">
                <td colspan="4"> <b>총가격:&nbsp; priceSUM}원</b>
                  <br>
                  <br> 1002-014-740563 우리은행 이재규
                  <br>
                  <br> 무통장입금 sysdate+1까지 입금바랍니다. </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>