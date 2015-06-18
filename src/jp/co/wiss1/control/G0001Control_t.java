package jp.co.wiss1.control;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.model.G0001Model;

@WebServlet ("/G0010Contlrl")//
public class G0001Control_t extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws IOException,ServletException
{

request.setCharacterEncoding("Windows-31J");
response.setContentType("text/html;charset=Windows-31J");//viewに送る文字コードの指定
String val1 =request.getParameter("employee_id");//要求を受け取る
String val2 =request.getParameter("employee_familyname");
String val3 =request.getParameter("employee_firstname");

List <HashMap> employeeList = G0001Model.getEmployeeList();//val1,val2,val3は引数に使う。
//Modelへ要求を渡し、データを受け取る


	String disp1 = "/WebContent/view/G0010View.jsp";//Viewへの送り先を指定
	/*int size = employeeList.size();
	request.setAttribute("Listsize" , size);//データからサイズを抽出
	 request.setAttribute ("EmployeeList",employeeList );//データを格納*/
	RequestDispatcher dispatch =request.getRequestDispatcher(disp1);
	//リクエストをdispatchにまとめる。
	dispatch.forward(request,response);//送る

  /*for (int i=0;i<size;i++)//employeeListにデータを格納
  {
	request.setAttribute("employeeId",employeeList.get(i).get(""));
	request.setAttribute("employeeFamilyName",employeeList.get(i).get(""));
	request.setAttribute("employeeFirstName",employeeList.get(i).get(""));
	request.setAttribute("employeeBirth",employeeList.get(i).get(""));
  }
	request.setAttribute("employeeList",employeeList);
	dispatch.forward(request,response);*/



}
	}





