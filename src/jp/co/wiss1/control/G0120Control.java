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
import jp.co.wiss1.model.G0120Model;

@WebServlet("/G0120Control")
public class G0120Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//Viewから処理命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要な情報を受け取る
		String musicId = request.getParameter("musicId");
		String name = request.getParameter("musicName");

		//検索の処理
		if("select".equals(processDiv)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> musicList = G0120Model.getMusicList(musicId, name );

			//検索結果をViewに送る
			if (musicList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}
			request.setAttribute("musicList", musicList);

			//検索条件保持のために送る
			request.setAttribute("musicName", name);
			request.setAttribute("musicId", musicId);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0120View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すためのラジオボタン入力を受け取る
			//idを受け取る
			String updatemusicId = request.getParameter("radioButton");

			//radioButtoがnullならば処理を行う
			if(updatemusicId == null){
				request.setAttribute("updateFlag", 0);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0120View.jsp");
				System.out.println(dispatch);
				dispatch.forward(request, response);
			}
			else{
				//Modelに引数を渡し、検索結果をリストに入れる
				List<HashMap<String,String>> musicList = G0120Model.getMusicList(updatemusicId, "");

				//Viewに渡すリストを設定
				request.setAttribute("musicList", musicList);

				//Viewにリストを渡す
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0120View.jsp");
				dispatch.forward(request, response);
			}
		}

		//削除の処理
		if("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deletemusicId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deletemusicId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0120Model.deletemusic(deletemusicId);

				//デリート後のリストと削除完了のフラグを送る

					request.setAttribute("deleteFlag",deleteFlag);

			}else{
				//nullのとき処理を行わずに返す
				request.setAttribute("deleteFlag",0);
			}
			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> musicList = G0120Model.getMusicList(musicId, name);

			//削除処理後のリストを送る
			request.setAttribute("musicList", musicList);

			//検索条件保持のために送る
			request.setAttribute("musicId", musicId);
			request.setAttribute("musicName", name);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0120View.jsp");
			dispatch.forward(request, response);
		}
	}
}
