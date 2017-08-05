<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://pingendo.github.io/templates/blank/theme.css" type="text/css"> </head>

<body>
  <nav class="navbar navbar-expand-md navbar-light bg-faded">
    <div class="container">
      <a class="navbar-brand" href="#">KYU'S ADMIN</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item ">
            <a class="nav-link" href="#">Member</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Hat</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Accessory</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Order</a>
          </li>
        </ul>
      </div>
    </div>
    <a href="#" class="btn btn-primary">logout</a>
  </nav>
  <div>
    <div class="container">
      <div class="row">
        <div align="center" class="col-lg-12">
          <hr color="green" width="300">
          <h2>주문 목 록 보 기</h2>
          <hr color="green" width="300"> &lt;% List
          <memberdto> list = (List)request.getAttribute("memberList"); if (list == null || list.size()==0){%&gt; </memberdto> &lt;% }else { for(MemberDTO dto : list){%&gt; &lt;% } }%&gt;
          <table class="table">
            <tbody>
              <tr class="bg-faded">
                <th class="m3">아이디</th>
                <th class="m3">주소</th>
                <th class="m3">상품이름</th>
                <th class="m3">수량</th>
                <th class="m3">주문일시</th>
                <th class="m3">완료 | 취소</th>
              </tr>
              <tr>
                <td colspan="6">주문 내역이 없습니다.</td>
              </tr>
              <tr>
                <td>getName</td>
                <td>getId</td>
                <td>getEmail</td>
                <td>getHP()</td>
                <td>getJoinDate</td>
                <td>
                  <a href="member_edit.do?no=&lt;%=dto.getNo()%&gt;">완료</a> |
                  <a href="member_delete.do?no=&lt;%=dto.getNo()%&gt;">취소</a>
                </td>
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