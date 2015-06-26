package jp.co.wiss1.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0020Model;
import jp.co.wiss1.model.G0050Model;
import jp.co.wiss1.model.G0051Model;

@WebServlet("/G0050Control")
public class G0050Control extends HttpServlet{
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
			List<HashMap<String, String>> preferenceList = G0050Model.getPreferenceList(employeeId, familyName, firstName);

			List<HashMap<String, String>> prefereList = new ArrayList<HashMap<String, String>>() ;
			for(int i = 0; i <  prefereList.size(); i++){
				HashMap<String, String> employeePreference = new HashMap<String, String>();
				employeePreference.put("employeeId", preferenceList.get(i).get("employeeId"));
				employeePreference.put("employeeFamilyName", preferenceList.get(i).get("employeeFamilyName"));
				employeePreference.put("employeeFirstName", preferenceList.get(i).get("employeeFirstName"));
				if(preferenceList.get(i).get("employeeId").equals(preferenceList.get(i+1).get("employeeId"))){
					employeePreference.put("actressName", preferenceList.get(i).get("actressName"));
					String str = preferenceList.get(i).get("contentsName");
					for(int j = 0; j < prefereList.size(); j++){
						if(preferenceList.get(i).get("actressId").equals(preferenceList.get(i+1).get("actressId"))){
							str += "、"+preferenceList.get(i).get("contentsName");
						}else{
							employeePreference.put("contentsName", str);
							break;
						}
					}
				}else{
					prefereList.add(employeePreference);
					continue;
				}
			}
			//結果をViewに送る
			request.setAttribute("preferenceList", prefereList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
			dispatch.forward(request, response);
		}

		//登録①の処理
		if("insert".equals(processDiv)){

			//登録画面に必要な要素を引き出す
			List<HashMap<String, String>> employeeList = G0051Model.getColumnEmployeeList();
			List<HashMap<String, String>> actressList = G0051Model.getColumnActressList();
			List<HashMap<String, String>> contentsList = G0020Model.getColumnContentsList();

			//登録画面にプルダウンで必要なもの送る
			request.setAttribute("employeeList", employeeList);
			request.setAttribute("actressList", actressList);
			request.setAttribute("contentsList", contentsList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0051View.jsp");
			dispatch.forward(request, response);
		}
		//削除の処理
		if("delete".equals(processDiv)){

			//処理に必要な情報を受け取る
			String deleteEmployeeId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deleteEmployeeId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0050Model.deletePreference(deleteEmployeeId);

				//デリート後のリストを検索メソッドで取り出す
				List<HashMap<String, String>> preferenceList = G0050Model.getPreferenceList(employeeId, familyName, firstName);

				//デリート後のリストと削除処理のフラグを送る
				request.setAttribute("preferenceList", preferenceList);
				if(deleteFlag == 1){
					request.setAttribute("deleteFlag",deleteFlag);
				}else{
					request.setAttribute("deleteFlag",deleteFlag);
				}
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
				dispatch.forward(request, response);
			}else{
				//nullのとき処理を行わずに返す
				List<HashMap<String, String>> preferenceList = G0050Model.getPreferenceList(employeeId, familyName, firstName);
				int deleteFlag = 0;
				request.setAttribute("deleteFlag",deleteFlag);
				request.setAttribute("preferenceList", preferenceList);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0050View.jsp");
				dispatch.forward(request, response);
			}
		}
	}
}
