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
            <a class=" nav-link" href="#">Hat</a>
          </li>
          <li class="nav-item">
            <a class="active nav-link" href="#">Accessory</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Order</a>
          </li>
        </ul>
      </div>
    </div>
    <a href="#" class="btn btn-primary">logout</a>
  </nav>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
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
                      <input type="button" value="수정" onclick="location.href='imageboardList.jsp?pg=${pg }'" class="btn btn-default">
                      <input type="button" value="삭제" onclick="location.href='imageboardModifyProc.jsp?pg=${pg }&amp;seq=${imageboardDTO.seq }'" class="btn btn-default">
                      <input type="button" value="목록" onclick="location.href='imageboardDelete.jsp?seq=${imageboardDTO.seq }'" class="btn btn-default"> </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>