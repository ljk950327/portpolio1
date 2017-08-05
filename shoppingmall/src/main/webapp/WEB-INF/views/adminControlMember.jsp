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
          <li class="nav-item active">
            <a class="nav-link" href="#">Member</a>
          </li>
          <li class="nav-item">
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
  <div>
    <div class="container">
      <div class="row">
        <div align="center" class="col-lg-12">
          <hr color="green" width="300">
          <h2>í ì ëª© ë¡ ë³´ ê¸°</h2>
          <hr color="green" width="300"> &lt;% List
          <memberdto> list = (List)request.getAttribute("memberList"); if (list == null || list.size()==0){%&gt; </memberdto> &lt;% }else { for(MemberDTO dto : list){%&gt; &lt;% } }%&gt;
          <table class="table">
            <tbody>
              <tr class="bg-faded">
                <th class="m3">ì´ë¦</th>
                <th class="m3">ìì´ë</th>
                <th class="m3">ì´ë©ì¼</th>
                <th class="m3">ì íë²í¸</th>
                <th class="m3">ê°ìì¼</th>
                <th class="m3">ìì  | ì­ì </th>
              </tr>
              <tr>
                <td colspan="6">ê°ìë íìì´ ììµëë¤.</td>
              </tr>
              <tr>
                <td>getName</td>
                <td>getId</td>
                <td>getEmail</td>
                <td>getHP()</td>
                <td>getJoinDate</td>
                <td>
                  <a href="member_edit.do?no=&lt;%=dto.getNo()%&gt;">ìì </a> |
                  <a href="member_delete.do?no=&lt;%=dto.getNo()%&gt;">ì­ì </a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
          <div class="col-lg-12" align="center">
            <div class="col-md-6 element">
              <ul class="pagination pagination-sm">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">Â«</span> <span class="sr-only">Previous</span> </a>
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
                  <a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">Â»</span> <span class="sr-only">Next</span> </a>
                </li>
              </ul>
            </div>
            <form class="form-inline my-2 my-md-0">
              <input class="form-control mr-xs-2" type="text" placeholder="Search" style="width:206px;margin:1;">
              <button class="btn btn-outline-success my-2 my-xs-0" type="submit" style="margin:15;">Search</button>
            </form>
          </div>
        </div>
        <div class="col-md-4"></div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>