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
import jp.co.wiss1.model.G0040Model;

@WebServlet("/G0040Control")
public class G0040Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//Viewから処理命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要な情報を受け取る
		String contentsId = request.getParameter("contentsId");
		String title = request.getParameter("contentsName");
		String summary = request.getParameter("summary");

		//検索の処理
		if("select".equals(processDiv)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> contentsList = G0040Model.getContentsList(contentsId, title, summary);

			//検索結果をViewに送る
			request.setAttribute("contentsList", contentsList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すための主キーを受け取る
			String updateId = request.getParameter("contentsId");

			//更新前の情報を検索メソッドで受け取る
			List<HashMap<String, String>> contentsList = G0040Model.getContentsList(updateId, "", "");

			//更新前の情報を更新ページに飛ばす
			request.setAttribute("contentsList", contentsList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0042View.jsp");
			dispatch.forward(request, response);
		}

		//削除の処理
		if("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deleteId = request.getParameter("contentsId");

			//デリートのメソッドを呼ぶ
			int deleteFlag = G0040Model.deleteContents(deleteId);

			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> contentsList = G0040Model.getContentsList(contentsId, title, summary);

			//デリート後のリストと削除完了のフラグを送る
			request.setAttribute("contentsList", contentsList);
			if(deleteFlag == 1){
				request.setAttribute("deleteFlag",deleteFlag);
			}else{
				request.setAttribute("deleteFlag",deleteFlag);
			}
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
			dispatch.forward(request, response);
		}
	}
}
