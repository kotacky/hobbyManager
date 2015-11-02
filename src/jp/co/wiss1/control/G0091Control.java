package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0091Model;
@WebServlet("/G0091Control")
public class G0091Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//insert処理
		//フォーム入力を受け取る
		String genreId = request.getParameter("genreId");
		String genreName = request.getParameter("genreName");

		//Modelに引数を渡しinsert処理を実行させる
		int insertFlag = G0091Model.insertGenre(genreId, genreName);

		//Viewに渡すフラグを設定
		request.setAttribute("insertFlag",insertFlag);

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0091View.jsp");
		dispatch.forward(request, response);

	}
}
