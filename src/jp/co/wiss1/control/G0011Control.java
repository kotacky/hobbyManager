package jp.co.wiss1.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.realm.RealmBase;

import jp.co.wiss1.common.EncodingUtils;
import jp.co.wiss1.model.G0011Model;
@WebServlet("/G0011Control")
public class G0011Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの設定
		EncodingUtils.responseEncoding(request,response);

		//insert処理
		//フォーム入力を受け取る
		String employeeId = request.getParameter("employeeId");
		String familyName = request.getParameter("employeeFamilyName");
		String firstName = request.getParameter("employeeFirstName");
		String familyNameRead = request.getParameter("familyNameRead");
		String employeeFirstNameRead = request.getParameter("employeeFirstNameRead");
		String birthDate = request.getParameter("birthDate");
		String from = request.getParameter("employeeFrom");
		String bloodType = request.getParameter("employeeBloodType");
		String authority = request.getParameter("employeeAuthority");
		String password = request.getParameter("employeePassword");
		String hashedPassword = RealmBase.Digest(password, "MD5", "Windows-31J");

		System.out.println("No." + employeeFirstNameRead + "確認3");

		System.out.println(hashedPassword);

		//Modelに引数を渡しinsert処理を実行させる
		int insertFlag =
		G0011Model.insertEmployee(employeeId, familyName,familyNameRead, firstName,employeeFirstNameRead, birthDate, from, bloodType, authority, hashedPassword);

		//Viewに渡すフラグを設定
		if(insertFlag == 1){
			request.setAttribute("insertFlag",insertFlag);
		}else{
			request.setAttribute("insertFlag",insertFlag);
		}
		//Viewにフラグを渡す
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0010View.jsp");
		dispatch.forward(request, response);
	}
}
