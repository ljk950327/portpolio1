<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	String msg = (String)request.getAttribute("msg");
		String url = (String)request.getAttribute("url");%>    
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>