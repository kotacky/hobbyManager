package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.Constants;
import jp.co.wiss1.model.G0051Model;

@WebServlet("/G0051Control")
public class G0051Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{

		//ブラウザの文字コードで返す
		response.setCharacterEncoding(Constants.CHARACTER_ENCODING);
		response.setContentType("text/html;charset="+Constants.CHARACTER_ENCODING);

		//登録に必要な情報を受け取る
		String employeeId = request.getParameter("employeeId");
		String actressId = request.getParameter("actressId");

		//登録のメソッドを呼び出す
		int flagCount = G0051Model.insertPreference(employeeId, actressId);

		//登録フラグを送る
		if(flagCount >= 1){
			//request.setAttribute("flag",11);
		}else{
			//request.setAttribute("flag",10);
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
		dispatch.forward(request, response);
	}
}
