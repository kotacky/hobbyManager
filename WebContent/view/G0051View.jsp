<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
    <%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>DÝo^</title>
</head>
<body>
<H1>DÝo^</H1>
<% //CÖo^·éððé %>
<form method="POST"name="Myform" action="<%=request.getContextPath() %>/G0051Control">
ÐõID:
<input type="text" name="employee_id"><br>
DID:
<input type="text" name="actress_id"><br>
<!-- ïÐðo^Ì½ßÉIð -->
<%
	List<HashMap<String, String>> companyList = (List<HashMap<String, String>>)request.getAttribute("companyList");
	String[] sel = null;
	if (companyList == null) {
		sel = new String[0];
	} else {
		sel = new String[companyList.size()];
	}
%>

<%
	List<HashMap<String, String>> conpanyList = (List<HashMap<String, String>>)request.getAttribute("conpanyList");
	String[] pul = null;
	if (conpanyList == null) {
		pul = new String[0];
	} else {
		pul = new String[conpanyList.size()];
	}
%>

<SELECT NAME="lang">
<option>
	<% for(int i = 0 ;i<conpanyList.size(); i++){ %>
		<option value="<%= conpanyList.get(i).get("conpanyId") %>">
		<% out.println(conpanyList.get(i).get("conpanyName")); %>
	<% } %>
</option>


</SELECT>




DÝID:
<input type="text" name="employee_id"><br>

<input type=submit value="o^">
</form>
<%-- j[æÊÉßé --%>
<input type=button value="ßé" onClick="form.action=location.href='../../hobbyManager/view/G0001View.jsp'">
</body>
</html>