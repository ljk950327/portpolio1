<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://pingendo.github.io/templates/blank/theme.css" type="text/css">
  <style>
    .element {
      display: block;
      margin-left: auto;
      margin-right: auto;
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
          <form class="">
            <p class="lead">LOGIN </p>
            <div class="form-group"> <label>ID</label>
              <input type="email" class="form-control" placeholder="Enter Id"> </div>
            <div class="form-group"> <label>Password</label>
              <input type="password" class="form-control" placeholder="Password"> </div>
            <button type="submit" class="btn btn-primary" id="login">Login</button>
            <button type="submit" class="btn btn-primary" id="logout">Logout</button>
            <div class="btn-group bg-inverse">
              <a href="#" class="btn btn-primary">회원정보 수정</a>
              <a href="#" class="btn btn-primary">장바구니</a>
              <a href="#" class="btn btn-primary">주문 내역</a>
            </div>
          </form>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a href="#" class="nav-link"><i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
            <li class="nav-item">
              <a href="hatlist.me" class="active nav-link">Hat</a>
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
        <div class="py-5  section">
          <div class="container">
            <div class="row">
              <div class="col-md-6">
                <img src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" class="img-fluid img-thumbnail"> </div>
              <div class="col-md-6">
                <form name="hatContent" action="hatContentBuy" method="post">
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>
                          <h3 class="text-primary"><output name="goodName">${dto.goodName }</output></h3>
                        </td>
                      </tr>
                      <tr>
                        <td>단가 : &nbsp;&nbsp;<output name="goodsPrice">${imageboardDTO.goodsPrice }</output></td>
                      </tr>
                      <tr>
                        <td> 수량 : &nbsp;&nbsp; <select name="email2">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
						
			</select> </td>
                      </tr>
                      <tr>
                        <td>합계 : &nbsp;&nbsp;<output name="goodsSUM">${imageboardDTO.imagePrice*imageboardDTO.imageQty }</output></td>
                      </tr>
                      <tr>
                        <td colspan="2" height="200" valign="top">
                          <pre>${imageboardDTO.imageContent}</pre> </td>
                      </tr>
                    </tbody>
                  </table>
                  <div align="center">
                    <input type="button" value="목록" onclick="location.href='imageboardList.jsp?pg=${pg }'" class="btn btn-default">
                    <input type="button" value="장바구니" onclick="location.href='imageboardModifyProc.jsp?pg=${pg }&amp;seq=${imageboardDTO.seq }'" class="btn btn-default">
                    <input type="button" value="바로구매" onclick="location.href='imageboardDelete.jsp?seq=${imageboardDTO.seq }'" class="btn btn-default"> </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>