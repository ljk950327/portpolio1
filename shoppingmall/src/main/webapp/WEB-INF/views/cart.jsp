<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          <br>
          <br>
          <div class="card">
            <div class="card-block">
              <h4>${my id}님</h4>
              <br>
              <p>환영합니다. 오늘도 좋은하루 보내세요.</p>
            </div>
          </div>
          <br>
          <br>
          <button type="submit" class="btn btn-primary" id="logout">Logout</button>
          <div class="btn-group bg-inverse">
            <a href="#" class="btn btn-primary">회원정보 수정</a>
            <a href="#" class="btn btn-primary">장바구니</a>
            <a href="#" class="btn btn-primary">주문 내역</a>
          </div>
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
        <div class="col-md-12"> <b>장바구니</b>
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
                <td>
                  <form method="post" action="bookShop.do">
                    <input type="hidden" name="command" value="DEL">
                    <input type="submit" class="btn btn-default" value="삭제"> </form>
                </td>
              </tr>
            </tbody>
          </table>
          <form method="post" action="Shop.do" align="center">
            <input type="hidden" name="command" value="CHK">
            <input type="submit" value="주문완료" class="btn btn-default" style="width:200px"> </form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>