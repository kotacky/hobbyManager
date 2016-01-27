//同期　
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
import jp.co.wiss1.model.G0030Model;

@WebServlet("/G0030Control")
public class G0030Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{

		//ブラウザの文字コードの設定
		EncodingUtils.responseEncoding(request,response);

		//フォーム入力を受け取る
		String companyId = request.getParameter("companyId");
		String companyName = request.getParameter("companyName");
		String companyAddress = request.getParameter("companyAddress");
		//

		//どのボタンからの入力かを受け取る
		String process = request.getParameter("process");

		//検索
		if("select".equals(process)){
			//Modelに引数を渡し、検索結果をリストに入れる
			List<HashMap<String,String>> companyList = G0030Model.getCompanyList(companyId, companyName, companyAddress);

			//Viewに渡すリストを設定
			if (companyList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}
			request.setAttribute("companyList", companyList);

			//Viewにリストを渡す
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0030View.jsp");
			dispatch.forward(request, response);
		}


		//更新
		if("update".equals(process)){
			//ラジオボタン入力を受け取る
			String updateCompanyId = request.getParameter("radioButton");

			if(updateCompanyId == null){
				//Viewにリストを渡す
				request.setAttribute("updateFlag", 0);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0030View.jsp");
				dispatch.forward(request, response);

			}
			else{
				//Modelに引数を渡し、検索結果をリストに入れる
				List<HashMap<String,String>> companyList = G0030Model.getCompanyList(updateCompanyId, companyName, companyAddress);

				//Viewに渡すリストを設定
				request.setAttribute("companyList", companyList);

				//Viewにリストを渡す
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0032View.jsp");
				dispatch.forward(request, response);
			}

		}

		//削除
		if("delete".equals(process)){

			//ラジオボタン入力を受け取る
			String deleteCompanyId = request.getParameter("radioButton");

			//削除する項目のIDと、削除の命令をModelに送る
			int deleteFlag =
			G0030Model.deleteCompany(deleteCompanyId);

			//削除後の結果をリストに入れる
			List<HashMap<String,String>> companyList = G0030Model.getCompanyList(companyId,companyName,companyAddress);

			//Viewに渡す削除後のリスト、フラグを設定
			request.setAttribute("companyList", companyList);
			request.setAttribute("deleteFlag",deleteFlag);

			//Viewにリスト、フラグを渡す
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0030View.jsp");
			dispatch.forward(request, response);
		}

	}
}