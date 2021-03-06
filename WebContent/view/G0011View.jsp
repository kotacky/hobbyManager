<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>新人DB - 社員登録</title>
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
			int year = new Date(Time.birthday.value).subString(0, 3);
			int month = new Date(Time.birthday.value).subString(5, 6);
			int day = new Date(Time.birthday.value).subString(8, 9);

			int birthDay = year + month + day ;

			birthDate = birthDay.toString();

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

	<h1>社員新規登録</h1>


<%-- Cへ登録する条件を送る --%>
	<form method="POST" action="<%=request.getContextPath() %>/G0011Control" onsubmit="return formCheck(this);">
		社員ID:
		<input type="text" name="employeeId" placeholder="0000" required>（必須）<br>
		姓:
		<input type="text" name="employeeFamilyName" placeholder="姓" required>（必須）<br>
		名:
		<input type="text" name="employeeFirstName" placeholder="名" required>（必須）<br>
		姓(ふりがな):
		<input type="text" name="familyNameRead" placeholder="ふりがな" required>（必須）<br>
		名(ふりがな):
		<input type="text" name="firstNameRead" placeholder="ふりがな" required>（必須）<br>
		生年月日:
		<input type="date" name="birthDate" ><br>
		出身地:
		<input type="text" name="employeeFrom" placeholder="○○県"><br>
		血液型:
		<input type="text" name="employeeBloodType" placeholder="××型"><br>
		権限:
		<select name="employeeAuthority">
			<option value="00">00:管理者
			<option value="01" selected>01:一般職
		</select><br>
		パスワード:
		<input type="password" name="employeePassword" placeholder="パスワード" required>（必須）<br>
		<input type="submit" value="登録"  onClick="check()">
		<input type="hidden" name="employeeAuthority" value="<%= session.getAttribute("employeeAuthority") %>">
		<input type="button" value="戻る" onClick="history.go(-1)">
	</form>
</body>
</html>
