<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �Ј��ꗗ</title>
	<meta name="keywords" content="�L�[���[�h" />
	<meta name="description" content="�T�C�g�̐���" />
	<meta http-equiv="Content-Language" content="ja" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="imagetoolbar" content="no" />
	<link href="<%= request.getContextPath() %>/view/css/index.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%= request.getContextPath() %>/view/css/share.css" rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="<%= request.getContextPath() %>/view/js/default.js"></script>

	<script type="text/javascript">

		function init() {
			if (document.myForm.employeeId.value == null) {
				document.myForm.employeeId.value = "";
			}
			if (document.myForm.employeeFamilyName.value == null) {
				document.myForm.employeeFamilyName.value = "";
			}
			if (document.myForm.employeeFirstName.value == null) {
				document.myForm.employeeFirstName.value = "";
			}
		}
	 </script>
	 <style type="text/css">

		html, body{
	    height:100%;
	    text-align: center;
		}

		#footer{
		width: 100%;
	    position:absolute;
	    bottom:0;
		}

	 </style>
</head>
<body>
	<div id="wrapper">
		<h1>�X�V��</h1>

<%-- ���b�Z�[�W�̕\�� --%>

			<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
			<h2><% out.println("�X�V���������܂����B"); %></h2>
			<p><strong><% out.println("�������g�̏����X�V�����ꍇ�͍ēx���O�C�����Ă��������B"); %></strong></p>

			<br />
			<button type="button" onClick="location.href='../hobbyManager/view/G0002View.jsp'">���O�A�E�g</button>


<%-- ���X�g�̎擾 --%>

<%
List<HashMap<String,String>> employeeList = (List<HashMap<String,String>>)request.getAttribute("employeeList");
String message = (String)request.getAttribute("message");
String updateDisabled = "disabled";
String createDisabled = "disabled";
String disabled = "disabled";%>
<% try{ %>
<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
<% if((employeeList != null) && ("00".equals(employeeAuthority))){%>
	<% disabled = "";%>
<% } %>
<% if(employeeList != null){%>
	<% updateDisabled = "";%>
<% } %>
<% if("00".equals(employeeAuthority)){%>
	<% createDisabled = "";%>
<% } %>
<% }catch(NullPointerException deleteException){ %>
<% } %>
<%if (message == null) {
		message = "";
	}%>

		<div id="footer">
			<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
		</div>
	</div>
</body>
</html>
