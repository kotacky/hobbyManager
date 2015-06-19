package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0020Model
{

	public static void main(String[] args)
	{
		getActressList("202", "");
		deleteActress("0", "0");
		getColumnCompanyList();
		getColumnContentsList();
	}


	public static List<HashMap<String, String>> getActressList(String actressId, String actressName)	//女優テーブル参照
	{

		List<HashMap<String, String>> actressList = new ArrayList<HashMap<String, String>>() ;
		ResultSet resultSet = null;																		//初期化
		Connection connection = null;
		Statement statement = null;


        try{

	    	connection = DBAccessUtils.getConnection(); 												//データベースへ接続
	    	statement = connection.createStatement();													//Statementを取得するためのコード

	        connection.setAutoCommit(false);															//自動コミットを無効にする


	        String sql = "SELECT distinct t_actress.actress_id, t_actress.actress_name, t_company.company_name "
        		     +"FROM "
        	         +"t_actress INNER JOIN t_company ON t_actress.company_id = t_company.company_id where ";

	        if(!"".equals(actressId)) {
	        	sql = sql + "t_actress.actress_id = '"+ actressId +"' AND ";
	        }
	        	sql = sql + "actress_name like '%"+ actressName +"%'";
	        	sql = sql +  "ORDER BY actress_id ";

            System.out.println("引数に" + actressId + "が入力されました。");
            System.out.println("引数に" + actressName + "が入力されました。");
            System.out.println(sql);

            resultSet = statement.executeQuery(sql);													//SELECT文を実行するコード



           while(resultSet.next()) {																	//SELECT文の結果を参照

        	   HashMap<String, String> actressInfo = new HashMap<String, String>();
        	   actressInfo.put("女優ID", resultSet.getString("actress_id"));
        	   actressInfo.put("女優名", resultSet.getString("actress_name"));
        	   actressInfo.put("所属会社名", resultSet.getString("company_name"));
        	   actressList.add(actressInfo);

            	//System.out.println(actressInfo.get("所属会社ID"));
        	   System.out.println(actressInfo.get("女優ID"));
        	   System.out.println(actressInfo.get("女優名"));
        	   System.out.println(actressInfo.get("所属会社名"));										//リストに入ったかの確認
            }

        }
        catch (SQLException e) {
        	System.out.println("SQL failed");
        	e.printStackTrace();
        }
        finally{

        	try {
        		resultSet.close();
        		//データベースのクローズ
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
        return actressList;
	}






	public static int deleteActress(String actressId, String contentsId) {	 												//女優テーブル削除

		//List<HashMap<String, String>> employeeList = new ArrayList<HashMap<String, String>>() ;
		//ResultSet resultSet = null;
		Connection connection = null;
		Statement statement = null;
		int deleteCount = 0;

		try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();													//DBへ接続
        	statement = connection.createStatement();													//Statementを取得するためのコード

            connection.setAutoCommit(true);							 								//自動コミットを有効にする

            String sql = "DELETE FROM t_actress where actress_id = '"+ actressId +"' "
            		+ "AND contents_id = '"+ contentsId +"'";

            System.out.println("引数に" + actressId + "が入力されました。");
            System.out.println("引数に" + contentsId + "が入力されました。");
            System.out.println(sql);

            deleteCount = statement.executeUpdate (sql);

            if(deleteCount == 1){																		//削除が成功しているかどうかの確認
            	System.out.println("削除成功");
            }
            else{
            	System.out.println("削除失敗");
            }
        }
		catch (SQLException e){
		System.err.println("SQL failed.");
		e.printStackTrace ();																			//エラーの情報
		}
		finally{
		}
	return deleteCount;
	}



	public static List<HashMap<String,String>> getColumnContentsList() //チェックボックに必要なコンテンツデータを送るメソッド
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
	        String columnSelectSql = "SELECT contents_id , contents_name FROM t_contents";
	        System.out.println("1:" + columnSelectSql);

	        //引数に入った値を出力
	        System.out.println(columnSelectSql);

	        resultSet = statement.executeQuery (columnSelectSql);


	       // テーブル照会結果を出力
	       while(resultSet.next())
	       {
	        	//社員情報を作成する
	        	HashMap<String, String> employeeInfo = new HashMap<String, String>();
	        	employeeInfo.put("コンテンツId", resultSet.getString("contents_id"));
	        	employeeInfo.put("コンテンツ名", resultSet.getString("contents_name"));

	        	//社員情報をリストに追加する
	        	companyColumnList.add(employeeInfo);

	        	//リストに入ったかの確認
	        	System.out.println(employeeInfo.get("コンテンツId"));
	        	System.out.println(employeeInfo.get("コンテンツ名"));

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



//クラス0020に入れる予定のメソッド

	public static List<HashMap<String,String>> getColumnCompanyList() //プルダウン表示に必要な会社データを送るメソッド
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
            String columnSelectSql = "SELECT company_id , company_name FROM t_company";
            System.out.println("1:" + columnSelectSql);

            //引数に入った値を出力
            //System.out.println("引数に" + companyName + "が入力されました。");
            System.out.println(columnSelectSql);


            resultSet = statement.executeQuery (columnSelectSql);

            //影響のあった行数を出力

            //System.out.println(insertCount + " 行挿入しました。");


           // テーブル照会結果を出力
           while(resultSet.next())
           {
            	//社員情報を作成する
            	HashMap<String, String> employeeInfo = new HashMap<String, String>();
            	employeeInfo.put("会社Id", resultSet.getString("company_id"));
            	employeeInfo.put("会社名", resultSet.getString("company_name"));

            	//社員情報をリストに追加する
            	companyColumnList.add(employeeInfo);

            	//リストに入ったかの確認
            	System.out.println(employeeInfo.get("会社Id"));
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



/*
String sql = "SELECT * FROM t_actress where ";					//sql文開始
System.out.println("1:" + sql);

if(!"".equals(actressId)) {
	sql = sql + "actress_id = '"+ actressId +"'";
	System.out.println("2:" + sql);
}
if(!"".equals(companyId)) {
	sql = sql + "company_id = '"+ companyId +"' AND ";
	System.out.println("3:" + sql);
}
	sql = sql + "actress_name like '%"+ actressName +"%'";
	sql = sql + " ORDER BY actress_id";
	System.out.println("4:" + sql);						*/		//sql文終了

/*
"SELECT t_actress.actress_id, t_actress.actress_name, t_company.company_name "
+ "FROM t_contents INNER JOIN"
+ "(t_actress INNER JOIN t_company ON t_actress.company_id = t_company.company_id)"
+ "ON t_actress.contents_id = t_contents.contents_id where ";
				*/