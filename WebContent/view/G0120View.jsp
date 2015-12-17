<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>

	<meta charset="Windows-31J">
	<title>新人DB - 楽曲一覧</title>
	<meta name="keywords" content="キーワード" />
	<meta name="description" content="サイトの説明" />
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
			<li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">好み一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">ＣＭ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">映画一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">ドラマ一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">雑誌一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト</a></li>
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>楽曲一覧</h1>

<%-- メッセージの表示 --%>

	<% try{ %>
		<% String deleteFlag = request.getAttribute("deleteFlag").toString(); %>
		<% if("1".equals(deleteFlag)){ %>
		<H2><% out.print("削除が完了しました。"); %></H2>
		<% }else if("0".equals(deleteFlag)){ %>
		<H2><% out.print("削除が失敗しました。"); %></H2>
		<% } %>
	<% }catch(NullPointerException deleteException){ %>
	<% } %>

	<% try{ %>
		<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
		<% if("1".equals(insertFlag)){ %>
			<H2><% out.print("登録が完了しました。"); %></H2>
			<% }else if("0".equals(insertFlag)){ %>
			<H2><% out.print("登録が失敗しました。"); %></H2>
			<% }else if("2".equals(insertFlag)){ %>
			<H2><% out.print("既に登録されています。"); %></H2>
			<% } %>
	<% }catch(NullPointerException insertException){ %>
	<% } %>


	<% try{ %>
		<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
			<% if("1".equals(updateFlag)){ %>
				<H2><% out.print("更新が完了しました。"); %></H2>
				<% }else if("0".equals(updateFlag)){ %>
				<H2><% out.print("更新が失敗しました。"); %></H2>
				<% } %>
	<% }catch(NullPointerException updateException){ %>
	<% } %>

<%-- リストの取得 --%>
<%
	//	    HashMap<String,String> contentsList = new HashMap<String,String>();
	//			contentsList.put("contents_id", "401");
	//			contentsList.put("contents_name", "八重の桜");
	//			contentsList.put("summary", "大河ドラマ");
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


<% // Cへ検索する条件を送る --%>
	<form method="POST" name="MyForm" action="<%= request.getContextPath() %>/G0120Control">
			楽曲ID:
			<input type="text" id="musicId" name="musicId" placeholder="楽曲ID" style="text-align: left;">
			楽曲名:
			<input type="text" id="musicName" name="musicName" placeholder="楽曲名" style="text-align: left;">
			<div>
			アーティスト名:
			<input type="text" id="artistName" name="artistName" placeholder="アーティスト名" style="text-align: left; ">
			<input type="button" value="検索" onClick="func('select');" /><br />
			</div>
		<input type="button" value="新規登録" onClick="func('insert');" <%= createDisabled %> />
		<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
		<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />
		<div style="color:red;"><%= message %></div>
		<br style="clear" />
<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

		<%-- テーブルの表示--%>
		<table class="brwsr1">
			<thead class="scrollHead">
				<tr>
					<Th class="r0">選択</Th>
					<Th class="r1">楽曲ID</Th>
					<Th class="r2">楽曲名</Th>
					<Th class="r3">アーティスト名</Th>
					</tr>
			</thead>
			<tbody class="scrollBody">
<% if(musicList != null){ %>
	<% for(int i = 0; i < musicList.size(); i++){ %>
		<Tr>
			<Th class="r0"><input type="radio" name="radioButton" value="<%= musicList.get(i).get("musicId") %>"></Th>
			<Td class="r1"><% out.print(musicList.get(i).get("musicId")); %></Td>
			<Td class="r2"><% out.print(musicList.get(i).get("musicName")); %></Td>
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