package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0021Model {

	public static void main(String args[])
	{
		insertActress("" , "" , "0" , "0");
	}


	public static int insertActress(String companyId , String actressName , String actressId , String contentsId) ////所属会社テーブルにINSERTするメソッド
	{

		//各変数を宣言、初期化
    	Connection connection = null;//DBにアクセス、ログインするメソッドの値を格納する変数
    	Statement statement = null;//SQL文をDBに送るための変数
    	int insertCount = 0;//変更があった行数を格納

        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();//DBに接続
        	statement = connection.createStatement();//SQL文をDBに送信

            //自動コミットを有効にする
        	connection.setAutoCommit(true);

        	//主キーが入力されなかったとき、SQL文を実行しない
            String insertSql = "INSERT INTO t_actress";//変数insertSqlにSQL文を代入

            if(!"".equals(companyId))//変数companyId(主キー)に値が入力されているとき、if文内のSQL文を実行する
            {
            	//SQL文
            	insertSql = insertSql + "(company_id"
            			+ ",actress_name"
            			+ ",actress_id"
            			+ ",contents_id)"
            			+ "VALUES('" + companyId + "'"
            			+ ",'" + actressName + "'"
						+ ",'" + actressId + "'"
						+ ",'" + contentsId + "')";

            	insertCount = statement.executeUpdate(insertSql);
            }
            else
            {
            	System.out.println("主キーが入力されていないのでINSERT文を実行しません。");//SQL文が実行されなかったときの処理
            }

            //各引数にどのような値が入っているか確認する
            System.out.println("引数に" + companyId + "が入力されました。");
            System.out.println("引数に" + actressName + "が入力されました。");
            System.out.println("引数に" + actressId + "が入力されました。");
            System.out.println("引数に" + contentsId + "が入力されました。");

            //どのようなSQL文が入っているか出力
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