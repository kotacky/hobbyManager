package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;
import jp.co.wiss1.common.ChangeCharacter;

public class G0111Model {

	public static void main(String args[])
	{
		insertArtist("1999", "大西ライオン","0399");
	}

	public static int insertArtist(String artistId ,String artistName, String companyId) {

		//各変数を宣言、初期化
		Connection connection = null;
    	Statement statement = null;
    	int insertCount = 0;
    	ResultSet resultSet = null;

    	//特殊文字をエスケープ文字に置き換える
		artistId = ChangeCharacter.CC(artistId);
		artistName = ChangeCharacter.CC(artistName);
		companyId = ChangeCharacter.CC(companyId);

        try
        {
        	// テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

        	//自動コミットを有効にする
        	connection.setAutoCommit(true);

        	//SQL文構築
        	 String sql = "SELECT * FROM t_artist where artist_id = '"+ artistId + "'";

			// SELECT文を実行するためのメソッド
			// このセレクト文でDBに「 Query(質問、問い合わせ) execute(実行する。)」
			//resultSet 結果をテーブル形式で保持し、色々出来るクラス
             resultSet = statement.executeQuery(sql);

             //SELECT文の結果を参照
             while(resultSet.next()) {
	             //入力されたartistIdとテーブルのartistIdを比較。同じだったらcontrolに返す。
            	 if(artistId.equals(resultSet.getString("artist_id"))||companyId.equals(resultSet.getString("company_id"))){
	            	 insertCount = 2;
	            	 return insertCount;
	             }
             }
             //artistIdが空じゃなく、かつ19始まりの半角数字だった場合
	         if(!"".equals(artistId) && artistId.matches("^(19)[0-9]{2}"))
	         {
	        	//t_artistの
	        	String insertSql = "INSERT INTO t_artist";
         		insertSql = insertSql
         			+ "(artist_id,"
         			+ "artist_name,"
         			+ "company_id)"
         			+ "VALUES('" + artistId + "'"
         			+ ",'" + artistName + "'"
         			+",'" + companyId + "');";


         		insertCount = statement.executeUpdate(insertSql);
         		System.out.println(insertSql);
             }
             else
             {
             	System.out.println("主キーが入力されていないのでINSERT文を実行しません。");

             }


             //String sql0 = "INSERT INTO t_actress (company_id , actress_name , actress_id)"
             //+ " VALUES ('" + cid + "', '" + n + "','" + aid + "')";

             System.out.println("引数に" + artistId + "が入力されました。");
             System.out.println("引数に" + artistName + "が入力されました。");
             System.out.println("引数に" + companyId + "が入力されました。");

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
