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
import jp.co.wiss1.model.G0060Model;

@WebServlet("/G0060Control")
public class G0060Control extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		//ブラウザの文字コードで返す
		EncodingUtils.responseEncoding(request,response);

		//Viewから処理命令を受け取る
		String processDiv = request.getParameter("processDiv");

		//処理に必要な情報を受け取る
		String movieId = request.getParameter("movieId");
		String title = request.getParameter("movieName");
		String releaseDate = request.getParameter("releaseDate");

		//検索の処理
		if("select".equals(processDiv)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> movieList = G0060Model.getMovieList(movieId, title, releaseDate);

			//検索結果をViewに送る
			request.setAttribute("movieList", movieList);

			//検索条件保持のために送る
			request.setAttribute("moviename", title);
			request.setAttribute("releaseDate", releaseDate);
			request.setAttribute("movieId", movieId);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0060View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(processDiv)){

			//更新前の情報を引き出すための主キーを受け取る
			String updateMovieId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(updateMovieId != null){

				//更新前の情報を検索メソッドで受け取る
				List<HashMap<String, String>> movieList = G0060Model.getMovieList(updateMovieId, "", "");

				//更新前の情報を更新ページに飛ばす
				request.setAttribute("movieList", movieList);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0062View.jsp");
				dispatch.forward(request, response);
			}else{
				//nullのとき処理を行わずに返す
				int updateFlag = 0;
				request.setAttribute("updateFlag",updateFlag);
				RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0060View.jsp");
				dispatch.forward(request, response);
			}

		}

		//削除の処理
		if("delete".equals(processDiv)){

			//削除に必要な情報を受け取る
			String deleteMovieId = request.getParameter("radioButton");

			//radioButtoがnullでないならば処理を行う
			if(deleteMovieId != null){

				//デリートのメソッドを呼ぶ
				int deleteFlag = G0060Model.deleteMovie(deleteMovieId);

				//デリート後のリストと削除完了のフラグを送る

					request.setAttribute("deleteFlag",deleteFlag);
			}else{

				//nullのとき処理を行わずに返す
				request.setAttribute("deleteFlag",0);
			}
			//デリート後のリストを検索メソッドで取り出す
			List<HashMap<String, String>> movieList = G0060Model.getMovieList(movieId, title, releaseDate);

			//削除処理後のリストを送る
			request.setAttribute("movieList", movieList);

			//検索条件保持のために送る
			request.setAttribute("movieId", movieId);
			request.setAttribute("movieName", title);
			request.setAttribute("releaseDate", releaseDate);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0060View.jsp");
			dispatch.forward(request, response);
		}
	}
}
