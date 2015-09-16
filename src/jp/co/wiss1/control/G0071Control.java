package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0071Model;

@WebServlet("/G0071Control")
public class G0071Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//高島史裕
		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//登録に必要な情報を受け取る
		String commercialId = request.getParameter("commercialId");
		String commercialName = request.getParameter("commercialName");
		String sponserName = request.getParameter("sponserName");

		//登録のメソッドを呼び出す
		int insertFlag = G0071Model.insertCommercial(commercialId, commercialName, sponserName);

		//登録完了フラグを送る
		request.setAttribute("insertFlag",insertFlag);

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0071View.jsp");
		dispatch.forward(request, response);

	}
}
