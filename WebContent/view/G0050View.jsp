<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import = "java.util.HashMap"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>DÝê</title>
		<style>
			*{
				text-align : center;
			}
		</style>
		<script>
		 function func(MyCommand){
			 alert("start!:[" + MyCommand + "]");
			 document.MyForm.process.value=MyCommand;
			 document.MyForm.submit();
		 }
		</script>
	</head>

	<body>
<%-- XgÌæ¾ --%>
<%
		    HashMap<String,String> preferenceList = new HashMap<String,String>();
					preferenceList.put("employeeId","122");
					preferenceList.put("employeeFamilyname", "àä");
					preferenceList.put("employeeFirstname", "Ë");
					preferenceList.put("actressName","»£Íé©");
					preferenceList.put("contentsName","ªdÌ÷");
//List<HashMap<String,String>> preferenceList = (List<HashMap<String,String>>)request.getAttribute("PreferenceList");
String disabled = "disabled";
if(preferenceList != null){
     disabled = "";
}
%>
		<h1>DÝê</h1>
		<% //CÖõ·éððé %>
		<form method="POST" name=MyForm action="<%= request.getContextPath() %>/G0050Control">
			ÐõID:
			<input type="text" name="employee_id" placeholder="ÐõID"  style="text-align: left;"><br>
			©:
			<input type="text" name="employee_family_name" placeholder="©"  style="text-align: left;"><br>
			¼:
			<input type="text" name="employee_first_name" placeholder="¼"  style="text-align: left;"><br>
			<input type=submit value="õ" onClick="func('select');">
			<input type="button" value="í" onClick="func('delete');" <%= disabled %> />

<%
//String employee_id=request.getParameter("employee_id");
//String employee_family_name=request.getParameter("employee_family_name");
//String employee_first_name=request.getParameter("employee_first_name");
%>

<% //e[uÌ\¦%>
<%if(preferenceList != null){ %>
			<table width="400" border="1" align="center">
				<Tr>
					<Th>Ið</Th>
					<Th>ÐõID</Th>
					<Th>©</Th>
					<Th>¼</Th>
					<Th>D¼</Th>
					<Th>Rec¼</Th>
				</Tr>
	<% for(int i = 0 ;i<preferenceList.size(); i++){ %>
				<Tr>
					<Th><input type="radio" name="id" value="<%= preferenceList./*get(i).*/get("employee_id")%>"></Th>
								<% if(i == 0){ %>
									<Th><% out.print(preferenceList./*get(i).*/get("employeeId")); %></Th>
									<Th><% out.print(preferenceList./*get(i).*/get("employeeFamilyname")); %></Th>
									<Th><% out.print(preferenceList./*get(i).*/get("employeeFirstname")); %></Th>
									<Th><% out.print(preferenceList./*get(i).*/get("actressName")); %></Th>
								<% }else if(preferenceList./*get(i).*/get("employeeId") != preferenceList./*get(i - 1).*/get("employeeId")){ %>
									<Th><% out.print(preferenceList./*get(i).*/get("employeeId")); %></Th>
									<Th><% out.print(preferenceList./*get(i).*/get("employeeFamilyname")); %></Th>
									<Th><% out.print(preferenceList./*get(i).*/get("employeeFirstname")); %></Th>
									<Th><% out.print(preferenceList./*get(i).*/get("actressName")); %></Th>
								<% }else{ %>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
									<Th><% out.print(""); %></Th>
								<% } %>
									<Th><% out.print(preferenceList./*get(i).*/get("contentsName")); %></Th>
	<% } %>
<% } %>
				</Tr>
			</table>
			<input type="hidden" name="process">
		</form>

		<%-- o^æÊÖÌJÚ --%>
		<input type=button value="VKo^" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0051View.jsp';return true">
		<%-- j[æÊÉßé --%>
		<input type=button value="j[Ö" onClick="form.action=location.href='http://localhost:8080/hobbyManager/view/G0001View.jsp';return true">
	</body>
</html>