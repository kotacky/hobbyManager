package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0022Model;

@WebServlet("/G0022Control")
public class G0022Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException{

		//ブラウザの文字コードの調整
		EncodingUtils.responseEncoding(request,response);

		// 更新(UPDATE)②の処理

		//更新内容の入力された項目を受け取る
		String actressId = request.getParameter("actressId");
		String actressName =request.getParameter("actressName");
		String companyId =request.getParameter("companyId");

		boolean successFlag = true;
		String[]  contentsIdList  = request.getParameterValues("contentsList") ;

		for(int i = 0;i < contentsIdList.length; i++){
			//登録する項目を送る
			int ret = G0022Model.updateActress(companyId,actressName,actressId,contentsIdList[i]);
			if (ret == 0) {
				successFlag = false;
				break;
			}
		}

		// Viewの画面を戻す
		if( successFlag == true){
			// 登録成功
			request.setAttribute("updateFlag",1);
		}
		else{
			// 登録失敗
			request.setAttribute("updateFlag",0);
		}

		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0020View.jsp");
		dispatch.forward(request, response);
    }
}