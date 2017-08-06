<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="top.jsp" %>
      <style>
    th {
      text-align: center;
    }
  </style>
   
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
            <table class="table table-hover" width="1100">
              <tbody>
                <tr class="bg-faded">
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회</th>
                  <th>IP</th>
                </tr>
                <tr>
                  <td>&lt;%=dto.getNum()%&gt;</td>
                  <td>
                    <a href="content.do?num=&lt;%=dto.getNum()%&gt;"> &lt;%=dto.getSubject()%&gt; </a>
                  </td>
                  <td>&lt;%=dto.getWriter()%&gt;</td>
                  <td>&lt;%=dto.getReg_date()%&gt;</td>
                  <td>&lt;%=dto.getReadcount()%&gt;</td>
                  <td>&lt;%=dto.getIp()%&gt;</td>
                </tr>
                <tr>
                  <td colspan="2" align="right"> </td>
                  <td colspan="2">
                    <ul class="pagination pagination-sm" style="width:167px;margin:0 auto;">
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
                  </td>
                  <td colspan="2" align="right">
                    <a href="QnaWrite.me" class="btn btn-primary">글쓰기</a>
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
  </div>
</body>

</html>