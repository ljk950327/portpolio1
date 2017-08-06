<%@page import="com.jaegyu.shoppingmall.qna.qnaDTO"%>
<%
	qnaDTO dto = (qnaDTO) request.getAttribute("dto");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
   
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
            <form name="f" action="Qnawrite.do" method="post">
              <input type="hidden" name="num" value="${dto.num }">
              <input type="hidden" name="re_step" value="${dto.re_step }">
              <input type="hidden" name="re_level" value="${dto.re_level }">
              <table border="0" width="1100" class="table">
                <tbody>
                  <tr class="bg-faded">
                    <th colspan="2">글쓰기</th>
                  </tr>
                  <tr>
                    <th class="bg-faded">작성자</th>
                    <td>
                      <input type="text" name="writer" value="${dto.writer}" readonly=""> </td>
                  </tr>
                  <tr>
                    <th class="bg-faded">Email</th>
                    <td>
                      <input type="text" name="subject" value="${dto.email}" readonly=""> </td>
                  </tr>
                  <tr>
                    <th class="bg-faded">제목</th>
                    <td>
                      <input type="text" name="email" size="40" value="${dto.subject}"> </td>
                  </tr>
                  <tr>
                    <th class="bg-faded">내용</th>
                    <td><textarea name="content" rows="10" cols="120">${dto.content}</textarea></td>
                  </tr>
                  <tr>
                    <td align="center" colspan="2">
                      <input type="submit" value="수정" class="btn btn-default">
                      <input type="reset" value="다시작성" class="btn btn-default">
                      <input type="button" onclick="window.location='Qnalist.me'" value="목록보기" class="btn btn-default"> </td>
                  </tr>
                </tbody>
              </table>
            </form>
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