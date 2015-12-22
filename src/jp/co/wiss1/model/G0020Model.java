package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;
import jp.co.wiss1.common.ChangeCharacter;

public class G0020Model
{

	public static void main(String[] args)
	{
		getActressList("202", "");
		deleteActress("0");
	}

	//女優テーブル参照
	public static List<HashMap<String, String>> getActressList
	(String actressId, String actressName)
	{
		List<HashMap<String, String>> actressList = new ArrayList<HashMap<String, String>>() ;
		//初期化
		ResultSet resultSet = null;
		Connection connection = null;
		Statement statement = null;

		//特殊文字をエスケープ文字に置き換える
		actressId = ChangeCharacter.CC(actressId);
		actressName = ChangeCharacter.CC(actressName);

        try{

        	//データベースへ接続
	    	connection = DBAccessUtils.getConnection();
	    	//Statementを取得するためのコード
	    	statement = connection.createStatement();
	    	//自動コミットを無効にする
	        connection.setAutoCommit(false);


	        String sql =
	        	"SELECT distinct "
	        	+ "t_actress.actress_id, "
	        	+ "t_actress.actress_name, "
	        	+ " COALESCE(company_name,'未登録') AS company_name, "
	        	//+ "t_company.company_name, "
	        	+ "t_actress.birth_date, "
	        	+ "t_actress.blood_type, "
	        	+ "t_actress.birth_place "
	        	+ "FROM "
	        	+ "t_actress "
	        	+ "LEFT OUTER JOIN t_company "
	        	+ "ON t_actress.company_id = t_company.company_id "
	        	+ "where ";

	        if(!"".equals(actressId)) {
	        	sql = sql + "t_actress.actress_id = '"+ actressId +"' AND ";
	        }

	        sql = sql + "actress_name like '%"+ actressName +"%'";
	        sql = sql +  "ORDER BY actress_id ";

            System.out.println("引数に" + actressId + "が入力されました。");
            System.out.println("引数に" + actressName + "が入力されました。");
            System.out.println(sql);

            //SELECT文を実行するコード
            resultSet = statement.executeQuery(sql);

            //SELECT文の結果を参照
            while(resultSet.next()) {

        	   HashMap<String, String> actressInfo = new HashMap<String, String>();
        	   actressInfo.put("actressId", resultSet.getString("actress_id"));
        	   actressInfo.put("actressName", resultSet.getString("actress_name"));
        	   actressInfo.put("companyName", resultSet.getString("company_name"));
        	   actressInfo.put("birthDate", resultSet.getString("birth_date"));
        	   actressInfo.put("bloodType", resultSet.getString("blood_type"));
        	   actressInfo.put("birthPlace", resultSet.getString("birth_place"));
        	   actressList.add(actressInfo);

        	   //リストに入ったかの確認
        	   //System.out.println(actressInfo.get("女優一覧カラム"));
        	   System.out.println(actressInfo.get("actressId"));
        	   System.out.println(actressInfo.get("actressName"));
        	   System.out.println(actressInfo.get("companyName"));
        	   System.out.println(actressInfo.get("birthDate"));
        	   System.out.println(actressInfo.get("bloodType"));
        	   System.out.println(actressInfo.get("birthPlace"));
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






	public static int deleteActress(String actressId) {	 												//女優テーブル削除

		//List<HashMap<String, String>> employeeList = new ArrayList<HashMap<String, String>>() ;
		//ResultSet resultSet = null;
		Connection connection = null;
		Statement statement = null;
		int deleteCount = 0;

		try
        {
            // テーブル照会実行
			//DBへ接続
        	connection = DBAccessUtils.getConnection();
        	//Statementを取得するためのコード
        	statement = connection.createStatement();
        	//自動コミットを有効にする
            connection.setAutoCommit(true);

            String sql = "DELETE FROM t_actress where actress_id = '"+ actressId +"'";

            System.out.println("引数に" + actressId + "が入力されました。");
            System.out.println(sql);

            deleteCount = statement.executeUpdate (sql);

            if(deleteCount != 0 ){																		//削除が成功しているかどうかの確認
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

}
