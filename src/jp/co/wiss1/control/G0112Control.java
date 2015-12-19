package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0112Model;

@WebServlet("/G0112Control")
public class G0112Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{
		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//更新②の処理
		//更新する内容を受け取る
		String artistId = request.getParameter("artistId");
		String artistName = request.getParameter("artistName");
		String companyId = request.getParameter("companyId");


		//更新するメソッドを呼び出す
		int updateFlag = G0112Model.updateArtist(artistId,artistName,companyId);

		//更新完了フラグを送る
		request.setAttribute("updateFlag",updateFlag);

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0110View.jsp");
		dispatch.forward(request, response);
	}
}
