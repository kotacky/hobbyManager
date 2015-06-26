package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0051Model {

	public static void main(String args[])
	{

		insertPreference("128" , "0");
		getColumnEmployeeList();
		getColumnActressList();
	}


	public static int insertPreference(String employeeId , String actressId) { //女優テーブル参照

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
             	insertSql = insertSql + "(employee_id, actress_id)"
             			+ "VALUES('" + employeeId + "'"
						+ ",'" + actressId + "')";

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


	public static List<HashMap<String,String>> getColumnEmployeeList() //プルダウン表示に必要な社員データを送るメソッド
	{
		List<HashMap<String,String>> companyColumnList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
            String columnSelectSql = "SELECT employee_id , employee_family_name , employee_first_name FROM t_employee";
            System.out.println("1:" + columnSelectSql);

            resultSet = statement.executeQuery (columnSelectSql);

           // テーブル照会結果を出力
           while(resultSet.next())
           {
            	//社員情報を作成する
            	HashMap<String, String> employeeInfo = new HashMap<String, String>();
            	employeeInfo.put("employeeId", resultSet.getString("employee_id"));
            	employeeInfo.put("employeeFamilyName", resultSet.getString("employee_family_name"));
            	employeeInfo.put("employeeFirstName", resultSet.getString("employee_first_name"));

            	//社員情報をリストに追加する
            	companyColumnList.add(employeeInfo);

            	//リストに入ったかの確認
            	System.out.println(employeeInfo.get("employeeId"));
            	System.out.println(employeeInfo.get("employeeFamilyName"));
            	System.out.println(employeeInfo.get("employeeFirstName"));
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


	public static List<HashMap<String,String>> getColumnActressList() //プルダウン表示に必要な女優データを送るメソッド
	{
		List<HashMap<String,String>> companyColumnList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
	        String columnSelectSql = "SELECT distinct actress_id , actress_name FROM t_actress ORDER BY actress_id";
	        System.out.println("1:" + columnSelectSql);

	        resultSet = statement.executeQuery (columnSelectSql);

	       // テーブル照会結果を出力
	       while(resultSet.next())
	       {
	        	//社員情報を作成する
	        	HashMap<String, String> actressInfo = new HashMap<String, String>();
	        	actressInfo.put("actressId", resultSet.getString("actress_id"));
	        	actressInfo.put("actressName", resultSet.getString("actress_name"));

	        	//社員情報をリストに追加する
	        	companyColumnList.add(actressInfo);

	        	//リストに入ったかの確認
	        	System.out.println(actressInfo.get("actressId"));
	        	System.out.println(actressInfo.get("actressName"));

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
