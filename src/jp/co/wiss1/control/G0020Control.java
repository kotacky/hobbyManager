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
import jp.co.wiss1.model.G0020Model;

@WebServlet("/G0020Contlrl")
public class G0020Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		// ブラウザの文字コードの調整
		EncodingUtils.responseEncoding(request,response);

		//どの処理を行うかの命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要となる情報を受け取る
		String actressId = request.getParameter("actressId");
		String actressName = request.getParameter("actressName");


		//検索(SELECT)の処理
		if ("select".equals(processDiv)){

			//検索項目を渡し、リストを受け取る
			List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,actressName);

			// 画面一覧へ結果を返す
			request.setAttribute("actressList",actressList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0020View.jsp");
			dispatch.forward(request, response);
		 }


		//登録(INSERT)①の処理
		if ("insert".equals(processDiv)){

			//会社名リストとコンテンツリストを受け取る
			List <HashMap<String,String>> columncompanyList =G0020Model.getColumnCompanyList();
			List <HashMap<String,String>> columncontentsList = G0020Model.getColumnContentsList();

			// 会社名リストとコンテンツリストをViewへ送る
			request.setAttribute("columncompanyList",columncompanyList);
			request.setAttribute("columncontentsList",columncontentsList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0021View.jsp");
			dispatch.forward(request, response);

			//G0021Controlへ
		 }


		 //更新(UPDATE)①の処理
		 if ("update".equals(processDiv)){

			// 会社名リストとコンテンツリストを受け取る
			List <HashMap<String,String>> colmncompanyList =G0020Model.getColumnCompanyList();
			List <HashMap<String,String>> columncontentsList = G0020Model.getColumnContentsList();

			//会社名リストとコンテンツリストをViewへ送る
			request.setAttribute("colmncompanyList",colmncompanyList);
			request.setAttribute("colmncontentsList",columncontentsList);
			//更新するリストを検索し、リストを受け取る
			List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,"");

			//更新するリストをView送る
			request.setAttribute("actressList",actressList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0022View.jsp");
			dispatch.forward(request, response);

			//G0022Controlへ
		 }


		 //削除(DELETE)の処理
		 if ("delete".equals(processDiv)){

			// 削除対象の主キーを受け取る
			String contentsId = request.getParameter("contentsId");

			//削除対象の主キーを送る
			int deleteFlag = G0020Model.deleteActress(actressId,contentsId);

			//削除の項目を送り、削除後のリストを受け取る
			List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,actressName);

			//画面一覧へ結果を返す
			if(deleteFlag == 1){
			//登録成功
			request.setAttribute("deleteFlag",deleteFlag);
			}
			else{
			//登録失敗
			request.setAttribute("deleteFlag",deleteFlag);
			}
			request.setAttribute("actressList",actressList);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0020View.jsp");
			dispatch.forward(request, response);
		 }
	}
}