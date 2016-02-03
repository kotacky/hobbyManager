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
import jp.co.wiss1.model.G0012Model;

@WebServlet("/G0012Control")
public class G0012Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//更新②の処理
		//更新する内容を受け取る
		String employeeId = request.getParameter("employeeId");
		String familyName = request.getParameter("employeeFamilyName");
		String firstName = request.getParameter("employeeFirstName");
		String familyNameRead = request.getParameter("familyNameRead");
		String firstNameRead = request.getParameter("firstNameRead");
		String birthDate = request.getParameter("birthDate");
		String from = request.getParameter("employeeFrom");
		String bloodType = request.getParameter("employeeBloodType");
		String authority = request.getParameter("employeeAuthority");
		String password = request.getParameter("employeePassword");


		String hashedPassword = RealmBase.Digest(password, "MD5", "Windows-31J");

		//更新するメソッドを呼び出す
		int updateFlag = G0012Model.updateEmployee(employeeId, familyName, firstName, birthDate, from, bloodType, authority, hashedPassword, familyNameRead, firstNameRead);

		//更新フラグを送る
		if(updateFlag == 1){
			request.setAttribute("updateFlag",updateFlag);
		}else{
			request.setAttribute("updateFlag",updateFlag);
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0010View.jsp");
		dispatch.forward(request, response);
	}
}
