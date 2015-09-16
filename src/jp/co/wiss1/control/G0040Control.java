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
		String magazineId = request.getParameter("magazineId");
		String magazineName = request.getParameter("magazineName");
		String publisherName = request.getParameter("publisherName");

		//検索の処理
		if("select".equals(processDiv)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> magazineList = G0040Model.getMagazineList(magazineId, magazineName, publisherName);

			//検索結果をViewに送る
			request.setAttribute("magazineList", magazineList);

			//検索条件保持のために送る
			request.setAttribute("magazineName", magazineName);
			request.setAttribute("publisherName", publisherName);
			request.setAttribute("magazineId", magazineId);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すための主キーを受け取る
			String updateMagazineId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(updateMagazineId != null){

				//更新前の情報を検索メソッドで受け取る
				List<HashMap<String, String>> magazineList = G0040Model.getMagazineList(updateMagazineId, "", "");

				//更新前の情報を更新ページに飛ばす
				request.setAttribute("magazineList", magazineList);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0042View.jsp");
				dispatch.forward(request, response);
			}else{
				//nullのとき処理を行わずに返す
				int updateFlag = 0;
				request.setAttribute("updateFlag",updateFlag);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
				dispatch.forward(request, response);
			}

		}

		//削除の処理
		if("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deleteMagazineId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deleteMagazineId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0040Model.deleteMagazine(deleteMagazineId);

				//デリート後のリストと削除完了のフラグを送る
				if(deleteFlag == 1){
					request.setAttribute("deleteFlag",deleteFlag);
				}else{
					request.setAttribute("deleteFlag",deleteFlag);
				}
			}else{
				//nullのとき処理を行わずに返す
				request.setAttribute("deleteFlag",0);
			}
			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> magazineList = G0040Model.getMagazineList(magazineId, magazineName,publisherName);

			//削除処理後のリストを送る
			request.setAttribute("magazineList", magazineList);

			//検索条件保持のために送る
			request.setAttribute("magazineId", magazineId);
			request.setAttribute("magazineName", magazineName);
			request.setAttribute("publisherName", publisherName);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0040View.jsp");
			dispatch.forward(request, response);
		}
	}
}
