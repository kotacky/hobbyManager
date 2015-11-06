package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0101Model;
@WebServlet("/G0101Control")
public class G0101Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定　
		EncodingUtils.responseEncoding(request,response);

		//insert処理
		//フォーム入力を受け取る
		String televisionId = request.getParameter("televisionId");
		String televisionName =request.getParameter("televisionName");
		String televisionAddress = request.getParameter("televisionAddress");

		//Modelに引数を渡しinsert処理を実行させる
		int insertFlag =
		G0101Model.insertTelevision(televisionId, televisionName, televisionAddress);

		//Viewに渡すフラグを設定
		request.setAttribute("insertFlag",insertFlag);

		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0100View.jsp");
		dispatch.forward(request, response);
	}
}
