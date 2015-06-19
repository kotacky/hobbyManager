<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>女優登録</title>
		<link rel="stylesheet" href="view.css">
				<style>
			*{
				text-align : center;
			}
		</style>
	</head>
<body>
	<h1>女優新規登録</h1>
<%--Cへ登録する条件を送る --%>

	<form method="POST" name="Myform" action="<%=request.getContextPath() %>/G0021Control">
		女優ID:
		<input type="text" name="actressId"><br>
		姓・名:
		<input type="text" name="actressName"><br>

<!-- 会社を登録のために選択 -->

<%
	List<HashMap<String, String>> companyList = (List<HashMap<String, String>>)request.getAttribute("companyList");
	String[] sel = null;
	if (companyList == null) {
		sel = new String[0];
	} else {
		sel = new String[companyList.size()];
	}
%>

<SELECT NAME="lang">
<option>
<% for(int i = 0 ;i<companyList.size(); i++){ %>
<option value="<%= companyList.get(i).get("companyList") %>">
<% } %>
<option value="sel1">ホリプロ
<option value="sel2">フォスター
<option value="sel3">Sweet Power
<option value="sel4">FLaMme
<option value="sel5">劇団東俳
<option value="sel6">ホリプロ
<option value="sel7">レプロエンターテイメント
<option value="sel8">スターダストプロモーション
<option value="sel9">オスカー

</SELECT>

<input type="hidden" name="hidden1">

<br><br><br>
コンテンツ


<!-- コンテンツを登録のために3つ選択 -->

<p>選択肢から3つ選択してください。<br />
コンテンツは登録から新しく登録することが出来ます</p>

<%
//ダミーのデータ
//HashMap<String,String> actressList = new HashMap<String,String>();
	//actressList.put("actressId", "201");
	//actressList.put("actressName", "綾瀬 はるか");
	//actressList.put("companyName", "ホリプロ");
	//actressList.put("companyAddress", "東京");

	List<HashMap<String, String>> contentsList = (List<HashMap<String, String>>)request.getAttribute("contentsList");
	String[] check = null;
		if (contentsList == null) {
			check = new String[0];
		} else {
			check = new String[contentsList.size()];
		}
%>

<% if(contentsList != null){ %>

	<% for(int i = 0; i < contentsList.size(); i++){ %>
		<input type="checkBox" name="contentsList" value="<%= contentsList.get(i).get("contentsId") %>" />
		<%  out.print(contentsList.get(i).get("contentesName")); %>

	<% } %>
<% } %>

		<input type=submit value="登録">
	</form>


<!-- メニュー画面に戻る処理 -->
		<input type=button value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>

<!-- コミットテスト　越湖　片山 -->