package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0023Model {

	public static void main(String[] args) {
		getColumnCompanyList();

	}


	public static List<HashMap<String,String>> getColumnDramaList() //チェックボックスに必要な雑誌データを送るメソッド
	{
		List<HashMap<String,String>> columnDramaList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
	        String columnSelectSql = "SELECT drama_id , drama_title FROM t_dramas";
	        System.out.println("1:" + columnSelectSql);

	        //引数に入った値を出力
	        System.out.println(columnSelectSql);

	        resultSet = statement.executeQuery (columnSelectSql);


	       // テーブル照会結果を出力
	       while(resultSet.next())
	       {
	        	//社員情報を作成する
	        	HashMap<String, String> dramaInfo = new HashMap<String, String>();
	        	dramaInfo.put("dramaId", resultSet.getString("drama_id"));
	        	dramaInfo.put("dramaName", resultSet.getString("drama_title"));

	        	//社員情報をリストに追加する
	        	columnDramaList.add(dramaInfo);

	        	//リストに入ったかの確認
	        	System.out.println(dramaInfo.get("dramaId"));
	        	System.out.println(dramaInfo.get("dramaName"));

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
	    return columnDramaList;
	}

	public static List<HashMap<String,String>> getColumnMovieList() //チェックボックスに必要な雑誌データを送るメソッド
	{
		List<HashMap<String,String>> columnMovieList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
	        String columnSelectSql = "SELECT movie_id , movie_title FROM t_movie";
	        System.out.println("1:" + columnSelectSql);

	        //引数に入った値を出力
	        System.out.println(columnSelectSql);

	        resultSet = statement.executeQuery (columnSelectSql);


	       // テーブル照会結果を出力
	       while(resultSet.next())
	       {
	        	//社員情報を作成する
	        	HashMap<String, String> ｍovieeInfo = new HashMap<String, String>();
	        	ｍovieeInfo.put("movieId", resultSet.getString("movie_id"));
	        	ｍovieeInfo.put("movieName", resultSet.getString("movie_title"));

	        	//社員情報をリストに追加する
	        	columnMovieList.add(ｍovieeInfo);

	        	//リストに入ったかの確認
	        	System.out.println(ｍovieeInfo.get("movieId"));
	        	System.out.println(ｍovieeInfo.get("movieName"));

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
	    return columnMovieList;
	}
/*
	public static List<HashMap<String,String>> getColumnCommercialList() //チェックボックスに必要な雑誌データを送るメソッド
	{
		List<HashMap<String,String>> columnCommercialList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
	        String columnSelectSql = "SELECT commercial_id , commercial_name FROM t_commercial";
	        System.out.println("1:" + columnSelectSql);

	        //引数に入った値を出力
	        System.out.println(columnSelectSql);

	        resultSet = statement.executeQuery (columnSelectSql);


	       // テーブル照会結果を出力
	       while(resultSet.next())
	       {
	        	//社員情報を作成する
	        	HashMap<String, String> commercialInfo = new HashMap<String, String>();
	        	commercialInfo.put("magazineId", resultSet.getString("commercial_id"));
	        	commercialInfo.put("magazineName", resultSet.getString("commercial_name"));

	        	//社員情報をリストに追加する
	        	columnCommercialList.add(commercialInfo);

	        	//リストに入ったかの確認
	        	System.out.println(commercialInfo.get("magazineId"));
	        	System.out.println(commercialInfo.get("magazineName"));

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
	    return columnCommercialList;
	}*/

//クラス0020に入れる予定のメソッド

	public static List<HashMap<String,String>> getColumnCompanyList() //プルダウン表示に必要な会社データを送るメソッド
	{
		List<HashMap<String,String>> columnCompanyList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
            	HashMap<String, String> companyInfo = new HashMap<String, String>();
            	companyInfo.put("companyId", resultSet.getString("company_id"));
            	companyInfo.put("companyName", resultSet.getString("company_name"));

            	//社員情報をリストに追加する
            	columnCompanyList.add(companyInfo);

            	//リストに入ったかの確認
            	System.out.println(companyInfo.get("companyId"));
            	System.out.println(companyInfo.get("companyName"));

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
        return columnCompanyList;
	}
/*
	public static List<HashMap<String,String>> getColumnMagazineList() //プルダウン表示に必要な会社データを送るメソッド
	{
		List<HashMap<String,String>> columnMagazineList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
            String columnSelectSql = "SELECT magazine_id , magazine_name FROM t_magazine";
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
            	HashMap<String, String> magazineInfo = new HashMap<String, String>();
            	magazineInfo.put("magazineId", resultSet.getString("magazine_id"));
            	magazineInfo.put("magazineName", resultSet.getString("magazine_name"));

            	//社員情報をリストに追加する
            	columnMagazineList.add(magazineInfo);

            	//リストに入ったかの確認
            	System.out.println(magazineInfo.get("companyId"));
            	System.out.println(magazineInfo.get("companyName"));

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
        return columnMagazineList;
	}
*/
}
