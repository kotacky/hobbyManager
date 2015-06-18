package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0030Model {

	//所属会社一覧SELECT文実行！！！
	public static void main(String[] args)
	{
		getCompanyList("", "", "");
		deleteCompany("0");
	}

	public static List<HashMap<String, String>> getCompanyList(String companyId , String companyName , String companyAddress)	//所属会社テーブル参照
	{

		List<HashMap<String, String>> companyList = new ArrayList<HashMap<String, String>>() ;
		ResultSet resultSet = null;															//初期化
		Connection connection = null;
		Statement statement = null;


        try{
            // テーブル照会実行
	    	connection = DBAccessUtils.getConnection(); 									//データベースへ接続
	    	statement = connection.createStatement();										//Statementを取得するためのコード

	        connection.setAutoCommit(false);												//自動コミットを無効にする


            String sql = "SELECT * FROM t_company where ";									//sql文開始
            System.out.println("1:" + sql);

        	if(!"".equals(companyId)) {
        		sql = sql + "company_id = '"+ companyId +"' AND ";
        		System.out.println("2:" + sql);
        	}
        	if(!"".equals(companyName)) {
        		sql = sql + "company_name = '%"+ companyName +"%' AND ";
        		System.out.println("3:" + sql);
        	}
        		sql = sql + "company_address like '%"+ companyAddress +"%'";
        		sql = sql + " ORDER BY company_id";
        		System.out.println("4:" + sql);												//sql終了

            System.out.println("引数に" + companyId + "が入力されました。");
            System.out.println("引数に" + companyName + "が入力されました。");
            System.out.println("引数に" + companyAddress + "が入力されました。");
            System.out.println(sql);

            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード



            while(resultSet.next()) {														//SELECT文の結果を参照

        	   HashMap<String, String> companyInfo = new HashMap<String, String>();
        	   companyInfo.put("所属会社ID", resultSet.getString("company_id"));
        	   companyInfo.put("所属会社名", resultSet.getString("company_name"));
        	   companyInfo.put("住所", resultSet.getString("company_address"));

        	   companyList.add(companyInfo);

            	System.out.println(companyInfo.get("所属会社ID"));							//リストに入ったかの確認
            	System.out.println(companyInfo.get("所属会社名"));
            	System.out.println(companyInfo.get("住所"));
            }

        }
        catch (SQLException e) {
        	System.out.println("SQL failed");
        	e.printStackTrace();
        }
        finally{

        	try {
        		resultSet.close();															//データベースのクローズ
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
        return companyList;
	}






	public static int deleteCompany(String companyId) {	 									//所属会社テーブル削除


		Connection connection = null;
		Statement statement = null;
		int deleteCount = 0;

		try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();										//DBへ接続
        	statement = connection.createStatement();										//Statementを取得するためのコード

            connection.setAutoCommit(true);													//自動コミットを有効にする

            String sql = "DELETE FROM t_company where company_id = '"+ companyId +"'";
            System.out.println("引数に" + companyId + "が入力されました。");
            System.out.println(sql);

            deleteCount = statement.executeUpdate (sql);									//削除成功したかどうかの確認

            if(deleteCount == 1){
            	System.out.println("削除成功");
            }
            else{
            	System.out.println("削除失敗");
            }
        }
		catch (SQLException e){
		System.err.println("SQL failed.");
		e.printStackTrace ();																//エラーの情報
		}
		finally{
		}
	return deleteCount;
	}

}


