<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>新人DB一覧メニュー</title>
		<style>
			*{
				text-align : center ;
			}
		</style>
	</head>

	<body>
	<%
		// Controller側からもらう想定
		//ArrayList<String> xxxList = new ArrayList<String>();
		/*  xxxList.add("ssss");
			xxxList.add("dddd");
			xxxList.add("ffff");
			xxxList.add("gggg");*/
	%>
		<h1>メニュー</h1>

		<p><strong>閲覧ページを選択してください</strong></p>

			<form method="POST" action="G0010View.jsp">
				<input type="button" name="ページ選択" onClick="form.action=location.href='../view/G0010View.jsp'" value="社員一覧"><br>
				<input type="button" name="ページ選択" onClick="form.action=location.href='../view/G0020View.jsp'" value="女優一覧"><br>
				<input type="button" name="ページ選択" onClick="form.action=location.href='../view/G0030View.jsp'" value="所属会社一覧"><br>
				<input type="button" name="ページ選択" onClick="form.action=location.href='../view/G0040View.jsp'" value="コンテンツ一覧"><br>
				<input type="button" name="ページ選択" onClick="form.action=location.href='../view/G0050View.jsp'" value="好み一覧"><br>
			</form>
	</body>
</html>