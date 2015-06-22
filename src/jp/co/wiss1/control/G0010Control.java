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
import jp.co.wiss1.model.G0010Model;

@WebServlet("/G0010Control")
public class G0010Control extends HttpServlet{
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
			List<HashMap<String, String>> employeeList = G0010Model.getEmployeeList(employeeId, familyName, firstName);

			//検索結果をViewに送る
			request.setAttribute("employeeList", employeeList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0010View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すための主キーを受け取る
			String updateEmployeeId = request.getParameter("radioButton");

			//更新前の情報を検索メソッドで受け取る
			List<HashMap<String, String>> employeeList = G0010Model.getEmployeeList(updateEmployeeId, "", "");

			//更新前の情報を更新ページに飛ばす
			request.setAttribute("employeeList", employeeList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0012View.jsp");
			dispatch.forward(request, response);
		}

		//削除の処理
		if ("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deleteEmployeeId = request.getParameter("radioButton");

			//デリートのメソッドを呼ぶ
			int deleteFlag = G0010Model.deleteEmployee(deleteEmployeeId);

			//デリート後のリストを検索メソッドで取り出す
			List <HashMap<String, String>> employeeList = G0010Model.getEmployeeList(employeeId,familyName,firstName);

			//デリート後のリストと削除完了のフラグを送る
			request.setAttribute("employeeList",employeeList);
			if(deleteFlag == 1){
				request.setAttribute("deleteFlag",deleteFlag);
			}else{
				request.setAttribute("deleteFlag",deleteFlag);
			}
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0010View.jsp");
			dispatch.forward(request, response);
		}
	}
}
