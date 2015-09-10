package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0060Model {

		public static void main(String[] args)
		{
			getMovieList("", "", "");
			deleteMovie("0");
		}

		public static List<HashMap<String, String>> getMovieList(String movieId , String movieTitle , String releaseDate)	//映画テーブル参照
		{

			List<HashMap<String, String>> movieList = new ArrayList<HashMap<String, String>>() ;
			ResultSet resultSet = null;															//初期化
			Connection connection = null;
			Statement statement = null;


	        try{
	            // テーブル照会実行
		    	connection = DBAccessUtils.getConnection(); 									//データベースへ接続
		    	statement = connection.createStatement();										//Statementを取得するためのコード

		        connection.setAutoCommit(false);												//自動コミットを無効にする


	            String sql = "SELECT * FROM t_movie where ";									//sql文一覧
	            System.out.println("1:" + sql);

	        	if(!"".equals(movieId)) {
	        		sql = sql + "movie_id = '"+ movieId +"' AND ";
	        		System.out.println("2:" + sql);
	        	}
	        	if(!"".equals(movieTitle)) {
	        		sql = sql + "movie_title like '%"+ movieTitle +"%' AND ";
	        		System.out.println("3:" + sql);
	        	}
	        		sql = sql + "release_date '%"+ releaseDate +"%'";
	        		sql = sql + " ORDER BY movie_id";
	        		System.out.println("4:" + sql);												//sql文終了

	            System.out.println("引数に" + movieId + "が入力されました。");
	            System.out.println("引数に" + movieTitle + "が入力されました。");
	            System.out.println("引数に" + releaseDate + "が入力されました。");
	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード



	            while(resultSet.next()) {														//SELECT文の結果を参照

	        	   HashMap<String, String> movieInfo = new HashMap<String, String>();
	        	   movieInfo.put("movieId", resultSet.getString("movie_id"));
	        	   movieInfo.put("movieTitle", resultSet.getString("movie_title"));
	        	   movieInfo.put("releaseDate", resultSet.getString("release_date"));

	        	   movieList.add(movieInfo);

	            	System.out.println(movieInfo.get("movieId"));						//リストに入ったかの確認
	            	System.out.println(movieInfo.get("movieTitle"));
	            	System.out.println(movieInfo.get("releaseDate"));
	            }

	        }
	        catch (SQLException e) {
	        	System.out.println("SQL failed");
	        	e.printStackTrace();
	        }
	        finally{

	        	try {
	        		resultSet.close();															//データベースのクローズ
	        		statement.close();
	        		connection.close();
	        	}
	        	catch (Exception e){
	        		System.err.println("SQL failed.");
	        		e.printStackTrace ();
	        	}
	        	finally {
	        	}
	        }
	        return movieList;
		}






		public static int deleteMovie(String movieId) {	 								//映画テーブル削除


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();										//DBへ接続
	        	statement = connection.createStatement();										//Statementを取得するためのコード

	            connection.setAutoCommit(true);													//自動コミットを有効にする

	            String sql = "DELETE FROM t_movie where movie_id = '"+ movieId +"'";
	            System.out.println("引数に" + movieId + "が入力されました。");
	            System.out.println(sql);

	            deleteCount = statement.executeUpdate (sql);

	            if(deleteCount == 1){															//削除が成功しているかどうかの確認
	            	System.out.println("削除成功");
	            }
	            else{
	            	System.out.println("削除失敗");
	            }
	        }
			catch (SQLException e){
			System.err.println("SQL failed.");
			e.printStackTrace ();																//エラーの情報
			}
			finally{
			}
		return deleteCount;
		}

	}

