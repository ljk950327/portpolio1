<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<style>
th {
	text-align: center;
}

td {
	text-align: center;
}
</style>

<div class="row">
	<div class="col-md-12">
		<ul class="nav nav-tabs mr-auto">
			<li class="nav-item"><a href="#" class="active nav-link"><i
					class="fa fa-home fa-home"></i>&nbsp;Home </a></li>
			<li class="nav-item"><a href="hatlist.me" class="nav-link">Hat</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="acclist.me">Accessory</a>
			</li>
			<li class="nav-item"><a href="qnalist.me" class="nav-link">Q&amp;A</a>
			</li>
		</ul>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<b>주문 내역</b>
		<table border="0" class="table">
			<c:choose>
				<c:when test="${empty requestScope.list }">
					<tr>

						<td>주문 내역이 없습니다..</td>
					</tr>

				</c:when>

				<c:otherwise>
					<c:forEach var="list" items="${requestScope.list }">
						<c:set var="totalsum" value="${totalsum+list.sum }" />
					</c:forEach>
					<tr align="center">

						<td colspan="4"><b>총가격:&nbsp; ${totalsum }원</b> <br> <br>
							1002-014-740563 우리은행 이재규 <br> <br> 무통장입금
							내일 24시까지 입금바랍니다.</td>
					</tr>
					<tr>
					<td><input type="button" value="첫 화면" class="btn btn-default" onclick="window.location='index.me'"
						style="width: 200px"></td>
					</tr>

				</c:otherwise>
			</c:choose>


		</table>
	</div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script
	src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>