package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0052Model;

@WebServlet("/G0052Control")
public class G0052Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{
		//今日は寒い。
		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//更新②の処理
		//更新する内容を受け取る
		String dramaId = request.getParameter("dramaId");
		String title = request.getParameter("dramaName");
		String broadcastCool = request.getParameter("broadcastCool");

		//更新するメソッドを呼び出す
		int updateFlag = G0052Model.updateDrama(dramaId, title, broadcastCool);

		//更新完了フラグを送る

		request.setAttribute("updateFlag",updateFlag);

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
		dispatch.forward(request, response);
	}
}
