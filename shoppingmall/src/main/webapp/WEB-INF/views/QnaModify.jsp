<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://pingendo.github.io/templates/blank/theme.css" type="text/css"> </head>

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
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a href="#" class="nav-link"><i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
            <li class="nav-item">
              <a href="hatlist.me" class="nav-link">Hat</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="acclist.me">Accessory</a>
            </li>
            <li class="nav-item">
              <a href="qnalist.me" class="active nav-link">Q&amp;A</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div align="center">
            <form name="f" action="Qnawrite.do" method="post">
              <input type="hidden" name="num" value="<%=num%>">
              <input type="hidden" name="re_step" value="<%=re_step%>">
              <input type="hidden" name="re_level" value="<%=re_level%>">
              <table border="0" width="1100" class="table">
                <tbody>
                  <tr class="bg-faded">
                    <th colspan="2">글쓰기</th>
                  </tr>
                  <tr>
                    <th class="bg-faded">작성자</th>
                    <td>
                      <input type="text" name="writer" value="${my id}" readonly=""> </td>
                  </tr>
                  <tr>
                    <th class="bg-faded">Email</th>
                    <td>
                      <input type="text" name="subject" value="${my email}" readonly=""> </td>
                  </tr>
                  <tr>
                    <th class="bg-faded">제목</th>
                    <td>
                      <input type="text" name="email" size="40" value="${subject}"> </td>
                  </tr>
                  <tr>
                    <th class="bg-faded">내용</th>
                    <td><textarea name="content" rows="10" cols="120">${context}</textarea></td>
                  </tr>
                  <tr>
                    <td align="center" colspan="2">
                      <input type="submit" value="수정" class="btn btn-default">
                      <input type="reset" value="다시작성" class="btn btn-default">
                      <input type="button" onclick="window.location='Qnalist.me'" value="목록보기" class="btn btn-default"> </td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
  </div>
</body>

</html>