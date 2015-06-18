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

		insertPreference("100" , "111");

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
             	insertSql = insertSql + "(employee_id"
             			+ ",contents_id"
             			+ ",company_address"
             			+ ",company_id)"
             			+ "VALUES('" + employeeId + "'"
						+ ",'" + actressId + "')";
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



	public static List<HashMap<String,String>> getColumnEmployeeList() //プルダウン表示に必要なカラムデータを送るメソッド
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
            String columnSelectSql = "SELECT employee_id, FROM t_company";
            System.out.println("1:" + columnSelectSql);

            //引数に入った値を出力
            //System.out.println("引数に" + companyName + "が入力されました。");
            //System.out.println(columnSelectSql);

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