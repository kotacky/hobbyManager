package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0092Model;
@WebServlet("/G0092Control")
public class G0092Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定　
		EncodingUtils.responseEncoding(request,response);

		//update処理
		//フォーム入力を受け取る
		String genreId = request.getParameter("genreId");
		String genreName = request.getParameter("genreName");

		//Modelに引数を渡し、更新後の結果をリストに入れる
		int updateFlag =
		G0092Model.updateGenre(genreId, genreName);

		//Viewに渡すフラグを設定
		request.setAttribute("updateFlag", updateFlag);

		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0090View.jsp");
		dispatch.forward(request, response);
	}
}
