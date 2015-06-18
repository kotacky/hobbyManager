package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.model.G0011Model;
@WebServlet("/G0011Control")
public class G0011Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定
		request.setCharacterEncoding("Windows-31J");
		response.setContentType("text/html;charset=Shift_JIS");

		//insert処理
		//フォーム入力を受け取る
		String employeeId = request.getParameter("employee_id");
		String employeeFamilyName = request.getParameter("employee_family_name");
		String employeeFirstName = request.getParameter("employee_first_name");
		String employeeBirth = request.getParameter("employee_birth");

		//Modelに引数を渡しinsert処理を実行させる
		//int i =
		G0011Model.insertemployeeList(employeeId, employeeFamilyName, employeeFirstName, employeeBirth);

		//Viewに渡すフラグを設定
		//request.setAttribute("flag",i);

		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0010View.jsp");
		dispatch.forward(request, response);
	}
}
