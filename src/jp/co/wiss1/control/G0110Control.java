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
import jp.co.wiss1.model.G0110Model;
import jp.co.wiss1.model.G0113Model;

@WebServlet("/G0110Control")
public class G0110Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの調整
		EncodingUtils.responseEncoding(request,response);

		//どの処理を行うかの命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要となる情報を受け取る
		String artistId = request.getParameter("artistId");
		String artistName = request.getParameter("artistName");
		String companyName = request.getParameter("companyName");

		//検索(SELECT)の処理
		System.out.println("check1"+processDiv);
		if ("select".equals(processDiv)){
			//検索項目を渡し、リストを受け取る
			List <HashMap<String,String>> artistList = G0110Model.getArtistList(artistId,artistName,companyName);
			//Viewに渡すリストを設定
			if (artistList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}

			// 画面一覧へ結果を返す
			request.setAttribute("artistId",artistId);
			request.setAttribute("artistName",artistName);
			request.setAttribute("companyName",companyName);
			request.setAttribute("artistList",artistList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0110View.jsp");
			dispatch.forward(request, response);
		 }


		//登録(INSERT)①の処理
		if ("insert".equals(processDiv)){

			//会社名リストとコンテンツリストを受け取る
			List <HashMap<String,String>> columnCompanyList = G0113Model.getColumnCompanyList();
/*			List <HashMap<String,String>> columnMagazineList = G0023Model.getColumnMagazineList();
			List <HashMap<String,String>> columnDramaList = G0023Model.getColumnDramaList();
			List <HashMap<String,String>> columnMovieList = G0023Model.getColumnMovieList();
			List <HashMap<String,String>> columnCommercialList = G0023Model.getColumnCommercialList();*/

			// 会社名リストとコンテンツリストをViewへ送る
			request.setAttribute("columnCompanyList",columnCompanyList);
			/*request.setAttribute("columnMagazineList",columnMagazineList);
			request.setAttribute("columnDramaList",columnDramaList);
			request.setAttribute("columnMovieList",columnMovieList);
			//request.setAttribute("columnCommercialList",columnCommercialList);*/
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0111View.jsp");
			dispatch.forward(request, response);

			//G0111Controlへ
		 }


		//更新①の処理
				if("update".equals(processDiv)){

					//更新前の情報を引き出すための主キーを受け取る
					String updateArtistId = request.getParameter("radioButton");

					//radioButtoがnullでないならば処理を行う
					if(updateArtistId != null){

						//更新前の情報を検索メソッドで受け取る
						List<HashMap<String, String>> artistList = G0110Model.getArtistList(updateArtistId, "","");

						//更新前の情報を更新ページに飛ばす
						request.setAttribute("artistList", artistList);
						RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0112View.jsp");
						dispatch.forward(request, response);
					}else{
						//nullのとき処理を行わずに返す
						int updateFlag = 0;
						request.setAttribute("updateFlag",updateFlag);
						RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0110View.jsp");
						dispatch.forward(request, response);
					}

				}


		 //削除(DELETE)の処理
		 if ("delete".equals(processDiv)){

			//削除対象の主キーを受け取る
			String deleteArtistId = request.getParameter("radioButton");

			//削除対象の主キーを送る
			int deleteFlag = G0110Model.deleteArtist(deleteArtistId);

			//削除の項目を送り、削除後のリストを受け取る
			List <HashMap<String,String>> artistList = G0110Model.getArtistList( artistId, artistName, companyName);

			//画面一覧へ結果を返す
			if(deleteFlag != 0){
				//削除成功
				request.setAttribute("deleteFlag",1);
			}
			else{
				//削除失敗
				request.setAttribute("deleteFlag",deleteFlag);
			}
			request.setAttribute("artistList",artistList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0110View.jsp");
			dispatch.forward(request, response);
		 }
	}
}