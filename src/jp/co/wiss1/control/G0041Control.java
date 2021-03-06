package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0041Model;

@WebServlet("/G0041Control")
public class G0041Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//高島史裕
		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//登録に必要な情報を受け取る
		String magazineId = request.getParameter("magazineId");
		String magazineName = request.getParameter("magazineName");
		String publisherName = request.getParameter("publisherName");

		//登録のメソッドを呼び出す
		int insertFlag = G0041Model.insertMagazine(magazineId, magazineName, publisherName);

		//登録完了フラグを送る
		if(insertFlag == 1){
			request.setAttribute("insertFlag",insertFlag);
		}else{
			request.setAttribute("insertFlag",insertFlag);
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
		dispatch.forward(request, response);

	}
}
