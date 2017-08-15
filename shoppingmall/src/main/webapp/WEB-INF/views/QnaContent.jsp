
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
			<li class="nav-item"><a href="index.me" class="nav-link"><i
					class="fa fa-home fa-home"></i>&nbsp;Home</a></li>

			<li class="nav-item"><a href="List.me?pg=1&gk=1"
				class="nav-link">Hat</a></li>
			<li class="nav-item"><a class="nav-link"
				href="List.me?pg=1&gk=2">Accessory</a></li>

			<li class="nav-item"><a href="List.me?pg=1&gk=3"
				class="active nav-link">Q&amp;A</a></li>
		</ul>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div align="center">
			<table border="0" width="1100" class="table">
				<tbody>
					<tr class="">
						<th class="bg-faded">글번호</th>
						<td><input type="box" name="num" size="10" value="${dto.num}">
						</td>
						<th style="width: 100px;">조회수&nbsp; :</th>
						<td><input type="box" name="num" size="10"
							value="${dto.readcount}"></td>
					</tr>
					<tr>
						<th class="bg-faded">작성자</th>
						<td><input type="box" name="writer" value="${dto.writer}"
							readonly=""></td>
						<th style="width: 100px;">작성일&nbsp; :</th>
						<td><input type="box" name="num" size="10"
							value="${dto.reg_date}"></td>
					</tr>
					<tr>
						<th class="bg-faded">제목</th>
						<td colspan="3"><input type="box" name="email" size="40"
							value="${dto.subject}" readonly=""></td>
					</tr>
					<tr>
						<th class="bg-faded">내용</th>
						<td colspan="3"><textarea name="content" rows="10" cols="120"
								readonly="" class="box">${dto.content}</textarea></td>
					</tr>
					<tr>
						<td align="center" colspan="4">
						<c:choose>
						<c:when test=""></c:when>
						<c:when
								test="${empty sessionScope.id }">
								<input type="button"
									onclick="window.location='List.me?pg=${pg}&gk=3'" value="목록보기"
									class="btn btn-default">
							</c:when> 
							<c:otherwise>
							<input type="button"
									onclick="window.location='List.me?pg=${pg}&gk=3'" value="목록보기"
									class="btn btn-default">
							<input type="button" class="btn btn-default" value="답글달기"
							onclick="window.location='QnaWrite.me?num=${dto.num}&re_step=${dto.re_step}&re_level=${dto.re_level}'">
							<input type="button"
							onclick="window.location='update.do?num=${dto.num}'" value="수정"
							class="btn btn-default"> <input type="button"
							onclick="window.location='delete.do?num=${dto.num}'" value="삭제"
							class="btn btn-default">
							</c:otherwise>
							</c:choose>
							</td>
							
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