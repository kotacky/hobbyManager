package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0121Model;

@WebServlet("/G0121Control")
public class G0121Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//高島史裕
		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);;

		//登録に必要な情報を受け取る
		String musicId = request.getParameter("musicId");
		String musicName = request.getParameter("musicName");
		String artistId = request.getParameter("artistId");
		//登録のメソッドを呼び出す
		int insertFlag = G0121Model.insertMusic(musicId,musicName,artistId);

		//登録完了フラグを送る
					request.setAttribute("insertFlag",insertFlag);

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0120View.jsp");
		dispatch.forward(request, response);

	}
}
