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
  </style>
</head>

<body>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
          <img class="img-fluid d-block" src="E:\포트폴리오 리눅스+jsp+톰캣+오라클\새 폴더\0002.jpg"> </div>
        <div class="col-md-4"></div>
      </div>
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" align="center">
          <hr color="green" width="300">
          <h2>회 원 탈 퇴</h2>
          <hr color="green" width="300">
          <form name="check" action="memberOut.me" method="post">
            <table class="table">
              <tbody>
                <tr>
                  <th>탈퇴 하시려면 비밀번호를 입력하세요.</th>
                </tr>
                <tr>
                  <td align="center">
                    <input type="password" name="passwd" class="box"> </td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                    <input type="submit" value="탈퇴">
                    <input type="button" onclick="window.location='index.me'" value="취소"> </td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
        <div class="col-md-2"></div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>