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
import jp.co.wiss1.model.G0090Model;

@WebServlet("/G0090Control")
public class G0090Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		/*ブラウザの文字コードの設定 忘れずに*/
		EncodingUtils.responseEncoding(request,response);

		//Viewから処理命令を受け取る
		String processDiv = request.getParameter("processDiv");

		String genreId = request.getParameter("genreId");
		String genreName = request.getParameter("genreName");


		if("select".equals(processDiv)){
		//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
		List<HashMap<String, String>> genreList = G0090Model.getGenreList(genreId, genreName);
		//()をあげたら、HashMapのリストをモデルからもらう

		//Viewに渡すリストを設定
		if (genreList.size() < 1) {
			//Viewに渡すメッセージを設定
			request.setAttribute("message", "該当データがありません。");
		}
		request.setAttribute("genreList", genreList);

		//Viewにリストを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0090View.jsp");
		dispatch.forward(request, response);

		//検索条件保持のために送る
		/*request.setAttribute("genreName", genreName);
		request.setAttribute("genreId", genreId);*/

		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すための主キーを受け取る
			String updategenreId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(updategenreId != null){

				//更新前の情報を検索メソッドで受け取る
				List<HashMap<String, String>> genreList = G0090Model.getGenreList(updategenreId, "");

				//更新前の情報を更新ページに飛ばす
				request.setAttribute("genreList", genreList);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0092View.jsp");
				dispatch.forward(request, response);
			}else{
				//nullのとき処理を行わずに返す
				int updateFlag = 0;
				request.setAttribute("updateFlag",updateFlag);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0090View.jsp");
				dispatch.forward(request, response);
			}

		}

		//削除の処理
		if("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deletegenreId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deletegenreId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0090Model.deletegenre(deletegenreId);

				//デリート後のリストと削除完了のフラグを送る

					request.setAttribute("deleteFlag",deleteFlag);
			}else{

				//nullのとき処理を行わずに返す
				request.setAttribute("deleteFlag",0);
			}
			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> genreList = G0090Model.getGenreList(genreId, genreName);

			//削除処理後のリストを送る
			request.setAttribute("gerneList", genreList);

			//検索条件保持のために送る
			request.setAttribute("genreId", genreId);
			request.setAttribute("genreName", genreName);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0090View.jsp");
			dispatch.forward(request, response);
		}
	}
}
