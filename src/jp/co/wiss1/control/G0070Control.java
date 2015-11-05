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
import jp.co.wiss1.model.G0070Model;

@WebServlet("/G0070Control")
public class G0070Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//Viewから処理命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要な情報を受け取る
		String commercialId = request.getParameter("commercialId");
		String title = request.getParameter("commercialName");
		String sponserName = request.getParameter("sponserName");

		//検索の処理
		if("select".equals(processDiv)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> commercialList = G0070Model.getCommercialList(commercialId, title, sponserName);

			//検索結果をViewに送る
			if (commercialList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}
			request.setAttribute("commercialList", commercialList);

			//検索条件保持のために送る
			request.setAttribute("commercialName", title);
			request.setAttribute("sponserName", sponserName);
			request.setAttribute("commercialId", commercialId);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0070View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すための主キーを受け取る
			String updateCommercialId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(updateCommercialId != null){

				//更新前の情報を検索メソッドで受け取る
				List<HashMap<String, String>> commercialList = G0070Model.getCommercialList(updateCommercialId, "", "");

				//更新前の情報を更新ページに飛ばす
				request.setAttribute("commercialList", commercialList);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0072View.jsp");
				dispatch.forward(request, response);
			}else{
				//nullのとき処理を行わずに返す
				int updateFlag = 0;
				request.setAttribute("updateFlag",updateFlag);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0070View.jsp");
				dispatch.forward(request, response);
			}

		}

		//削除の処理
		if("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deleteCommercialId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deleteCommercialId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0070Model.deleteCommercial(deleteCommercialId);

				//デリート後のリストと削除完了のフラグを送る

					request.setAttribute("deleteFlag",deleteFlag);
			}else{

				//nullのとき処理を行わずに返す
				request.setAttribute("deleteFlag",0);
			}
			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> commercialList = G0070Model.getCommercialList(commercialId, title, sponserName);

			//削除処理後のリストを送る
			request.setAttribute("commercialList", commercialList);

			//検索条件保持のために送る
			request.setAttribute("commercialId", commercialId);
			request.setAttribute("commercialName", title);
			request.setAttribute("sponserName", sponserName);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0070View.jsp");
			dispatch.forward(request, response);
		}
	}
}
