<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="top.jsp"%>
<%
	int num = 0, re_step = 0, re_level = 0;
	String cnum = request.getParameter("num");
	if (cnum != null) {
		num = Integer.parseInt(cnum);
		re_step = Integer.parseInt(request.getParameter("re_step"));
		re_level = Integer.parseInt(request.getParameter("re_level"));
	}
%>
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
			<form name="f" action="QnaWrite.me" method="post">
				<input type="hidden" name="num" value="<%=num%>"> <input
					type="hidden" name="re_step" value="<%=re_step%>"> <input
					type="hidden" name="re_level" value="<%=re_level%>">
				<table border="0" width="1100" class="table">
					<tbody>
						<tr class="bg-faded">
							<th colspan="2">글쓰기</th>
						</tr>
						<tr>
							<th class="bg-faded">작성자</th>
							<td><input type="box" name="writer"
								value="${sessionScope.id}" readonly ></td>
						</tr>
						<tr>
							<th class="bg-faded">제목</th>
							<td><input type="text" name="subject" size="40"
								placeholder="제목을 입력하세요."></td>
						</tr>
						<tr>
							<th class="bg-faded">내용</th>
							<td><textarea name="content" rows="10" cols="120"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2"><input type="submit"
								value="글쓰기" class="btn btn-default"> <input type="reset"
								value="다시작성" class="btn btn-default"> <input
								type="button" onclick="window.location='Qnalist.me'"
								value="목록보기" class="btn btn-default"></td>
						</tr>
					</tbody>
				</table>
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
</div>
</body>

</html>