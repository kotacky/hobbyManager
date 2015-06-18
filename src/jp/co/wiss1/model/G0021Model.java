package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0021Model {

	public static void main(String args[])
	{
		insertActress("30" , "南沢　奈央" , "50" , "70");
		//getColumnCompnyList("");
	}


	public static int insertActress(String companyId , String actressName , String actressId , String contentsId) //女優テーブルにINSERTするメソッド
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
            insertCount = statement.executeUpdate(insertSql);
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



	public static List<HashMap<String,String>> getColumnCompnyList() //プルダウン表示に必要なカラムデータを送るメソッド
	{
		List<HashMap<String,String>> companyColumnList = new ArrayList<HashMap<String,String>>() ;//DBから取得した

		//各変数を宣言、初期化
		ResultSet resultSet = null;
    	Connection connection = null;
    	Statement statement = null;


        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            //自動コミットを無効にする
        	connection.setAutoCommit(false);

        	//プルダウン用にカラム名を取得
            String columnSelectSql = "SELECT company_name FROM t_company";
            System.out.println("1:" + columnSelectSql);

            //引数に入った値を出力
            //System.out.println("引数に" + companyName + "が入力されました。");
            System.out.println(columnSelectSql);

            //String selectSql = "SELECT * FROM t_employee where employee_id like '119' ORDER BY employee_id";
            //System.out.println(selectSql);

            resultSet = statement.executeQuery (columnSelectSql);

            //影響のあった行数を出力

            //System.out.println(insertCount + " 行挿入しました。");


           // テーブル照会結果を出力
           while(resultSet.next())
           {
            	//社員情報を作成する
            	HashMap<String, String> employeeInfo = new HashMap<String, String>();
            	employeeInfo.put("会社名", resultSet.getString("company_name"));

            	//社員情報をリストに追加する
            	companyColumnList.add(employeeInfo);

            	//リストに入ったかの確認
            	System.out.println(employeeInfo.get("会社名"));

			}

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
        return companyColumnList;
	}
}