package jp.co.wiss1.control;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.realm.RealmBase;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0000Model;

@WebServlet("/G0000Control")
public class G0000Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		/*ブラウザの文字コードの設定 忘れずに*/
		EncodingUtils.responseEncoding(request,response);

		String employeeId = request.getParameter("employeeId");
		String employeePassword = request.getParameter("employeePassword");

		String hashedPassword = RealmBase.Digest(employeePassword, "MD5", "UTF-8");

		System.out.println(hashedPassword);

		//Viewから処理命令を受け取る
		String processDiv = request.getParameter("processDiv");

		int loginFlag = G0000Model.getLogin(employeeId, employeePassword);

		if("login".equals(processDiv)){

			if( loginFlag == 1 ){
				request.setAttribute("loginFlag", loginFlag);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0001View.jsp");
				dispatch.forward(request, response);

			}else{
				//nullのとき処理を行わずに返す
				request.setAttribute("loginFlag", loginFlag);
				request.setAttribute("message", "ログイン出来ませんでした。");
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/LoginView.jsp");
				dispatch.forward(request, response);
			}
		}
	}
}

