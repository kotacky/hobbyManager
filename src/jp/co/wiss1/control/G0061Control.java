package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0061Model;

@WebServlet("/G0061Control")
public class G0061Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//高島史裕
		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//登録に必要な情報を受け取る
		String movieId = request.getParameter("movieId");
		String title = request.getParameter("movieName");
		String releaseDate = request.getParameter("releaseDate");
		String movieGenre = request.getParameter("movieGenre");

		//登録のメソッドを呼び出す
		int insertFlag = G0061Model.insertMovie(movieId, title, releaseDate, movieGenre);

		//登録完了フラグを送る
		request.setAttribute("insertFlag",insertFlag);

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0060View.jsp");
		dispatch.forward(request, response);

	}
}
