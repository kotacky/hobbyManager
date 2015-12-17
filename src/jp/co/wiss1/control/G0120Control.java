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
import jp.co.wiss1.model.G0120Model;
import jp.co.wiss1.model.G0123Model;

@WebServlet("/G0120Control")
public class G0120Control extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードの調整
		EncodingUtils.responseEncoding(request,response);

		//どの処理を行うかの命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要となる情報を受け取る
		String musicId = request.getParameter("musicId");
		String musicName = request.getParameter("musicName");
		String artistName = request.getParameter("artistName");

		//検索(SELECT)の処理
		System.out.println("check1"+processDiv);
		if ("select".equals(processDiv)){

			//検索項目を渡し、リストを受け取る
			List <HashMap<String,String>> musicList = G0120Model.getMusicList(musicId,musicName,artistName);
			//Viewに渡すリストを設定
			if (musicList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}

			// 画面一覧へ結果を返す
			request.setAttribute("musicId",musicId);
			request.setAttribute("musicName",musicName);
			request.setAttribute("artistName",artistName);
			request.setAttribute("musicList",musicList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0120View.jsp");
			dispatch.forward(request, response);
		 }


		//登録(INSERT)①の処理
		if ("insert".equals(processDiv)){


			//会社名リストとコンテンツリストを受け取る
			List <HashMap<String,String>> columnArtistList = G0123Model.getColumnArtistList();

			// 会社名リストとコンテンツリストをViewへ送る
			request.setAttribute("columnArtistList",columnArtistList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0121View.jsp");
			dispatch.forward(request, response);

			//G0021Controlへ
		 }


		 //更新(UPDATE)①の処理
		 if ("update".equals(processDiv)){


			//更新対象の主キーを受け取る
			String updateMusicId = request.getParameter("radioButton");

			//ラジオボタンに印がついていない時の処理
			if(updateMusicId == null){
				request.setAttribute("updateFlag", 0);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0120View.jsp");
				dispatch.forward(request, response);
			}
			//ラジオボタンに印がついている時の処理
			else{
				//更新対象の主キーを送り、リストを受け取る
				List <HashMap<String,String>> musicList = G0120Model.getMusicList(updateMusicId,"","");

				//会社名リストとコンテンツリストを受け取る
				List <HashMap<String,String>> columnArtistList = G0123Model.getColumnArtistList();
				//会社名リストとコンテンツリストをViewへ送る
				request.setAttribute("columnArtistList",columnArtistList);
				//更新するリストをView送る
				request.setAttribute("musicList",musicList);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0122View.jsp");
				dispatch.forward(request, response);
				//G0022Controlへ
			}
		 }


		 //削除(DELETE)の処理
		 if ("delete".equals(processDiv)){

			//削除対象の主キーを受け取る
			String deleteMusicId = request.getParameter("radioButton");

			//削除対象の主キーを送る
			int deleteFlag = G0120Model.deleteMusic(deleteMusicId);

			//削除の項目を送り、削除後のリストを受け取る
			List <HashMap<String,String>> musicList = G0120Model.getMusicList(musicId,musicName,artistName);

			//画面一覧へ結果を返す
			if(deleteFlag != 0){
				//削除成功
				request.setAttribute("deleteFlag",1);
			}
			else{
				//削除失敗
				request.setAttribute("deleteFlag",deleteFlag);
			}
			request.setAttribute("musicList",musicList);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0120View.jsp");
			dispatch.forward(request, response);
		 }
	}
}