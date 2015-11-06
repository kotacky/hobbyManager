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
import jp.co.wiss1.model.G0023Model;

@WebServlet("/G0020Control")
public class G0020Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの調整
		EncodingUtils.responseEncoding(request,response);

		//どの処理を行うかの命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要となる情報を受け取る
		String actressId = request.getParameter("actressId");
		String actressName = request.getParameter("actressName");
//		String birthDate = request.getParameter("birthDate");
//		String bloodType = request.getParameter("bloodType");
//		String birthPlace = request.getParameter("birthPlace");

		//検索(SELECT)の処理
		if ("select".equals(processDiv)){

			//検索項目を渡し、リストを受け取る
			List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,actressName);
			//Viewに渡すリストを設定
			if (actressList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}

			// 画面一覧へ結果を返す
			request.setAttribute("actressId",actressId);
			request.setAttribute("actressName",actressName);
//			request.setAttribute("birthDate",birthDate);
//			request.setAttribute("bloodType",bloodType);
//			request.setAttribute("actressName",birthPlace);
			request.setAttribute("actressList",actressList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0020View.jsp");
			dispatch.forward(request, response);
		 }


		//登録(INSERT)①の処理
		if ("insert".equals(processDiv)){

			//会社名リストとコンテンツリストを受け取る
			List <HashMap<String,String>> columnCompanyList = G0023Model.getColumnCompanyList();
			List <HashMap<String,String>> columnMagazineList = G0023Model.getColumnMagazineList();
			List <HashMap<String,String>> columnDramaList = G0023Model.getColumnDramaList();
			List <HashMap<String,String>> columnMovieList = G0023Model.getColumnMovieList();
			List <HashMap<String,String>> columnCommercialList = G0023Model.getColumnCommercialList();

			// 会社名リストとコンテンツリストをViewへ送る
			request.setAttribute("columnCompanyList",columnCompanyList);
			request.setAttribute("columnMagazineList",columnMagazineList);
			request.setAttribute("columnDramaList",columnDramaList);
			request.setAttribute("columnMovieList",columnMovieList);
			request.setAttribute("columnCommercialList",columnCommercialList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0021View.jsp");
			dispatch.forward(request, response);

			//G0021Controlへ
		 }


		 //更新(UPDATE)①の処理
		 if ("update".equals(processDiv)){


			//更新対象の主キーを受け取る
			String updateActressId = request.getParameter("radioButton");

			//ラジオボタンに印がついていない時の処理
			if(updateActressId == null){
				request.setAttribute("updateFlag",0);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0020View.jsp");
				dispatch.forward(request, response);
			}
			//ラジオボタンに印がついている時の処理
			else{
				//更新対象の主キーを送り、リストを受け取る
				List <HashMap<String,String>> actressList = G0020Model.getActressList(updateActressId,"");

				//会社名リストとコンテンツリストを受け取る
				List <HashMap<String,String>> columnCompanyList = G0023Model.getColumnCompanyList();
				List <HashMap<String,String>> columnMagazineList = G0023Model.getColumnMagazineList();
				List <HashMap<String,String>> columnDramaList = G0023Model.getColumnDramaList();
				List <HashMap<String,String>> columnMovieList = G0023Model.getColumnMovieList();
				List <HashMap<String,String>> columnCommercialList = G0023Model.getColumnCommercialList();

				//会社名リストとコンテンツリストをViewへ送る
				request.setAttribute("columnCompanyList",columnCompanyList);
				request.setAttribute("columnMagazineList",columnMagazineList);
				request.setAttribute("columnDramaList",columnDramaList);
				request.setAttribute("columnMovieList",columnMovieList);
				request.setAttribute("columnCommercialList",columnCommercialList);

				//更新するリストをView送る
				request.setAttribute("actressList",actressList);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0022View.jsp");
				dispatch.forward(request, response);
				//G0022Controlへ
			}
		 }


		 //削除(DELETE)の処理
		 if ("delete".equals(processDiv)){

			//削除対象の主キーを受け取る
			String deleteActressId = request.getParameter("radioButton");

			//削除対象の主キーを送る
			int deleteFlag = G0020Model.deleteActress(deleteActressId);

			//削除の項目を送り、削除後のリストを受け取る
			List <HashMap<String,String>> actressList = G0020Model.getActressList(actressId,actressName);

			//画面一覧へ結果を返す
			if(deleteFlag != 0){
				//削除成功
				request.setAttribute("deleteFlag",1);
			}
			else{
				//削除失敗
				request.setAttribute("deleteFlag",deleteFlag);
			}
			request.setAttribute("actressList",actressList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0020View.jsp");
			dispatch.forward(request, response);
		 }
	}
}