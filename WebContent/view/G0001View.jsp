<%@ page contentType="text/html; charset=Windows-31J" %>
<!DOCTYPE html>
<html>
	<head>
		<title>�V�lDB</title>
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
			<form method="POST" action="G0010View.jsp">
				�{���y�[�W��I�����Ă�������:<br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0010View.jsp'" value="�Ј��ꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0020View.jsp'" value="���D�ꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0030View.jsp'" value="������Јꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0040View.jsp'" value="�h���}�E�f��ꗗ"><br>
				<input type="button" name="�y�[�W�I��" onClick="form.action=location.href='../view/G0050View.jsp'" value="�D�݈ꗗ"><br>
				<p>
			</form>
	</body>
</html>