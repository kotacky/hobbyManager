package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.Constants;
import jp.co.wiss1.model.G0021Model;

@WebServlet("/G0021Contlrl")
public class G0021Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException{

//		ブラウザの文字コードの調整
		request.setCharacterEncoding(Constants.CHARACTER_ENCODING);
		response.setContentType("text/html;charset="+ Constants.CHARACTER_ENCODING);

//		登録(INSERT)②の処理

//		登録する項目を受け取る
		String actressId = request.getParameter("actressId");
		String actressName =request.getParameter("actressName");
		String companyId =request.getParameter("companyId");
		String contentsIdList  = request.getParameter("comtentsIdList") ;

//			登録する項目を送る
		int flag = G0021Model.insertActress(actressId,actressName,companyId,contentsIdList);

//		Viewの画面に戻す
		if(flag <= 1 ){
//		 登録成功
		 request.setAttribute("flag",11);
	    }
		else{
//		 登録失敗
		 request.setAttribute("flag",10);
		}

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0020View.jsp");
		dispatch.forward(request, response);


	}
}