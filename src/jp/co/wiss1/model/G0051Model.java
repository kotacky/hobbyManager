package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0051Model {

	public static void main(String args[])
	{

		insertPreference("0" , "0" , "425");

	}


	public static int insertPreference(String employeeId , String actressId , String contentsId) { //女優テーブル参照

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

        	//主キーが入力されなかったとき、SQL文を実行しない
        	 String insertSql = "INSERT INTO t_preference";
             System.out.println("1:" + insertSql);

             if(!"".equals(employeeId))
             {
             	insertSql = insertSql + "(employee_id"
             			+ ",actress_id"
             			+ ",contents_id)"
             			+ "VALUES('" + employeeId + "'"
						+ ",'" + actressId + "'"
						+ ",'" + contentsId + "')";

             	insertCount = statement.executeUpdate(insertSql);
             }
             else
             {
             	System.out.println("主キーが入力されていないのでINSERT文を実行しません。");
             }

             //String sql0 = "INSERT INTO t_actress (company_id , actress_name , actress_id)"
             //+ " VALUES ('" + cid + "', '" + n + "','" + aid + "')";

             System.out.println("引数に" + employeeId + "が入力されました。");
             System.out.println("引数に" + actressId + "が入力されました。");
             System.out.println("引数に" + contentsId + "が入力されました。");

             System.out.println(insertSql);

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
