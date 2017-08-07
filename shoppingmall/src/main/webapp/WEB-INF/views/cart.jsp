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
			<li class="nav-item"><a href="index.me" class="active nav-link"><i
					class="fa fa-home fa-home"></i>&nbsp;Home </a></li>
			<li class="nav-item"><a href="List.me?pg=1&gk=1"
				class="nav-link">Hat</a></li>
			<li class="nav-item"><a class="nav-link"
				href="List.me?pg=1&gk=2">Accessory</a></li>
			<li class="nav-item"><a href="list.me?pg=1&gk=3"
				class="nav-link">Q&amp;A</a></li>
		</ul>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<b>장바구니</b>

		<table border="0" class="table">

			<c:choose>
				<c:when test="${empty requestScope.list }">
					<tr>

						<td>장바구니에 상품이 없습니다.</td>
					</tr>



				</c:when>

				<c:otherwise>
					<tr>
						<th>제품 이름</th>
						<th>단가</th>
						<th>수량</th>
						<th>금액</th>
					</tr>


					<c:forEach var="cartlist" items="${requestScope.list }">

						<tr>

							<td>${cartlist.goodsname}</td>
							<td>${cartlist.price}</td>
							<td>${cartlist.qty }</td>
							<td>${cartlist.qty*cartlist.price }</td>

							<td>
								<form name="delete" method="post" action="Cart.me">
									<input type="hidden" name="index" value="${cartlist.num }">
									<input type="hidden" name="command" value="del"> <input
										type="submit" class="btn btn-default" value="삭제">
								</form>
							</td>

						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>


		</table>

		<form method="post" action="order.me" align="center">
			<c:choose>

				<c:when test="${empty requestScope.list }">
					<input type="button" value="첫 화면" class="btn btn-default" onclick="window.location='index.me'"
						style="width: 200px">
				</c:when>
				<c:otherwise>
					<input type="button" value="첫 화면" class="btn btn-default" onclick="window.location='index.me'"
						style="width: 200px">
					<input type="hidden" name="command" value="chk">
					<input type="submit" value="주문완료" class="btn btn-default"
						style="width: 200px">
				</c:otherwise>
			</c:choose>
		</form>
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