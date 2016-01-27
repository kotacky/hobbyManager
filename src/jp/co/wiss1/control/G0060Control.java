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
		String process = request.getParameter("process");

		//処理に必要な情報を受け取る
		String movieId = request.getParameter("movieId");
		String title = request.getParameter("movieName");
		String releaseDate = request.getParameter("releaseDate");
		String movieGenre = request.getParameter("movieGenre");
		//検索の処理
		if("select".equals(process)){

			//検索に必要なものを引数、検索結果のリストを戻り値としてメソッドを呼び出す。
			List<HashMap<String, String>> movieList = G0060Model.getMovieList(movieId, title, releaseDate, movieGenre);

			//検索結果をViewに送る
			if (movieList.size() < 1) {
				//Viewに渡すメッセージを設定
				request.setAttribute("message", "該当データがありません。");
			}
			request.setAttribute("movieList", movieList);

			//検索条件保持のために送る
			request.setAttribute("moviename", title);
			request.setAttribute("releaseDate", releaseDate);
			request.setAttribute("movieId", movieId);
			request.setAttribute("movieGenre", movieGenre);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0060View.jsp");
			dispatch.forward(request, response);
		}

		//更新①の処理
		if("update".equals(process)){

			//更新前の情報を引き出すためのラジオボタン入力を受け取る
			//idを受け取る
			String updateMovieId = request.getParameter("radioButton");

			//radioButtoがnullならば処理を行う
			if(updateMovieId == null){
				request.setAttribute("updateFlag", 0);
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0060View.jsp");
				System.out.println(dispatch);
				dispatch.forward(request, response);
			}
			else{
				//Modelに引数を渡し、検索結果をリストに入れる
				List<HashMap<String,String>> movieList = G0060Model.getMovieList(updateMovieId, title, releaseDate, movieGenre);

				//Viewに渡すリストを設定
				request.setAttribute("movieList", movieList);

				//Viewにリストを渡す
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view/G0062View.jsp");
				dispatch.forward(request, response);
			}
		}

		//削除の処理
		if("delete".equals(process)){

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
			List<HashMap<String, String>> movieList = G0060Model.getMovieList(movieId, title, releaseDate, movieGenre);

			//削除処理後のリストを送る
			request.setAttribute("movieList", movieList);

			//検索条件保持のために送る
			request.setAttribute("movieId", movieId);
			request.setAttribute("movieName", title);
			request.setAttribute("releaseDate", releaseDate);
			request.setAttribute("movieGenre", movieGenre);
			RequestDispatcher dispatch =getServletContext().getRequestDispatcher("/view/G0060View.jsp");
			dispatch.forward(request, response);
		}
	}
}
