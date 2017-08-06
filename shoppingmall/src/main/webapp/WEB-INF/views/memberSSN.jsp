<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://pingendo.github.io/templates/blank/theme.css" type="text/css">
  <style>
    th {
      text-align: center;
    }
  </style>
  <script type="text/javascript">

	function check() {
		if (checkform.name.value == "") {
			alert("이름을 입력하세요!!");
			checkform.name.focus();
			return false;
		}
		if (checkform.ssn1.value=="") {
			alert("주민번호를 입력하세요!!");
			checkform.ssn1.focus();
			return false;
		}
		if (checkform.ssn2.value=="") {
			alert("주민번호를 입력하세요!!");
			checkform.ssn2.focus();
			return false;
		}
		
		return true;
	}
	
	function gNumCheck(){
		if(event.keyCode >=48 && event.keyCode <=57) {
			return true;
		}else{
			event.returnValue=false;	
		}
	}		
	
</script>
  
</head>

<body>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
          <img class="img-fluid d-block" src="img/0002.jpg"> </div>
        <div class="col-md-4"></div>
      </div>
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" align="center">
          <hr color="green" width="300">
          <h2>회 원 가 입 유 무</h2>
          <hr color="green" width="300">
          <form name="checkform" action="memberCheck.me" method="post" onsubmit="return check()">
            <table class="table">
              <tbody>
                <tr>
                  <th style="width:200px;">이름</th>
                  <td>
                    <input type="text" name="name" class="box"> </td>
                </tr>
                <tr>
                  <th>주민번호</th>
                  <td>
                    <input type="text" onkeypress="gNumCheck()" name="ssn1" class="box" maxlength="6"> -
                    <input type="password" onkeypress="gNumCheck()" name="ssn2" class="box" maxlength="7"> </td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                    <input type="submit" class="btn btn-default" value="조회" > 
                    <input type="button" class="btn btn-default" value="취소" onclick="window.location.href='index.me'"> 
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
  <script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
</body>

</html>