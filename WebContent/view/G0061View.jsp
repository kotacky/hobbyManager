<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�V�lDB - �f��o�^</title>
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
			<li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">�D�݈ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">�b�l�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">�f��ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�h���}�ꗗ</a></li>
            <li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�G���ꗗ</a></li>
            <li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">�����ꗗ</a></li>
            <li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>�f��o�^</h1>

<!-- ���b�Z�[�W�\��  -->

	<% try{ %>
		<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
		<% if("1".equals(insertFlag)){ %>
			<H2><% out.print("�o�^���������܂����B"); %></H2>
			<% }else if("0".equals(insertFlag)){ %>
			<H2><% out.print("�o�^�����s���܂����B"); %></H2>
			<% } %>
	<% }catch(NullPointerException insertException){ %>
	<% } %>

	<p><strong>�f��Ɋւ������o�^���ĉ������B</strong></p>

	<% //C�֓o�^��������𑗂� %>
	<form method="POST" action="<%=request.getContextPath() %>/G0061Control">
		�f��ID:
		<input type="text" name="movieId" placeholder="�f��ID" style="text-align:left;"><br>
		�f�於:
		<input type="text" name="movieName" placeholder="�f�於" style="text-align:left;"><br>
		���J��:
		<input type="text" name="releaseDate" placeholder="���J��" style="text-align:left;"><br>
		<input type="submit" value="�o�^">
		</form>
	<input type="button" value="�f��ꗗ" onClick="form.action=location.href='../../hobbyManager/view/G0060View.jsp'">
	<input type="button" value="���D�ꗗ"       onClick="form.action=location.href='../../hobbyManager/view/G0020View.jsp'">
</body>
</html>
