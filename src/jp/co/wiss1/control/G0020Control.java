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

import jp.co.wiss1.common.Constants;
import jp.co.wiss1.model.G0020Model;
import jp.co.wiss1.model.G0021Model;

@WebServlet("/G0020Contlrl")
public class G0020Control extends HttpServlet{

		 public void doPost(HttpServletRequest request, HttpServletResponse response)
		 throws IOException, ServletException{

//	     ブラウザの文字コードの調整
		 request.setCharacterEncoding(Constants.CHARACTER_ENCODING);
		 response.setContentType("text/html;charset="+ Constants.CHARACTER_ENCODING);

//		 どの処理を行うかの命令を受け取る
	 	 String processDiv = request.getParameter("processDiv");

//		 処理に必要となる情報を受け取る
		 String actressId = request.getParameter("actress_id");
		 String actressName = request.getParameter("actress_name");
		 String companyName = request.getParameter("company_name");

//	 	 検索(SELECT)の処理
	 	 if ("select".equals(processDiv)){

//		   検索項目を渡し、リストを受け取る
		   List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,actressName);

//		   画面一覧へ結果を返す
		   request.setAttribute("actressList",actressList);
		   RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0020View.jsp");
		   dispatch.forward(request, response);
		 }

//		 登録(INSERT)①の処理
		 if ("insert".equals(processDiv)){

//		   会社名のリストを受け取る
		   List <HashMap<String,String>> colmncompanyList =G0021Model.getColumnCompnyList();

//		   会社名をViewへ送る
		   request.setAttribute("colmncompanyList",colmncompanyList);
		   RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0021View.jsp");
		   dispatch.forward(request, response);

//		   G0021Controlへ
		 }


//		 更新(UPDATE)①の処理
		 if ("update".equals(processDiv)){

//		   更新対象を検索し、リストを受け取る
		   List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,"");

//		   更新対象のリストを送る
		   request.setAttribute("actressList",actressList);
		   RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0022View.jsp");
		   dispatch.forward(request, response);

//		   G0022Controlへ
		 }


//		 削除(DELETE)の処理
		 if ("delete".equals(processDiv)){

//		   削除対象の主キーを受け取る
		   String deleteId = request.getParameter("actressID");

//		   削除対象の主キーを送る
		   int flag = G0020Model.deleteActress (deleteId);


//		   削除後の項目を送り、リストを受け取る
		   List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,actressName);

//		   画面一覧へ結果を返す
		   if(flag >= 1){
//		    登録成功
		    request.setAttribute("flag",31);
		   }
		   else{
//		    登録失敗
		    request.setAttribute("flag",30);
		   }
		   request.setAttribute("actressList",actressList);
		   RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0020View.jsp");
		   dispatch.forward(request, response);
		}
	}
}