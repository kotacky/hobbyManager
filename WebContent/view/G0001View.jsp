<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="Windows-31J">
		<title>�V�lDB�ꗗ���j���[</title>
		<style>
			*{
				text-align : center ;
			}
		</style>
	</head>

	<body>
	<%
		// Controller��������炤�z��
		//ArrayList<String> xxxList = new ArrayList<String>();
		/*  xxxList.add("ssss");
			xxxList.add("dddd");
			xxxList.add("ffff");
			xxxList.add("gggg");*/
	%>
		<h1>���j���[</h1>

		<p><strong>�{���y�[�W��I�����Ă�������</strong></p>

			<form method="POST" action="G0010View.jsp">
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0010View.jsp'" value="�Ј��ꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0020View.jsp'" value="���D�ꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0030View.jsp'" value="������Јꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0040View.jsp'" value="�R���e���c�ꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0050View.jsp'" value="�D�݈ꗗ"><br>
			</form>
	</body>
</html>