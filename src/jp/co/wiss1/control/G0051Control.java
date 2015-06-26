package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0051Model;

@WebServlet("/G0051Control")
public class G0051Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//登録に必要な情報を受け取る
		String employeeId = request.getParameter("employeeId");
		String actressId = request.getParameter("actressId");

		//登録する項目を送る
		int insertFlag = G0051Model.insertPreference(employeeId,actressId);

		//Viewの画面に戻す
		//登録成功なら1、失敗なら0がViewへ
		request.setAttribute("insertFlag",insertFlag);

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
		dispatch.forward(request, response);
	}
}
