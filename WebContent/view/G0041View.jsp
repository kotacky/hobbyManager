<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>コンテンツ登録</title>
</head>
<body>
<H1>コンテンツ登録</H1>
<% //Cへ登録する条件を送る %>
<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
コンテンツID:
<input type="text" name="contents__id"><br>
コンテンツ名:
<input type="text" name="contents_name"><br>
概要:
<input type="text" name="summary"><br>
<input type=submit value="登録">
</form>
<%-- メニュー画面に戻る処理 --%>
<input type=button value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>
