<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>

        <div class="row">
        	<div class="col-md-12">
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a href="index.me" class="nav-link"><i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>

            <li class="nav-item">
              <a href="List.me?pg=1&gk=1" class="${dto.gk==1?'active nav-link':'nav-link'  }">Hat</a>
            </li>
            <li class="nav-item">
              <a class="${dto.gk==2?'active nav-link':'nav-link'  }" href="List.me?pg=1&gk=2">Accessory</a>
            </li>

            <li class="nav-item">
              <a href="List.me?pg=1&gk=3" class="nav-link">Q&amp;A</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="py-5  section">
          <div class="container">
            <div class="row">
              <div class="col-md-6">
                <img src="img/${dto.imgsrc }" class="img-fluid img-thumbnail"> </div>
              <div class="col-md-6">
                <form name="goodsContent" action="Cart.me" method="post">
                	<input type="hidden" name="command" value="add">
                	<input type="hidden" name="num" value="${dto.num }">
                	<input type="hidden" name="goodsname" value="${dto.goodsname }">
                	<input type="hidden" name="price" value="${dto.price }">
                	
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>
                          <h3 class="text-primary"><output name="goodName" >${dto.goodsname }</output></h3>
                        </td>
                      </tr>
                      <tr>
                        <td>단가 : &nbsp;&nbsp;<output name="goodsPrice">${dto.price }</output></td>
                      </tr>
                      <tr>
                        
                        <td> 수량 : &nbsp;&nbsp; <select name="qty">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
						
			</select></td>
			
                      </tr>
                      <tr>
                        <td colspan="2" height="200" valign="top">
                          <pre>${dto.content}</pre> </td>
                      </tr>
                    </tbody>
                  </table>
                  <div align="center">
                  	<c:choose>
                  	<c:when test="${empty sessionScope.id }">
                  	<input type="button" value="돌아가기" onclick="location.href='List.me?pg=${requestScope.pg }&gk=${dto.gk }'" class="btn btn-default"> </div>
                    </c:when>
                    <c:otherwise>
                    <input type="submit" value="장바구니에 넣기" class="btn btn-default">
                    <input type="button" value="돌아가기" onclick="location.href='List.me?pg=${requestScope.pg }&gk=${dto.gk }'" class="btn btn-default"> </div>
                    </c:otherwise>
  					</c:choose>
                </form>
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