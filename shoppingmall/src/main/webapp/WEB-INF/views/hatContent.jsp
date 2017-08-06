<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    .element {
      display: block;
      margin-left: auto;
      margin-right: auto;
    }
  </style>
<%@ include file="top.jsp" %>

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