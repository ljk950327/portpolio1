<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<style>
th {
	text-align: center;
}
</style>

<div class="row">
	<div class="col-md-12">
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a href="index.me" class="nav-link"><i class="fa fa-home fa-home"></i>&nbsp;Home</a>
            </li>
 
            <li class="nav-item">
              <a href="List.me?pg=1&gk=1" class="nav-link">Hat</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="List.me?pg=1&gk=2">Accessory</a>
            </li>

            <li class="nav-item">
              <a href="List.me?pg=1&gk=3" class="active nav-link">Q&amp;A</a>
            </li>
          </ul>
        </div>
</div>
<div class="row">
	<div class="col-sm-12 col-lg-12 col-md-12" align="center">


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
					<c:choose>
						<c:when test="${empty requestScope.list }">
							<tr>
								<td colspan="6"><h3>글이 없습니다.</h3></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${requestScope.list }">
								<tr>
									<td>${list.num }</td>
									<td>
										<c:if test="${list.re_level>0 }">
											<img src="img/level.gif" width="${list.re_level*10 }">
											<img src="img/re.gif">
										</c:if>
										<a href="QnaContent.me?num=${list.num }&pg=${pg}">
											${list.subject } </a>
										<c:if test="${list.readcount>10 }">
											<img src="img/hot.gif">
										</c:if>
									</td>
									<td>${list.writer }</td>
									<td>${list.reg_date }</td>
									<td>${list.readcount }</td>
									<td>${list.ip }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tr>
						<td colspan="2"></td>
						<td colspan="2">
							<ul class=" pagination pagination-lg">
								<c:if test="${requestScope.startPage>3 }">
									<li class="page-item"><a class="page-link"
										href="List.me?pg=${requestScope.startPage -1 }&gk=${gk}"
										aria-label="Previous"> <span aria-hidden="true">«</span> <span
											class="sr-only">Previous</span>
									</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }"
									step="1">
									<c:if test="${i==pg }">
										<li class="page-item"><a class=" page-link"
											href="List.me?pg=${i}&gk=${gk}"><b>${i }</b></a>
										</li>
									</c:if>
									<c:if test="${i!=pg }">
										<li class="page-item"><a class="page-link"
											href="List.me?pg=${i}&gk=${gk}">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${requestScope.endPage<totalPage }">
									<li class="page-item"><a class="page-link"
										href="List.me?pg=${requestScope.endPage +1 }&gk=${gk}"
										aria-label="Next"> <span aria-hidden="true">»</span> <span
											class="sr-only">Next</span>
									</a></li>
								</c:if>
							</ul>
						</td>

						<c:choose>
							<c:when test="${empty sessionScope.id }">
							</c:when>
							<c:otherwise>
								<td colspan="2" align="right"><a href="QnaWrite.me"
									class="btn btn-primary">글쓰기</a></td>
							</c:otherwise>
						</c:choose>

					</tr>
				</tbody>
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
</div>
</body>

</html>