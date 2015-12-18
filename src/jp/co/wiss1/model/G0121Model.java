package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.ChangeCharacter;
import jp.co.wiss1.common.DBAccessUtils;

public class G0121Model {

	public static void main(String args[])
	{
		insertMusic("1310" , "あああ" , "0210");
	}

	//所属会社テーブルにINSERTするメソッド
	public static int insertMusic
	(String musicId , String musicName , String artistId)
	{

		//各変数を宣言、初期化
    	Connection connection = null;//DBにアクセス、ログインするメソッドの値を格納する変数
    	Statement statement = null;//SQL文をDBに送るための変数
    	int insertCount = 0;//変更があった行数を格納
    	ResultSet resultSet = null;

        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();//DBに接続
        	statement = connection.createStatement();//SQL文をDBに送信

            //自動コミットを有効にする
        	connection.setAutoCommit(true);


        	//エスケープ文字に置き換え
        	 musicName = ChangeCharacter.CC(musicName);


        	//SQL文構築
        	//actress_idをt_actressから取得
        	 String sql = "SELECT * FROM t_music where music_id = '"+ musicId + "'";

			// SELECT文を実行するためのメソッド
			// このセレクト文でDBに「 Query(質問、問い合わせ) execute(実行する。)」
			//resultSet 結果をテーブル形式で保持し、色々出来るクラス
             resultSet = statement.executeQuery(sql);

             //SELECT文の結果を参照
             while(resultSet.next()) {
	             //入力されたactressIdとテーブルのactressIdを比較。同じだったらcontrolに返す。
            	 if(musicId.equals(resultSet.getString("music_id"))||artistId.equals(resultSet.getString("artist_id")))
            	 {
	            	 insertCount = 2;
	            	 return insertCount;
	             }
             }

           //主キーが入力されなかったとき、、かつ半角数字でなかったときにSQL文を実行しない

             if(!"".equals(musicId) && musicId.matches("^(11)[0-9]{2}"))
             {
            	 String insertSql = "INSERT INTO t_music";
            	 insertSql = insertSql + "(music_id, music_name, artist_id) "
             			+ "VALUES "
            			+"('" + musicId + "','" + musicName + "','" +  artistId + "')";

             	insertCount = statement.executeUpdate(insertSql);
                //どのようなSQL文が入っているか出力
                System.out.println(insertSql);
             }
             else
             {
             	System.out.println("主キーが入力されていないのでINSERT文を実行しません。");
             }

             //String sql0 = "INSERT INTO t_actress (company_id , actress_name , actress_id)"
             //+ " VALUES ('" + cid + "', '" + n + "','" + aid + "')";


             System.out.println("引数に" + musicId + "が入力されました。");
             System.out.println("引数に" + musicName + "が入力されました。");
             System.out.println("引数に" + artistId + "が入力されました。");
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


//ぼくなかえもんです。