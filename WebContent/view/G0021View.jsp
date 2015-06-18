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

		<script language="JavaScript">

			// チェックボックスに使用している名前
			chn = new Array("ch1","ch2","ch3","ch4","ch5","ch6");
			 chc = 3; // チェックできる数

			// チェックボックスにチェックできる数を制限する
			function chBx(cn){
			   cnt = 0;
			   for(i=0; i<chn.length; i++) {
			     if(document.Myform.elements[chn[i]].checked) cnt++;
			   }

			   if(cnt > chc) {
			     alert("チェックできる項目は" + chc + "個までです");
			     document.Myform.elements[cn].checked = false;
				   }
				}
		</script>
	</head>
<body>
	<h1>女優新規登録</h1>
<%--Cへ登録する条件を送る --%>

<% List<HashMap<String, String>> conpanyList = (List<HashMap<String, String>>)request.getAttribute("conpanyList"); %>
<% String[] sel = new String[conpanyList.size()]; %>

	<form method="Post" name="Myform" action="<%=request.getContextPath() %>/G0021Control">
		女優ID:
		<input type="text" name="actress_id"><br>
		姓・名:
		<input type="text" name="actress_family_name"><br>

<!-- 会社を登録のために選択 -->

<SELECT NAME="lang" SIZE="3" MULTIPLE="true">
	<option>
	<% for(int i = 0 ;i<companyList.size(); i++){ %>
	<option value="<%=companyList.get(i).get("companyList") %>">
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

		<% } %>
<% } %>

<% if(conpanyList != null){ %>
	<% for(int i = 0; i < conpanyList.size(); i++){ %>
		<input type="checkbox" name="conpanyList" value="<% out.print(conpanyList.get(i).get("conpanyId")); %>" onClick="chbx('ch1	')" />

	<% } %>
<% } %>

<input type=submit value="登録">
	</form>


<!-- メニュー画面に戻る処理 -->
		<input type=button value="戻る" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp';">
</body>
</html>

