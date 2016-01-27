<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 女優一覧</title>
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
		 function func(myCommand){
		//	 alert("start!:[" + myCommand + "]");
			 document.myForm.process.value=myCommand;
			 document.myForm.submit();
		 }

		function init() {
			if (document.myForm.actressId.value == null) {
				document.myForm.actressId.value = "";
			}
			if (document.myForm.actressName.value == null) {
				document.myForm.actressName.value = "";
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
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">ログアウト</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
			<li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト一覧</a></li>

		</ul>
	</div>

	<h1>女優一覧</h1>

<%-- メッセージの表示 --%>

	<% try{ %>
		<% String deleteFlag = request.getAttribute("deleteFlag").toString(); %>
		<% if("1".equals(deleteFlag)){ %>
		<h2><% out.print("削除が完了しました。"); %></h2>
		<% }else if("0".equals(deleteFlag)){ %>
		<h2><% out.print("削除が失敗しました。"); %></h2>
		<% } %>
	<% }catch(NullPointerException deleteException){ %>
	<% } %>

	<% try{ %>
		<% String insertFlag = request.getAttribute("insertFlag").toString(); %>
		<% if("1".equals(insertFlag)){ %>
			<h2><% out.print("登録が完了しました。"); %></h2>
			<% }else if("0".equals(insertFlag)){ %>
			<h2><% out.print("登録が失敗しました。"); %></h2>
			<% }else if("2".equals(insertFlag)){ %>
			<h2><% out.print("既に登録されています。"); %></h2>
			<% } %>
	<% }catch(NullPointerException insertException){ %>
	<% } %>


	<% try{ %>
		<% String updateFlag = request.getAttribute("updateFlag").toString(); %>
			<% if("1".equals(updateFlag)){ %>
				<h2><% out.print("更新が完了しました。"); %></h2>
				<% }else if("0".equals(updateFlag)){ %>
				<h2><% out.print("更新が失敗しました。"); %></h2>
				<% } %>
	<% }catch(NullPointerException updateException){ %>
	<% } %>
<%-- リストの取得 --%>
<%
	//HashMap<String,String> actressList = new HashMap<String,String>();
		//actressList.put("actressId", "201");
		//actressList.put("actressName", "綾瀬 はるか");
		//actressList.put("companyName", "ホリプロ");
		//actressList.put("companyAddress", "東京");
	List<HashMap<String,String>> actressList = (List<HashMap<String,String>>)request.getAttribute("actressList");
	//該当データがないメッセージを受け取る
	String message = (String)request.getAttribute("message");
	String createDisabled = "disabled";
	String disabled = "disabled";%>
	<% try{ %>
	<% String employeeAuthority = session.getAttribute("employeeAuthority").toString(); %>
	<% if((actressList != null) && ("00".equals(employeeAuthority))){%>
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

<%-- Cへ検索する条件を送る --%>
	<form method="POST" name="myForm" action="<%= request.getContextPath() %>/G0020Control">
			女優ID:
			<input type="text" id="actressId" name="actressId" placeholder="女優ID" style="text-align: left;">
			女優名:
			<input type="text" id="actressName" name="actressName" placeholder="女優名" style="text-align: left; ">
			<input type="button" value="検索" onClick="func('select');" /><br />
		<input type="button" value="新規登録" onClick="func('insert');" <%= createDisabled %> />
		<input type="button" value="更新" onClick="func('update');" <%= disabled %> />
		<input type="button" value="削除" onClick="func('delete');" <%= disabled %> />
		<div style="color:red;"><%= message %></div>

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
						<Th class="r1">女優ID</Th>
						<Th class="r2">女優名</Th>
						<Th class="r3">所属会社</Th>
					</tr>
				</thead>
				<tbody class="scrollBody">
<% if(actressList != null){ %>
	<% for(int i = 0; i < actressList.size(); i++){ %>
					<Tr>
						<Th class="r0"><input type="radio" name="radioButton" value="<%= actressList.get(i).get("actressId") %>"></Th>
						<Td class="r1"><% out.print(actressList.get(i).get("actressId")); %></Td>
						<Td class="r2"><% out.print(actressList.get(i).get("actressName")); %></Td>


						<Td class="r3"><% out.print(actressList.get(i).get("companyName")); %></Td>
					</Tr>
<% } %>
<% } %>
				</tbody>
			</table>
			<input type="hidden" name="process">
			<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">

	</form>
	<div id="footer">
		<p id="copyright">Copyright (c) WISS1 Inc. All Rights Reserved.</p>
	</div>
</body>
</html>