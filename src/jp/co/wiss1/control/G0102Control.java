package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0102Model;
@WebServlet("/G0102Control")
public class G0102Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定　
		EncodingUtils.responseEncoding(request,response);

		//update処理
		//フォーム入力を受け取る
		String televisionId = request.getParameter("televisionId");
		String televisionName = request.getParameter("televisionName");
		String televisionAddress = request.getParameter("televisionAddress");

		//Modelに引数を渡し、更新後の結果をリストに入れる
		int updateFlag =
		G0102Model.updateTelevision(televisionId, televisionName, televisionAddress);

		//Viewに渡すフラグを設定
		request.setAttribute("updateFlag", updateFlag);

		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0100View.jsp");
		dispatch.forward(request, response);
	}
}
