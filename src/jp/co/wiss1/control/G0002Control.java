package jp.co.wiss1.control;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.wiss1.common.EncodingUtils;

@WebServlet("/G0002Control")
public class G0002Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		/*ブラウザの文字コードの設定 忘れずに*/
		EncodingUtils.responseEncoding(request,response);

		/*httpsessionで権限を持たせる*/
		HttpSession session = request.getSession(false);



		if("logout".equals("logout")){

				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0000View.jsp");
				dispatch.forward(request, response);
				session.invalidate();

			}
		}
	}

