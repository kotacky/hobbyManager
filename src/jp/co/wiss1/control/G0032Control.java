package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.model.G0032Model;
@WebServlet("/G0032Control")
public class G0032Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定
		request.setCharacterEncoding("Windows-31J");
		response.setContentType("text/html;charset=Shift_JIS");

		//update処理
		//フォーム入力を受け取る
		String companyId = request.getParameter("company_id");
		String companyName = request.getParameter("company_name");
		String companyAdress = request.getParameter("company_adress");

		//Modelに引数を渡し、更新後の結果をリストに入れる
		//int i =
		G0032Model.updatecompanyList(companyId, companyName, companyAdress);

		//Viewに渡すフラグを設定
		//if(i>=1){
		//request.setAttribute("flag", true);
		//}

		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0030View.jsp");
		dispatch.forward(request, response);
	}
}
