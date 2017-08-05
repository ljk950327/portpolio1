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
          <li class="nav-item active">
            <a class="nav-link" href="#">Hat</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Accessory</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Order</a>
          </li>
        </ul>
      </div>
    </div>
    <a href="#" class="btn btn-primary">logout</a>
  </nav>
  <h1 class="text-primary" align="center"> hat 상품 수정</h1>
  <div class="py-5  section">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <input type="file" name="image1" class="img-fluid img-thumbnail"> </div>
        <div class="col-md-6">
          <form name="hatContent" action="hatContentBuy" method="post" enctype="multipart/form-data">
            <table class="table">
              <tbody>
                <tr>
                  <td>
                    <h3 class="text-primary">
                      <input type="text" name="goodName" class="form-control" placeholder="상품명을 적어주세요." value="${imageboardDTO.goodsId }"> </h3>
                  </td>
                </tr>
                <tr>
                  <td>단가 : &nbsp;&nbsp;
                    <input type="text" name="goodsPrice" class="form" placeholder="가격을 적어주세요." value="${imageboardDTO.goodsPrice }"> </td>
                </tr>
                <tr>
                  <td colspan="2" height="200" valign="top"> <textarea class="form-control" placeholder="설명을 적어주세요.">${imageboardDTO.goodsContent }</textarea> </td>
                </tr>
              </tbody>
            </table>
            <div align="center">
              <input type="button" class="btn btn-default" value="업로드" onclick="location.href='imageboardList.jsp?pg=${pg }'">
              <input type="button" class="btn btn-default" value="목록" onclick="location.href='imageboardModifyProc.jsp?pg=${pg }&amp;seq=${imageboardDTO.seq }'"> </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>