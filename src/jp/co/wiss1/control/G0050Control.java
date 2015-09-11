package jp.co.wiss1.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0050Model;

@WebServlet("/G0050Control")
public class G0050Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//Viewから処理命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要な情報を受け取る
		String dramaId = request.getParameter("dramaId");
		String title = request.getParameter("dramaName");
		String broadcastCool = request.getParameter("broadcastCool");

		//検索の処理
		if("select".equals(processDiv)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> dramaList = G0050Model.getDramaList(dramaId, title, broadcastCool);

			//検索結果をViewに送る
			request.setAttribute("dramaList", dramaList);

			//検索条件保持のために送る
			request.setAttribute("dramaName", title);
			request.setAttribute("broadcastCool", broadcastCool);
			request.setAttribute("dramaId", dramaId);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すための主キーを受け取る
			String updateDramaId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(updateDramaId != null){

				//更新前の情報を検索メソッドで受け取る
				List<HashMap<String, String>> dramaList = G0050Model.getDramaList(updateDramaId, "", "");

				//更新前の情報を更新ページに飛ばす
				request.setAttribute("dramaList", dramaList);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0052View.jsp");
				dispatch.forward(request, response);
			}else{
				//nullのとき処理を行わずに返す
				int updateFlag = 0;
				request.setAttribute("updateFlag",updateFlag);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
				dispatch.forward(request, response);
			}

		}

		//削除の処理
		if("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deleteDramaId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deleteDramaId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0050Model.deleteDrama(deleteDramaId);

				//デリート後のリストと削除完了のフラグを送る

					request.setAttribute("deleteFlag",deleteFlag);

			}else{
				//nullのとき処理を行わずに返す
				request.setAttribute("deleteFlag",0);
			}
			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> dramaList = G0050Model.getDramaList(dramaId, title, broadcastCool);

			//削除処理後のリストを送る
			request.setAttribute("dramaList", dramaList);

			//検索条件保持のために送る
			request.setAttribute("dramaId", dramaId);
			request.setAttribute("dramaName", title);
			request.setAttribute("broadCast", broadcastCool);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
			dispatch.forward(request, response);
		}
	}
}
