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
    function check(){
    			if (f.id.value==""){
    				alert("아이디를 입력하세요!!");
    				f.id.focus();
    				return;
    			}
    			if (!f.passwd.value){
    				alert("비밀번호를 입력하세요!!");
    				f.pwd.focus();
    				return;
    			}
    			document.f.submit();
    		}
  </script>
</head>

<body onload="f.id.focus()">
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
          <img class="img-fluid d-block" src="E:\포트폴리오 리눅스+jsp+톰캣+오라클\새 폴더\0002.jpg"> </div>
        <div class="col-md-4"></div>
      </div>
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" align="center">
          <hr color="green" width="300">
          <h2>회 원 가 입&nbsp;</h2>
          <hr color="green" width="300">
          <form name="check" action="memberCheckOk.me" method="post">
            <table class="table">
              <tbody>
                <tr>
                  <th style="width:200px;">이름</th>
                  <td>
                    <input type="text" name="name" class="box" value="${my name}" readonly=""> </td>
                </tr>
                <tr>
                  <th>주민번호</th>
                  <td>
                    <input type="text" name="ssn1" class="box" maxlength="6" readonly="" value="${my ssn1}"> -
                    <input type="password" name="ssn2" class="box" maxlength="7" value="${my ssn2}" readonly=""> </td>
                </tr>
                <tr>
                  <th>아이디</th>
                  <td class="m3">
                    <input type="text" name="id" class="box"> </td>
                </tr>
                <tr>
                  <th>비밀번호</th>
                  <td class="m3">
                    <input type="password" name="passwd" class="box"> </td>
                </tr>
                <tr>
                  <th>이메일</th>
                  <td class="m3">
                    <input type="text" name="email" class="box"> </td>
                </tr>
                <tr>
                  <th>연락처</th>
                  <td class="m3">
                    <input type="text" name="hp1" class="box" size="3" maxlength="3"> -
                    <input type="text" name="hp2" class="box" size="4" maxlength="4"> -
                    <input type="text" name="hp3" class="box" size="4" maxlength="4"> </td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                    <input type="submit" value="회원가입">
                    <input type="reset" value="취소"> </td>
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