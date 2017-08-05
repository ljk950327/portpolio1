<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
function check(){
	var id=joinform.id.value;
	var password1=joinform.passwd.value;
	var password2=joinform.passwd2.value;	
	var email=joinform.email.value;
	var addr1=joinform.addr1.value;
	var addr2=joinform.addr2.value;
	var ph1=joinform.ph1.value;
	var ph2=joinform.ph2.value;
	var ph3=joinform.ph3.value;
	
	var forms = document.getElementById("joinform");
	if(id.length == 0){
		alert("아이디를 입력하세요.");
		joinform.id.focus();
		return false;
	}
	if(password1.length == 0){
		alert("비밀번호를 입력하세요.");
		joinform.passwd.focus();
		return false;
	} 
	if(password1 != password2){
		alert("비밀번호가 일치하지 않습니다.");
		joinform.passwd.value="";
		joinform.passwd2.value="";
		joinform.passwd2.focus();
		return false;
	}
	if(email1.length == 0){
		alert("이메일을 제대로 입력하세요.");
		joinform.email.focus();
		return false;
	}
	if((forms.MEMBER_ZIPCODE1.value=="")||(forms.MEMBER_ZIPCODE1.value.length<3)){
		alert("우편번호 앞의 3자리를 입력해 주세요.");
      	forms.zipcode1.focus();
        return false;
 	}
 	if((forms.MEMBER_ZIPCODE2.value=="")||(forms.MEMBER_ZIPCODE2.value.length<3)){
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

function openConfirmId(joinform){			
	var id=joinform.id.value;
	var url="memberIDConfirm.me?id="+joinform.id.value;
	
	if(id.length == 0){
		alert("아이디를 입력하세요.");
		joinform.id.focus();
		return false;
	}
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=400,height=200");
}

function openZipcode(joinform){			
	var url="Zipcode.me"
	open(url, "confirm", "toolbar=no,location=no,"
						+"status=no,menubar=no,"
						+"scrollbars=yes,resizable=no,"
						+"width=410,height=400");
}	

function gNumCheck(){
	if(event.keyCode >=48 && event.keyCode <=57) {
		return true;
	}else{
		event.returnValue=false;	
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
					<form name="joinform" action="memberCheckOk.me" method="post">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 200px;">이름</th>
									<td><input type="text" name="name" class="box"
										value="${name}" readonly></td>
								</tr>
								<tr>
									<th>주민번호</th>
									<td><input type="text" name="ssn1" class="box"
										maxlength="6" readonly value="${ssn1}"> - <input
										type="password" name="ssn2" class="box" maxlength="7"
										value="${ssn2}" readonly></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td class="m3">
										<input type="text" name="id" class="box">
										<input type="button" class="btn btn-default" name="confirm_id" value="중복확인"
										onclick="openConfirmId(this.form)" /></td>
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
									<td class="m3"><input type="text" name="email" class="box">
									</td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td class="m3"><input type="text" name="zipcode1" size="6"
										onkeypress="gNumCheck()" mexlength="3" />- <input type="text"
										name="zipcode2" size="6" onkeypress="gNumCheck()"
										mexlength="3" /> &nbsp;&nbsp; <input type="button"
										class="btn btn-default" name="zipcode" value="우편번호 검색"
										onclick="openZipcode(this.form)" /></td>
								</tr>
								<tr>
									<th>집주소</th>
									<td class="m3"><input type="text" name="addr1" size="50" />
									</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td class="m3"><input type="text" name="addr2" size="50" />
									</td>
								</tr>

								<tr>
									<th>연락처</th>
									<td class="m3"><input type="text" name="hp1" class="box"
										size="3" maxlength="3"> - <input type="text"
										name="hp2" class="box" size="4" maxlength="4"> - <input
										type="text" name="hp3" class="box" size="4" maxlength="4">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit" class="btn btn-default"
										value="회원가입"> <input type="button" class="btn btn-default" onclick="windows.location='index.me'" value="취소">
									</td>
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