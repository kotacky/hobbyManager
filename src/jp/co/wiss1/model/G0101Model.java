package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0101Model {

	public static void main(String args[])
	{

		insertTelevision("310" , "劇団四季" , "岡山");

	}

	//テレビ局テーブル参照
	public static int insertTelevision(String televisionId , String televisionName , String televisionAddress) {
		//各変数を宣言、初期化
    	Connection connection = null;
    	Statement statement = null;
    	int insertCount = 0;


        try
        {
        	// テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

        	//自動コミットを有効にする
        	connection.setAutoCommit(true);

        	//主キーが入力されなかったとき、、かつ半角数字でなかったときにSQL文を実行しない
        	//テーブルに追加
        	 String insertSql = "INSERT INTO t_television";
             System.out.println("1:" + insertSql);

             if(!"".equals(televisionId) && televisionId.matches("[0-9]{4}"))
             {
             	insertSql = insertSql + "(television_id"
             			+ ",television_name"
             			+ ",television_address)"
             			+ "VALUES('" + televisionId + "'"
             			+ ",'" + televisionName + "'"
 						+ ",'" + televisionAddress + "')";

             	insertCount = statement.executeUpdate(insertSql);
             }
             else
             {
             	System.out.println("主キーが入力されていないのでINSERT文を実行しません。");
             }

             //String sql0 = "INSERT INTO t_actress (company_id , actress_name , actress_id)"
             //+ " VALUES ('" + cid + "', '" + n + "','" + aid + "')";

             System.out.println("引数に" + televisionId + "が入力されました。");
             System.out.println("引数に" + televisionName + "が入力されました。");
             System.out.println("引数に" + televisionAddress + "が入力されました。");

             System.out.println(insertSql);

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

//四次元バッグ～～