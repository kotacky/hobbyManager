package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0061Model {

	public static void main(String args[])
	{

		insertMovie("" , "子ずれ狼" , "大河ドラマ","");

	}

	//映画テーブル参照
	public static int insertMovie(String movieId , String movieTitle , String releaseDate , String movieGenre) {

		//各変数を宣言、初期化
    	Connection connection = null;
    	Statement statement = null;
    	int insertCount = 0;
    	ResultSet resultSet = null;

        try
        {
        	// 映画照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

        	//自動コミットを有効にする
        	connection.setAutoCommit(true);

        	//SQL文構築
        	//company_idをt_companyから取得
        	 String sql = "SELECT * FROM t_movie where movie_id = '"+ movieId + "'";

			// SELECT文を実行するためのメソッド
			// このセレクト文でDBに「 Query(質問、問い合わせ) execute(実行する。)」
			//resultSet 結果をテーブル形式で保持し、色々出来るクラス
             resultSet = statement.executeQuery(sql);

             //SELECT文の結果を参照
             while(resultSet.next()) {
	             //入力されたcompanyIdとテーブルのcompanyIdを比較。同じだったらcontrolに返す。
            	 if(movieId.equals(resultSet.getString("movie_id"))){
	            	 insertCount = 2;
	            	 return insertCount;
	             }
             }
        	//主キーが入力されなかったとき、、かつ半角数字でなかったときにSQL文を実行しない


             if(!"".equals(movieId) && movieId.matches("^(06)[0-9]{2}"))
             {
            	 String insertSql = "INSERT INTO t_movie";
                 System.out.println("1:" + insertSql);

            	 insertSql = insertSql + "(movie_id"
             			+ ",movie_title"
             			+ ",release_date"
             			+ ",movie_genre)"
             			+ "VALUES('" + movieId + "'"
             			+ ",'" + movieTitle + "'"
 						+ ",'" + releaseDate + "'"
 						+ ",'" + movieGenre + "')";

             	insertCount = statement.executeUpdate(insertSql);
                System.out.println(insertSql);
             }
             else
             {
             	System.out.println("主キーが入力されていないのでINSERT文を実行しません。");
             }


             System.out.println("引数に" + movieId + "が入力されました。");
             System.out.println("引数に" + movieTitle + "が入力されました。");
             System.out.println("引数に" + releaseDate + "が入力されました。");
             System.out.println("引数に" + movieGenre + "が入力されました。");


             //rs0 = stmt0.executeQuery (sql0);

             //影響のあった行数を出力

             System.out.println(insertCount + " 行挿入しました。");
         }
         catch (SQLException e)
         {
             System.err.println("SQL failed.");
             e.printStackTrace ();
         }
         finally
         {
 			// データベースのクローズ
         	try
         	{
                 //resultSet.close();
                 statement.close();
                 connection.close();
         	}
         	catch (Exception e)
         	{
         		System.out.println("Close failed.");
         	}
         	System.out.println("一覧取得処理終了");
         }
        return insertCount;
 	}
}

//ぼくのサーヴァントは最強なんだ！(集中線)