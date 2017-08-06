<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<div class="row">
	<div class="col-md-12">
		<ul class="nav nav-tabs mr-auto">
			<li class="nav-item"><a href="#" class="nav-link"><i
					class="fa fa-home fa-home"></i>&nbsp;Home </a></li>
			<li class="nav-item"><a href="hatlist.me" class="nav-link">Hat</a>
			</li>
			   <li class="nav-item"><a class="active  nav-link" href="acclist.me">Accessory</a>
			</li>
			<li class="nav-item"><a href="qnalist.me" class="nav-link">Q&amp;A</a>
			</li>
		</ul>
	</div>
</div>
<div class="row">
	<div class="py-5  section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"
						class="img-fluid img-thumbnail">
				</div>
				<div class="col-md-6">
					<form name="hatContent" action="hatContentBuy" method="post">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h3 class="text-primary">
											<output name="goodName">${dto.goodName }</output>
										</h3>
									</td>
								</tr>
								<tr>
									<td>ë¨ê° : &nbsp;&nbsp;<output name="goodsPrice">${imageboardDTO.goodsPrice }</output></td>
								</tr>
								<tr>
									<td>ìë : &nbsp;&nbsp; <select name="email2">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>

									</select>
									</td>
								</tr>
								<tr>
									<td>í©ê³ : &nbsp;&nbsp;<output name="goodsSUM">${imageboardDTO.imagePrice*imageboardDTO.imageQty }</output></td>
								</tr>
								<tr>
									<td colspan="2" height="200" valign="top"><pre>${imageboardDTO.imageContent}</pre>
									</td>
								</tr>
							</tbody>
						</table>
						<div align="center">
							<input type="button" class="btn btn-default" value="ëª©ë¡"
								onclick="location.href='imageboardList.jsp?pg=${pg }'">
							<input type="button" class="btn btn-default" value="ì¥ë°êµ¬ë"
								onclick="location.href='imageboardModifyProc.jsp?pg=${pg }&amp;seq=${imageboardDTO.seq }'">
							<input type="button" class="btn btn-default" value="ë°ë¡êµ¬ë§¤"
								onclick="location.href='imageboardDelete.jsp?seq=${imageboardDTO.seq }'">
						</div>
					</form>
				</div>
			</div>
		</div>
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