<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J" />
		<title>�V�lDB - Login</title>
		<meta name="keywords" content="�L�[���[�h" />
		<meta name="description" content="�T�C�g�̐���" />
		<meta http-equiv="Content-Language" content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="imagetoolbar" content="no" />
		<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/import.css" rel="stylesheet" type="text/css" media="all" />
		<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>
		<script>
		 function func(myCommand){
		//	 alert("start!:[" + myCommand + "]");
			 document.myForm.process.value=myCommand;
			 document.myForm.submit();
		 }

	 </script>
	 </head>
	<body>
		<div id="wrapper">
			<div id="headerBg" class="clearfix">
				<div id="header">
					<h1>2015�N�x�V�l���C<br />�D���ȏ��D���Ǘ����Ă݂悤</h1>
					<ul id="gNavi" class="clearfix">
					<form method="POST" name="myForm" action="<%= request.getContextPath() %>/G0002Control">
					���O�A�E�g���܂���<br>
						<input type="button" value="���O�A�E�g" onClick="func('logout');"/>
						<input type="hidden" name="employeeAuthority">
						<input type="hidden" name="process">
					</form>
					<button type="button"  onClick="location.href='/hobbyManager/view/G0001View.jsp'">�g�b�v�֖߂�</button>
					</ul>
				</div>
			</div>
			<div id="mainImgBox">
				<img src="<%= request.getContextPath() %>/view/img/mainimg.jpg" alt="TOP�摜" />
			</div>
			<div id="footer">
				<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
			</div>
		</div>
	</body>
</html>
