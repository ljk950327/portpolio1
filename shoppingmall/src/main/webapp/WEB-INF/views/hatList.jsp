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
              <a href="index.me" class="nav-link"><i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
            <li class="nav-item">
              <a href="list.me" class="active nav-link">Hat</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="list.me">Accessory</a>
            </li>
            <li class="nav-item">
              <a href="list.me" class="nav-link">Q&amp;A</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="row">
      <c:if test=""></c:if>
      <c:forEach var="dto" items="${requestScope.list }">
        <div class="col-sm-6 col-lg-6 col-md-4">
          <div class="thumbnail">
            <img class="img-fluid d-block" src="img/${list.imgsrc}">
            <div class="caption">
              <h3 class="pull-right">${list.price}</h3>
              <h3>
                <a href="hatContent.me">${list.goodsname }</a>
              </h3>
              <p>${list.content }</p>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    <div class="row">
      <div class="col-md-4"></div>
      <div class="element">
        <ul class="pagination pagination-sm">
        <c:if test="${requestScope.startPage>3 }">
          <li class="page-item">
            <a class="page-link" href="list.me?pg=${requestScope.startPage -1 }&gk=0" aria-label="Previous"> <span aria-hidden="true">«</span> <span class="sr-only">Previous</span> </a>
          </li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1"	>
          <c:if test="${i==pg }">
          <li class="page-item">
            <a class="page-link" href="list.me?pg=${requestScope.startPage}&gk=0">${i }</a>
          </li>
          </c:if>
          <c:if test="${i!=pg }">
          <li class="page-item">
            <a class="page-link" href="list.me?pg=${i}&gk=0">${i }</a>
          </li>
          </c:if>
          </c:forEach>
          <c:if test="${requestScope.endPage<totalPage }">
          <li class="page-item">
            <a class="page-link" href="list.me?pg=${requestScope.endPage +1 }&gk=0" aria-label="Next"> <span aria-hidden="true">»</span> <span class="sr-only">Next</span> </a>
          </li>
          </c:if>
        </ul>
      </div>
      <div class="col-md-4"></div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>