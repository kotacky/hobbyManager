<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �R���e���c�ꗗ</title>
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
		 function func(MyCommand){
		//	 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }

		function init() {
			if (document.MyForm.contentsId.value == "null") {
				document.MyForm.contentsId.value = "";
			}
			if (document.MyForm.contentsName.value == "null") {
				document.MyForm.contentsName.value = "";
			}
			if (document.MyForm.broadCast.value == "null") {
				document.MyForm.broadCast.value = "";
			}
		}
	 </script>
</head>

<body onload="init();">
	<div id="header">
		<ul id="gNavi" class="clearfix">
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�D�݈ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�R���e���c�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>�R���e���c�ꗗ</h1>

<%-- ���b�Z�[�W�̕\�� --%>

	<% try{ %>
		<% String deleteFlag = request.getAttribute("deleteFlag").toString(); %>
			<% if("1".equals(deleteFlag)){ %>
			<H2><% out.print("�폜���������܂����B"); %></H2>
			<% }else if("0".equals(deleteFlag)){ %>
			<H2><% out.print("�폜�����s���܂����B"); %></H2>
		<% } %>
	<% }catch(NullPointerException deleteException){ %>
	<% } %>

	<% try{ %>
		<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
			<% if("1".equals(updateFlag)){ %>
			<H2><% out.print("�X�V���������܂����B"); %></H2>
			<% }else if("0".equals(updateFlag)){ %>
			<H2><% out.print("�X�V�����s���܂����B"); %></H2>
			<% } %>
		<% }catch(NullPointerException updateException){ %>
		<% } %>


<%-- ���X�g�̎擾 --%>
<%
	//	    HashMap<String,String> contentsList = new HashMap<String,String>();
	//			contentsList.put("contents_id", "401");
	//			contentsList.put("contents_name", "���d�̍�");
	//			contentsList.put("summary", "��̓h���}");
List<HashMap<String,String>> contentsList = (List<HashMap<String,String>>)request.getAttribute("contentsList");
String disabled = "disabled";
if(contentsList != null){
     disabled = "";
}
%>


<% //C�֌�����������𑗂� %>
	<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0040Control">
		�R���e���cID:
		<input type="text" id="contentsId" name="contentsId" placeholder="�R���e���cID" value="<%= request.getParameter("contentsId") %>" style="text-align: left;">
		�R���e���c��:
		<input type="text" id="contentsName" name="contentsName" placeholder="�R���e���c��" value="<%= request.getParameter("contentsName") %>" style="text-align: left; ">
		������:
		<input type="text" id="broadCast" name="broadCast" placeholder="������" value="<%= request.getParameter("broadCast") %>" style="text-align: left; ">
		<input type="button" value="����" onClick="func('select');" /><br />
		<input type="button" value="�V�K�o�^" onClick="form.action=location.href='../../hobbyManager/view/G0041View.jsp';">
		<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
		<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
		<br style="clear" />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

		<%-- �e�[�u���̕\��--%>
		<table class="brwsr1">
			<thead class="scrollHead">
				<tr>
					<Th class="r0">�I��</Th>
					<Th class="r1">�Ј�ID</Th>
					<Th class="r2">�R���e���c��</Th>
					<Th class="r3">������</Th>

				</tr>
			</thead>
			<tbody class="scrollBody">
<% if(contentsList != null){ %>
<% for(int i = 0; i < contentsList.size(); i++){ %>
					<Tr>
						<Th class="r0"><input type="radio" name="radioButton" value="<%= contentsList.get(i).get("contentsId") %>"></Th>
						<Td class="r1"><% out.print(contentsList.get(i).get("contentsId")); %></Td>
						<Td class="r2"><% out.print(contentsList.get(i).get("contentsName")); %></Td>
						<Td class="r3"><% out.print(contentsList.get(i).get("broadCast")); %></Td>

					</Tr>
<% } %>
<% } %>
			</tbody>
		</table>
		<input type="hidden" name="processDiv">
	</form>
<%-- ���j���[��ʂɖ߂鏈�� --%>
	<input type="button" value="���j���[��" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';return true">
	<div id="footer">
		<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
	</div>
</body>
</html>