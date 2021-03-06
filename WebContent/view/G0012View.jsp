<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 社員更新</title>
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
	<script type="text/javascript">

	function formCheck(Time){
		var now = new Date();
		var checkday = new Date(Time.birthDate.value);
		if(now.getTime() < checkday.getTime()){
			window.alert(Time.birthDate.value + 'は、今日より後の日付です！\n入力しなおしてください。');

		}else {
			alert(Time.birthDate.value + 'は、	問題ありませんでした。');

			//var birthDate = checkday.replace(/-/g,"");

			/*
			var year = now.subString(0, 3);
			var month = now.subString(5, 6);
			var day = now.subString(8, 9);

			var birthDay = year + month + day ;
			*/
			}

		return false;

		}

	</script>
</head>
<body>
		<div id="header">
			<ul id="gMenu" class="clearfix">
				  <li><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">トップ</a></li>
				  <li><a>基本メニュー</a>
				    <ul>
				      <li><a href="<%= request.getContextPath() %>/view/G0010View.jsp" title="">社員一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0020View.jsp" title="">女優一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0110View.jsp" title="">アーティスト一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0080View.jsp" title="">好み一覧</a></li>
				    </ul>
				  </li>
				  <li><a>女優コンテンツ</a>
				    <ul>
				      <li><a href="<%= request.getContextPath() %>/view/G0060View.jsp" title="">映画一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0050View.jsp" title="">ドラマ一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0070View.jsp" title="">ＣＭ一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0040View.jsp" title="">雑誌一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0120View.jsp" title="">楽曲一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0090View.jsp" title="">ジャンル一覧</a></li>
				    </ul>
				  </li>
				  <li><a>所属・出演</a>
				    <ul>
				      <li><a href="<%= request.getContextPath() %>/view/G0100View.jsp" title="">テレビ局一覧</a></li>
				      <li><a href="<%= request.getContextPath() %>/view/G0030View.jsp" title="">所属会社一覧</a></li>
				    </ul>
				  </li>
				  <li><a><% out.print(session.getAttribute("employeeFirstName")); %></a>
				    <ul>
				      <li><a href="<%= request.getContextPath() %>/view/G0002View.jsp" title="">ログアウト</a></li>
				    </ul>
				  </li>
			</ul>
		</div>

<h1>更新情報入力</h1>

<%-- リストの取得 --%>
<%
	//HashMap<String,String> EmployeeList = new HashMap<String,String>();
		//EmployeeList.put("employeeId", "122");
		//EmployeeList.put("employeeFamilyname", "金井");
		//EmployeeList.put("employeeFirstname", "才");
		//EmployeeList.put("birthDate", "19920811");
		//EmployeeList.put("employeeFrom", "東京都");
		//EmployeeList.put("employeeBloodType", "A型");%>

<%
	List<HashMap<String, String>> employeeList = (List<HashMap<String, String>>)request.getAttribute("employeeList");
%>

<%-- リストからデータを取得し、編集を行い、更新するデータを送る --%>

	<form method="POST" action="<%=request.getContextPath() %>/G0012Control" onsubmit="return formCheck(this);">
		社員ID:
		<input type="text" name="employeeId" readonly value=<% out.print(employeeList.get(0).get("employeeId")); %> required>（必須）<br>
		姓:
		<input type="text" name="employeeFamilyName" value=<% out.print(employeeList.get(0).get("employeeFamilyName")); %> required>（必須）<br>
		名:
		<input type="text" name="employeeFirstName" value=<% out.print(employeeList.get(0).get("employeeFirstName")); %> required>（必須）<br>
		姓(ふりがな):
		<input type="text" name="familyNameRead" value=<% out.print(employeeList.get(0).get("familyNameRead")); %> required>（必須）<br>
		名(ふりがな):
		<input type="text" name="firstNameRead" value=<% out.print(employeeList.get(0).get("firstNameRead")); %> required>（必須）<br>
		生年月日:
		<input type="date" name="birthDate" value=<% out.print(employeeList.get(0).get("employeeBirthDate")); %>><br>
		出身地:
		<input type="text" name="employeeFrom" value=<% out.print(employeeList.get(0).get("employeeFrom")); %>><br>
		血液型:
		<input type="text" name="employeeBloodType" value=<% out.print(employeeList.get(0).get("employeeBloodType")); %>><br>
		権限:
		<select name="employeeAuthority">
			<option value="00">00:管理者
			<option value="01" selected>01:一般職
		</select><br>
		パスワード:
		<input type="password" name="employeePassword" required>（必須）<br>
		<input type="submit" value="更新">
		<input type="button" value="戻る" onClick="history.go(-1)">
		<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
	</form>
</body>
</html>