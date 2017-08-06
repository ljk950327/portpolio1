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
        <div class="col-sm-4 col-lg-4 col-md-4">
          <div class="thumbnail">
            <img class="img-fluid d-block" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg">
            <div class="caption">
              <h4 class="pull-right">$24.99</h4>
              <h4>
                <a href="hatContent.me">${list.goodsname }</a>
              </h4>
              <p>See more snippets like this online store item at
                <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
            </div>
            <div class="ratings">
              <p class="pull-right">15 reviews</p>
              <p> <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> </p>
            </div>
          </div>
        </div>
      </div>
    <div class="row">
      <div class="col-md-4"></div>
      <div class="element">
        <ul class="pagination pagination-sm">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">«</span> <span class="sr-only">Previous</span> </a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">2</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">3</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">4</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">»</span> <span class="sr-only">Next</span> </a>
          </li>
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