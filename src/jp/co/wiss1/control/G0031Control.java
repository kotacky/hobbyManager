package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0031Model;
@WebServlet("/G0031Control")
public class G0031Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定　
		EncodingUtils.responseEncoding(request,response);

		//insert処理
		//フォーム入力を受け取る
		String companyId = request.getParameter("companyId");
		String companyName =request.getParameter("companyName");
		String companyAddress = request.getParameter("companyAddress");

		//Modelに引数を渡しinsert処理を実行させる
		int insertFlag =
		G0031Model.insertCompany(companyId, companyName, companyAddress);

		//Viewに渡すフラグを設定
		request.setAttribute("insertFlag",insertFlag);

		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0031View.jsp");
		dispatch.forward(request, response);
	}
}
