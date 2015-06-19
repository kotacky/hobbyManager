package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0042Model;

@WebServlet("/G0042Control")
public class G0042Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//更新②の処理
		//更新する内容を受け取る
		String contentsId = request.getParameter("contentsId");
		String title = request.getParameter("contentsName");
		String summary = request.getParameter("summary");

		//更新するメソッドを呼び出す
		int updateFlag = G0042Model.updateContents(contentsId, title, summary, "");

		//更新完了フラグを送る
		if(updateFlag == 1){
			request.setAttribute("updateFlag",updateFlag);
		}else{
			request.setAttribute("updateFlag",updateFlag);
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
		dispatch.forward(request, response);
	}
}
