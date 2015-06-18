package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.Constants;
import jp.co.wiss1.model.G0041Model;

@WebServlet("/G0041Control")
public class G0041Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		response.setCharacterEncoding(Constants.CHARACTER_ENCODING);
		response.setContentType("text/html;charset="+Constants.CHARACTER_ENCODING);

		//登録に必要な情報を受け取る
		String contentsId = request.getParameter("contentsId");
		String title = request.getParameter("contentsName");
		String summary = request.getParameter("summary");

		//登録のメソッドを呼び出す
		int flagCount = G0041Model.insertContents(contentsId, title, summary,"");

		//登録完了フラグを送る
		if(flagCount >= 1){
			//request.setAttribute("flag",11);
		}else{
			//request.setAttribute("flag",10);
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
		dispatch.forward(request, response);

	}
}
