package jp.co.wiss1.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.wiss1.model.G0001Model;


public class G0001Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		response.setContentType("text/html;charset=Shift_JIS");//ブラウザの文字コードはＪＩＳで返す
		//フォーム入力を受け取る
		Object val1 = request.getAttribute("employee_id");
		Object val2 = request.getAttribute("employee_family_name");
		Object val3 = request.getAttribute("employee_first_name");

		List<HashMap> employeeList = G0001Model.getEmployeeList();

			String disp1 = "/view/G0010View.jsp";
			//int size = employeeList.size();
			//request.setAttribute("Listsize", size);
			request.setAttribute("EmployeeList", employeeList);
			RequestDispatcher dispatch = request.getRequestDispatcher(disp1);
			dispatch.forward(request, response);
/*
			for(int i = 0; i < size; i++){
			request.setAttribute("employeeId", employeeList.get(i).get(""));
			request.setAttribute("employeeFamilyName", employeeList.get(i).get(""));
			request.setAttribute("emplyeeFirstName", employeeList.get(i).get(""));
			request.setAttribute("employeeBirth", employeeList.get(i).get(""));
			dispatch.forward(request, response);
			}*/
	}

}
