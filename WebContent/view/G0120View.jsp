<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - �y�Ȉꗗ</title>
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
	<script>
		 function func(MyCommand){
		//	 alert("start!:[" + MyCommand + "]");
			 document.MyForm.processDiv.value=MyCommand;
			 document.MyForm.submit();
		 }

		function init() {
			if (document.MyForm.musicId.value == null) {
				document.MyForm.musicId.value = "";
			}
			if (document.MyForm.musicName.value == null) {
				document.MyForm.musicName.value = "";
			}
		if (document.MyForm.artistName.value == null) {
			document.MyForm.artistName.value = "";
		}
		}

	 </script>
</head>

<body onload="init();">
	<div id="header">
		<ul id="gNavi" class="clearfix">
			<li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">�D�݈ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">���D�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">�b�l�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">�f��ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">�h���}�ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">�G���ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">������Јꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">�Ј��ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">�W�������ꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">�e���r�ǈꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">�y�Ȉꗗ</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">�A�[�e�B�X�g�ꗗ</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>�y�Ȉꗗ</h1>

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
		<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
		<% if("1".equals(insertFlag)){ %>
			<H2><% out.print("�o�^���������܂����B"); %></H2>
			<% }else if("0".equals(insertFlag)){ %>
			<H2><% out.print("�o�^�����s���܂����B"); %></H2>
			<% }else if("2".equals(insertFlag)){ %>
			<H2><% out.print("���ɓo�^����Ă��܂��B"); %></H2>
			<% } %>
	<% }catch(NullPointerException insertException){ %>
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
List<HashMap<String,String>> musicList = (List<HashMap<String,String>>)request.getAttribute("musicList");
String createDisabled = "disabled";
String disabled = "disabled";
String message = (String)request.getAttribute("message");%>
<% try{ %>
<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
<% if((musicList != null) && ("00".equals(employeeAuthority))){%>
	<% disabled = "";%>
<% } %>
<% if("00".equals(employeeAuthority)){%>
	<% createDisabled = "";%>
<% } %>
<% }catch(NullPointerException deleteException){ %>
<% } %>
<%if (message == null) {
	message = "";
}%>


<% // C�֌�����������𑗂� --%>
	<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0120Control">
			�y��ID:
			<input type="text" id="musicId" name="musicId" placeholder="�y��ID" style="text-align: left;">
			�y�Ȗ�:
			<input type="text" id="musicName" name="musicName" placeholder="�y�Ȗ�" style="text-align: left;">
			<div>
			�A�[�e�B�X�g��:
			<input type="text" id="artistName" name="artistName" placeholder="�A�[�e�B�X�g��" style="text-align: left; ">
			<input type="button" value="����" onClick="func('select');" /><br />
			</div>
		<input type="button" value="�V�K�o�^" onClick="func('insert');" <%= createDisabled %> />
		<input type="button" value="�X�V" onClick="func('update');" <%= disabled %> />
		<input type="button" value="�폜" onClick="func('delete');" <%= disabled %> />
		<div style="color:red;"><%= message %></div>
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
					<Th class="r1">�y��ID</Th>
					<Th class="r2">�y�Ȗ�(�̎�����)</Th>
					<Th class="r3">�A�[�e�B�X�g��</Th>
					</tr>
			</thead>
			<tbody class="scrollBody">
<% if(musicList != null){ %>
	<% for(int i = 0; i < musicList.size(); i++){ %>
		<Tr>
			<Th class="r0"><input type="radio" name="radioButton" value="<%= musicList.get(i).get("musicId") %>"></Th>
			<Td class="r1"><% out.print(musicList.get(i).get("musicId")); %></Td>
			<Td class="r2"><a href="javascript:;" onclick="window.open('http://www.kget.jp/search/index.php?c=0&r=&t='+encodeURI('<% out.print(musicList.get(i).get("musicName")); %>'));return false;"><% out.print(musicList.get(i).get("musicName")); %></a></Td>
			<Td class="r3"><% out.print(musicList.get(i).get("artistName")); %></Td>
		</Tr>
	<% } %>
<% } %>


			</tbody>
		</table>
		<input type="hidden" name="processDiv">
		<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
	</form>
	<div id="footer">
		<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
	</div>
</body>
</html>