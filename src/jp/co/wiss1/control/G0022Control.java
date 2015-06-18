package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.Constants;
import jp.co.wiss1.model.G0022Model;

@WebServlet("/G0022Contlrl")
public class G0022Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException{

//		 ブラウザの文字コードの調整
		 request.setCharacterEncoding(Constants.CHARACTER_ENCODING);
		 response.setContentType("text/html;charset=" + Constants.CHARACTER_ENCODING);

//		 更新(UPDATE)②の処理

//		 更新内容の入力された項目を受け取る
		 String actressId = request.getParameter("actressId");
		 String actressName =request.getParameter("actressName");
		 String companyId =request.getParameter("companyId");
		 String contentsIdList  = request.getParameter("comtentsIdList") ;


//		 登録する項目を送る（登録の際は、会社名を会社IDとして指定する）
		 int flag = G0022Model.updateActress(actressId,actressName, companyId,contentsIdList);


//		 Viewの画面を戻す
		 if(flag >= 1){
//		  登録成功
		  request.setAttribute("flag",21);
		  }else{
//		  登録失敗
		  request.setAttribute("flag",20);
		 }
		 RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0020View.jsp");
	     dispatch.forward(request, response);
    }
}