package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.Constants;
import jp.co.wiss1.model.G0012Model;

@WebServlet("/G0012Control")
public class G0012Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		response.setCharacterEncoding(Constants.CHARACTER_ENCODING);
		response.setContentType("text/html;charset="+Constants.CHARACTER_ENCODING);

		//更新②の処理
		//更新する内容を受け取る
		String employeeId = request.getParameter("employeeId");
		String familyName = request.getParameter("employeeFamilyName");
		String firstName = request.getParameter("employeeFirstName");
		String birthDay = request.getParameter("employeeBirth");

		//更新するメソッドを呼び出す
		G0012Model.updateEmployee(employeeId, familyName, firstName, birthDay);

		//更新フラグを送る
		//request.setAttribute("flag",2);
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0010View.jsp");
		dispatch.forward(request, response);
	}
}
