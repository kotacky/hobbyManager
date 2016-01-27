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
import jp.co.wiss1.model.G0100Model;

@WebServlet("/G0100Control")
// class クラス名 extends(継承) スーパークラス あるクラスの実装を土台に別のクラスを実装するのがextends
public class G0100Control extends HttpServlet {
	//
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException {
		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request, response);


		//処理に必要な情報をview画面から受け取る
		String televisionId = request.getParameter("televisionId");
		String televisionName = request.getParameter("televisionName");
		String televisionAddress = request.getParameter("televisionAddress");

		//viewの情報"prosessDiv"を受け取る
		//Viewのどのボタンからきたか受け取る(hidden)
		String process = request.getParameter("process");
		System.out.println(process);
		//検索の中身がviewからきた情報にあったら
		if("select".equals(process)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> televisionList = G0100Model.getTelevisionList(televisionId, televisionName, televisionAddress);

			//Viewに渡すリストを設定する
			if (televisionList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}
			request.setAttribute("televisionList", televisionList);

			//Viewにsetしたリストを渡す。
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0100View.jsp");
			dispatch.forward(request, response);
		}

		//更新の処理
		if("update".equals(process)){

			//更新前の情報を引き出すためのラジオボタン入力を受け取る
			//idを受け取る
			String updateTelevisionId = request.getParameter("radioButton");

			//radioButtoがnullならば処理を行う
			if(updateTelevisionId == null){
				request.setAttribute("updateFlag", 0);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0100View.jsp");
				System.out.println(dispatch);
				dispatch.forward(request, response);
			}
			else{
				//Modelに引数を渡し、検索結果をリストに入れる
				List<HashMap<String,String>> televisionList = G0100Model.getTelevisionList(updateTelevisionId, televisionName, televisionAddress);

				//Viewに渡すリストを設定
				request.setAttribute("televisionList", televisionList);

				//Viewにリストを渡す
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0102View.jsp");
				dispatch.forward(request, response);
			}
		}
		//削除の処理
		if("delete".equals(process)){

			//ラジオボタン入力を受け取る
			String deleteTelevisionId = request.getParameter("radioButton");

			//削除する項目のIDと、削除の命令をModelに送る
			int deleteFlag =
			G0100Model.deleteTelevision(deleteTelevisionId);

			//削除後の結果をリストに入れる
			List<HashMap<String,String>> televisionList = G0100Model.getTelevisionList(televisionId,televisionName,televisionAddress);

			//Viewに渡す削除後のリスト、フラグを設定
			request.setAttribute("televisionList", televisionList);
			request.setAttribute("deleteFlag",deleteFlag);

			//Viewにリスト、フラグを渡す
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0100View.jsp");
			dispatch.forward(request, response);
		}
	}
}

