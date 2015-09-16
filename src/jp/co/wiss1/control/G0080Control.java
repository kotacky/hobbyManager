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
import jp.co.wiss1.model.G0080Model;
import jp.co.wiss1.model.G0081Model;

@WebServlet("/G0080Control")
public class G0080Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//Viewから処理命令を受け取る　
		String processDiv = request.getParameter("processDiv");

		//処理に必要な情報を受け取る
		String employeeId = request.getParameter("employeeId");
		String familyName = request.getParameter("employeeFamilyName");
		String firstName = request.getParameter("employeeFirstName");

		//検索の処理
		if("select".equals(processDiv)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> preferenceList = G0080Model.getPreferenceList(employeeId, familyName, firstName);

			//結果をViewに送る
			request.setAttribute("preferenceList", preferenceList);

			//検索条件保持のために送る
			request.setAttribute("employeeId", employeeId);
			request.setAttribute("employeeFamilyName", familyName);
			request.setAttribute("employeeFirstName", firstName);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0080View.jsp");
			dispatch.forward(request, response);
		}

		//登録①の処理
		if("insert".equals(processDiv)){

			//登録画面に必要な要素を引き出す
			List<HashMap<String, String>> employeeList = G0081Model.getColumnEmployeeList();
			List<HashMap<String, String>> actressList = G0081Model.getColumnActressList();


			//登録画面にプルダウンで必要なもの送る
			request.setAttribute("employeeList", employeeList);
			request.setAttribute("actressList", actressList);
			//
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0081View.jsp");
			dispatch.forward(request, response);
		}
		//削除の処理
		if("delete".equals(processDiv)){

			//処理に必要な情報を受け取る
			String deleteEmployeeId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deleteEmployeeId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0080Model.deletePreference(deleteEmployeeId);

				//デリート後のリストと削除処理のフラグを送る
				if(deleteFlag >= 1){
					request.setAttribute("deleteFlag", 1);
				}else{
					request.setAttribute("deleteFlag",deleteFlag);
				}
			}else{
				//nullのとき処理を行わずに返す
				request.setAttribute("deleteFlag",0);
			}
			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> preferenceList = G0080Model.getPreferenceList(employeeId, familyName, firstName);

			//削除処理後のリストを送る
			request.setAttribute("preferenceList", preferenceList);

			//検索条件保持のために送る
			request.setAttribute("employeeList", employeeId);
			request.setAttribute("actressList", familyName);
			request.setAttribute("contentsList", firstName);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0080View.jsp");
			dispatch.forward(request, response);
		}
	}
}
