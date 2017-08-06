<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jaegyu.shoppingmall.member.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	memberDTO dto=(memberDTO)request.getAttribute("memberDTO");
	String[] zipcodes = dto.getZipcode().split("-");
%>


<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://pingendo.github.io/templates/blank/theme.css"
	type="text/css">
<style>
th {
	text-align: center;
}
</style>
<script>
	function check() {
		var name=infoform.name.value;
		var passwd1 = infoform.passwd1.value;
		var passwd2 = infoform.passwd2.value;
		var email = infoform.email.value;
		var addr1 = infoform.addr1.value;
		var addr2 = infoform.addr2.value;
		var ph1 = infoform.ph1.value;
		var ph2 = infoform.ph2.value;
		var ph3 = infoform.ph3.value;

		var forms = document.getElementById("infoform");

		if ((forms.name.value == "") || (forms.name.value.length <= 1)) {
			alert("이름을 입력하세요.");
			forms.name.focus();
			return false;
		}
		if (passwd1.length == 0) {
			alert("비밀번호를 입력하세요.");
			infoform.passwd1.focus();
			return false;
		}
		if (passwd1 != passwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			infoform.passwd2.value = "";
			infoform.passwd2.focus();
			return false;
		}
		if(email.length == 0){
			alert("이메일을 제대로 입력하세요.");
			joinform.email.focus();
			return false;
		}
		if((forms.zipcode1.value=="")||(forms.zipcode1.value.length<3)){
			alert("우편번호 앞의 3자리를 입력해 주세요.");
	      	forms.zipcode1.focus();
	        return false;
	 	}
	 	if((forms.zipcode2.value=="")||(forms.zipcode2.value.length<3)){
			alert("우편번호 뒤의 3자리 입력해 주세요.");
	      	forms.zipcode2.focus();
	        return false;
		}  
		if(addr1.length == 0){
			alert("집 주소를 입력하세요.");
			joinform.addr1.focus();
			return false;
		} 
		if(addr2.length == 0){
			alert("상세 주소를 입력하세요.");
			joinform.addr2.focus();
			return false;
		} 
		if(ph1.length == 0||ph2.length == 0||ph3.length == 0){
			alert("연락처를 입력하세요.");
			joinform.ph1.focus();
			return false;
		}

		return true;

	}

	function openZipcode(infoform) {
		var url = "Zipcode.me"
		open(url, "confirm", "toolbar=no,location=no,"
				+ "status=no,menubar=no," + "scrollbars=yes,resizable=no,"
				+ "width=410,height=400");
	}

	function gNumCheck() {
		if (event.keyCode >= 48 && event.keyCode <= 57) {
			return true;
		} else {
			event.returnValue = false;
		}
	}
	
	function out(){
		var Answer=confirm("회원탈퇴를 하시겠습니까?");
		if(Answer == true){
			location.href="./memberOut.me";
		}
	}
</script>
<body onload="f.id.focus()">

	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<img class="img-fluid d-block" src=img/0002.jpg">
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" align="center">
					<hr color="green" width="300">
					<h2>회 원 가 입&nbsp;</h2>
					<hr color="green" width="300">
					<form name="infoform" action="memberModify.me" onsubmit="return check()" method="post">
						<table class="table">
						<c:set var="dto" value="<%=dto %>"></c:set>
							<tbody>
								<tr>
									<th style="width: 200px;">이름</th>
									<td><input type="text" name="name" class="box"
										value="${dto.name}" ></td>
								</tr>

								<tr>
									<th>비밀번호</th>
									<td class="m3"><input type="password" name="passwd1"
										class="box"></td>
								</tr>
								<tr>
									<th>비밀번호확인</th>
									<td class="m3"><input type="password" name="passwd2"
										class="box"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td class="m3"><input type="text" name="email"
										value="${dto.email}" class="box"></td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td class="m3"><input type="text" name="zipcode1" size="6"
										onkeypress="gNumCheck()" mexlength="3"
										value="<%=zipcodes[0].trim()%>" />- <input type="text"
										name="zipcode2" size="6" onkeypress="gNumCheck()"
										mexlength="3" value="<%=zipcodes[1].trim()%>" /> &nbsp;&nbsp;
										<input type="button" class="btn btn-default" name="zipcode"
										value="우편번호 검색" onclick="openZipcode(this.form)" /></td>
								</tr>
								<tr>
									<th>집주소</th>
									<td class="m3"><input type="text" name="addr1" size="50" value="${dto.addr1 }" />
									</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td class="m3"><input type="text" name="addr2" size="50" value="${dto.addr2 }" />
									</td>
								</tr>

								<tr>
									<th>연락처</th>
									<td class="m3"><input type="text" name="ph1" class="box"
										size="3" maxlength="3" value="${dto.ph1}"> - <input type="text"
										name="ph2" class="box" size="4" maxlength="4" value="${dto.ph2 }"> - <input
										type="text" name="ph3" class="box" size="4" maxlength="4" value="${dto.ph3 }">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										class="btn btn-default" value="회원정보 수정"> <input
										type="button" class="btn btn-default"
										onclick="window.location='index.me'" value="취소">
										<input type="button" class="btn btn-default" value="회원탈퇴" name="bt" onclick="out();"></td>
										
								</tr>
							</tbody>
							
						</table>
					</form>
				</div>
				<div class="col-md-2"></div>
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