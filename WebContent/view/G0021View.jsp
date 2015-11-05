<%@ page language = "java" contentType = "text/html; charset=Windows-31J"
    pageEncoding = "Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="Windows-31J">
	<title>�V�lDB - ���D�o�^</title>
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
</head>
<body>
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
			<li class="firstItem"><a href="<%= request.getContextPath() %>/view/G0001View.jsp" title="">TOP</a></li>
		</ul>
	</div>

	<h1>���D�V�K�o�^</h1>

<%--C�֓o�^��������𑗂� --%>
	<form method="POST" name="Myform" action="<%=request.getContextPath() %>/G0021Control">
		���DID:
		<input type="text" name="actressId"  placeholder="���DID" style="text-align: left;" required>�i�K�{�j<br>
		���D��:
		<input type="text" name="actressName"  placeholder="���D��" style="text-align: left;" required>�i�K�{�j<br>
		���N����:
		<input type="text" name="birthDate"  placeholder="���N����" style="text-align: left;"><br>
		���t�^:
		<input type="text" name="bloodType"  placeholder="���t�^" style="text-align: left;"><br>
		�o�g�n:
		<input type="text" name="birthPlace"  placeholder="�o�g�n" style="text-align: left;"><br>

<!-- ��Ђ�o�^�̂��߂ɑI�� -->

<h2>��Ђ�I��ł��������B</h2>

<%
	List<HashMap<String, String>> columnCompanyList = (List<HashMap<String, String>>)request.getAttribute("columnCompanyList");
%>

<SELECT name="companyId">
	<% for(int i = 0 ;i<columnCompanyList.size(); i++){ %>
	<option value="<%= columnCompanyList.get(i).get("companyId") %>">
	<%  out.print(columnCompanyList.get(i).get("companyName")); %>
	<% } %>
</SELECT>

<%
	List<HashMap<String, String>> columnMagazineList = (List<HashMap<String, String>>)request.getAttribute("columnMagazineList");
String[] check = null;
if (columnMagazineList == null) {
	check = new String[0];
} else {
	check = new String[columnMagazineList.size()];
}
%>

<h2>�\�����������G����I��ł��������B�i�K�{�j</h2>

<% if(columnMagazineList != null){ %>

	<% for(int i = 0; i < columnMagazineList.size(); i++){ %>
		<label>
			<input type="checkBox" name="magazineList" value="<%= columnMagazineList.get(i).get("magazineId") %>" required/>
			<%  out.print(columnMagazineList.get(i).get("magazineName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

<%
	List<HashMap<String, String>> columnDramaList = (List<HashMap<String, String>>)request.getAttribute("columnDramaList");
		check = null;
		if (columnDramaList == null) {
			check = new String[0];
		} else {
			check = new String[columnDramaList.size()];
		}
%>

<h2>�o���h���}��I��ł��������B�i�K�{�j</h2>

<% if(columnDramaList != null){ %>

	<% for(int i = 0; i < columnDramaList.size(); i++){ %>
		<label>
			<input type="checkBox" name="dramaList" value="<%= columnDramaList.get(i).get("dramaId") %>" required/>
			<%  out.print(columnDramaList.get(i).get("dramaName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

<%
	List<HashMap<String, String>> columnMovieList = (List<HashMap<String, String>>)request.getAttribute("columnMovieList");
		check = null;
		if (columnMovieList == null) {
			check = new String[0];
		} else {
			check = new String[columnMovieList.size()];
		}
%>

<h2>�o���f���I��ł��������B�i�K�{�j</h2>

<% if(columnMovieList != null){ %>

	<% for(int i = 0; i < columnMovieList.size(); i++){ %>
		<label>
			<input type="checkBox" name="movieList" value="<%= columnMovieList.get(i).get("movieId") %>" required/>
			<%  out.print(columnMovieList.get(i).get("movieName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

<%
	List<HashMap<String, String>> columnCommercialList = (List<HashMap<String, String>>)request.getAttribute("columnCommercialList");
		check = null;
		if (columnCommercialList == null) {
			check = new String[0];
		} else {
			check = new String[columnCommercialList.size()];
		}
%>

<h2>�o���b�l��I��ł��������B�i�K�{�j</h2>

<% if(columnCommercialList != null){ %>

	<% for(int i = 0; i < columnCommercialList.size(); i++){ %>
		<label>
			<input type="checkBox" name="commercialList" value="<%= columnCommercialList.get(i).get("commercialId") %>" required/>
			<%  out.print(columnCommercialList.get(i).get("commercialName")); %>
		</label>
	<% } %>
<% } %><br style="clear: both" />

		<input type="submit" value="�o�^">
	</form>
</body>
</html>