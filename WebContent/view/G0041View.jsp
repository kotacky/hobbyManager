<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�R���e���c�o�^</title>
		<meta name="keywords" content="�L�[���[�h" />
		<meta name="description" content="�T�C�g�̐���" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/default.js"></script>
	</head>
<body>
<div id="header">
			<ul id="gNavi" class="clearfix">
				<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�D�݈ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�R���e���c�ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
				<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
				<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			</ul>
		</div>

	<% try{ %>
		<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
		<% if("1".equals(insertFlag)){ %>
			<H2><% out.print("�o�^���������܂����B"); %></H2>
			<% }else if("0".equals(insertFlag)){ %>
			<H2><% out.print("�o�^�����s���܂����B"); %></H2>
			<% } %>
	<% }catch(NullPointerException insertException){ %>
	<% } %>

	<h1>�R���e���c�o�^</h1>

	<p><strong>�R���e���c�Ɋւ������o�^���ĉ������B</strong></p>

	<% //C�֓o�^��������𑗂� %>
	<form method="POST" action="<%=request.getContextPath() %>/G0041Control">
		�R���e���cID:
		<input type="text" name="contentsId" placeholder="ID" style="text-align:left;"><br>
		�R���e���c��:
		<input type="text" name="contentsName" placeholder="�R���e���c��" style="text-align:left;"><br>
		������:
		<input type="text" name="broadCast" placeholder="������" style="text-align:left;"><br>
		<input type="submit" value="�o�^">
		</form>

	<%-- ���j���[��ʂɖ߂鏈�� --%>
	<input type="button" value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
	<input type="button" value="�R���e���c�ꗗ" onClick="form.action=location.href='../../hobbyManager/view/G0040View.jsp'">
	<input type="button" value="���D�ꗗ"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
