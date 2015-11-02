package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0090Model// git
{

	/**
	 * 一覧取得メソッド
	 * @return List ～～情報
	 */
	public static List<HashMap<String,String>> getGenreList(String genreId , String genreName){
		List<HashMap<String, String>> genreList = new ArrayList<HashMap<String, String>>() ;

		ResultSet resultSet = null;
		Connection connection = null;
		Statement statement = null;
		try {

			/* ここから下記括りまでがDBへのアクセスするお約束*/
			// テーブル照会実行
			// データベースへの接続情報を保持、登録
			// ドライバ/サーバ/ポート/DB名/ユーザー名/パスワード
			connection = DBAccessUtils.getConnection();
			// statement作成
			// この接続情報でSQL流すぞー！！！っていう声明みたいなもの
			statement = connection.createStatement();
			// 自動コミットを無効にする

			connection.setAutoCommit(false);
			/*-----------------------------------------------*/

			/*SQL文構築*/

			String sql = "SELECT * FROM t_genre where ";

			if(!"".equals(genreId)) {
				sql = sql + "genre_id = '"+ genreId +"' AND ";
			}
			sql = sql + "genre_name like '%"+ genreName +"%'";
			sql = sql + " ORDER BY genre_id";
			/*SQL文終了*/

			// SELECT文を実行するためのメソッド
			// このセレクト文でDBに「 Query(質問、問い合わせ) execute(実行する。)」
			// resultSet 結果をテーブル形式で保持し、色々出来るクラス
            resultSet = statement.executeQuery(sql);
            //上記文章にて、設定した内容を元にSQL(postgres)アクセス！！

            //SELECT文の結果を参照
            while(resultSet.next()) {
				HashMap<String, String> genreInfo = new HashMap<String, String>();
				genreInfo.put("genreId", resultSet.getString("genre_id"));
				genreInfo.put("genreName", resultSet.getString("genre_name"));


//				System.out.println(genreInfo.get("genreId"));
//				System.out.println(genreInfo.get("genreName"));


				// 返却用Listに設定
				genreList.add(genreInfo);

            }
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
        	System.out.println("SQL failed");
			e.printStackTrace();	        }
	        finally{
/*データベースのクローズ*/
	        	try {
	        		resultSet.close();
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
	        return genreList;
		}





		/*テーブルの削除*/
		public static int deletegenre(String genreId) {

			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            /*テーブル照会実行*/
	        	/*データベースへ接続*/
				connection = DBAccessUtils.getConnection();
				/*Statementを取得するためのコード*/
				statement = connection.createStatement();

				/*自動コミットを有効にする*/
				connection.setAutoCommit(true);

				String sql = "DELETE FROM t_genre where genre_id = '"+ genreId +"'";
				System.out.println("引数に" + genreId + "が入力されました。");
				System.out.println(sql);

				deleteCount = statement.executeUpdate (sql);

				/*削除が成功しているかどうかの確認*/
				if(deleteCount == 1){
				System.out.println("削除成功");
				}
				else{
					System.out.println("削除失敗");
				}
			}
			/*エラーの情報*/
			catch (SQLException e){
			System.err.println("SQL failed.");
			e.printStackTrace ();
			}
		finally{
		}
	return deleteCount;
	}

}

