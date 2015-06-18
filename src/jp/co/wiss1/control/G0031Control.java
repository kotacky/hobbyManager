package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.model.G0031Model;
@WebServlet("/G0031Control")
public class G0031Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定
		request.setCharacterEncoding("Windows-31J");
		response.setContentType("text/html;charset=Shift_JIS");

		//insert処理
		//フォーム入力を受け取る
		String companyId = request.getParameter("company_id");
		String companyName =request.getParameter("company_name");
		String companyAdress = request.getParameter("company_adress");

		//Modelに引数を渡しinsert処理を実行させる
		//int i =
		G0031Model.insertCompany(companyId, companyName, companyAdress);

		//Viewに渡すフラグを設定
		//request.setAttribute("flag",i);

		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0031View.jsp");
		dispatch.forward(request, response);
	}
}
