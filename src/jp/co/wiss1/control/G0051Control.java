package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0051Model;

@WebServlet("/G0051Control")
public class G0051Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//登録に必要な情報を受け取る
		String employeeId = request.getParameter("employeeId");
		String actressId = request.getParameter("actressId");
		boolean successFlag = true;
		String[]  contentsIdList  = request.getParameterValues("contentsList") ;

		for(int i = 0;i < contentsIdList.length; i++){
			//登録する項目を送る
			int ret = G0051Model.insertPreference(employeeId,actressId,contentsIdList[i]);
			if (ret == 0) {
				successFlag = false;
				break;
			}
		}

		//Viewの画面に戻す
		if(successFlag == true){
			// 登録成功
			request.setAttribute("insertFlag",1);
	    }else{
			// 登録失敗
			request.setAttribute("insertFlag",0);
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
		dispatch.forward(request, response);
	}
}
