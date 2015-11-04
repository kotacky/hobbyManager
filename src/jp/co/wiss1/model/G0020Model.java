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


        try{

        	//データベースへ接続
	    	connection = DBAccessUtils.getConnection();
	    	//Statementを取得するためのコード
	    	statement = connection.createStatement();
	    	//自動コミットを無効にする
	        connection.setAutoCommit(false);

//t_actress.birth_date ,t_actress.blood_type, t_actress.birth_place
	        String sql = "SELECT distinct t_actress.actress_id, t_actress.actress_name, t_company.company_name ,t_actress.birth_date ,t_actress.blood_type, t_actress.birth_place "
        		     +"FROM "
        	         +"t_actress LEFT OUTER JOIN t_company ON t_actress.company_id = t_company.company_id where ";

	        if(!"".equals(actressId)) {
	        	sql = sql + "t_actress.actress_id = '"+ actressId +"' AND ";
	        }
//	        if(!"".equals(actressName)) {
//	        	sql = sql + "t_actress.actress_name = '"+ actressName +"' AND ";
//	        }
//	        if(!"".equals(birthDate)) {
//	        	sql = sql + "t_actress.birth_date = '"+ birthDate +"' AND ";
//	        }
//	        if(!"".equals(bloodType)) {
//	        	sql = sql + "t_actress.blood_type = '"+ bloodType +"' AND ";
//	        }
//	        sql = sql + "birth_place like '%"+ birthPlace +"%'";
	        sql = sql + "actress_name like '%"+ actressName +"%'";
	        sql = sql +  "ORDER BY actress_id ";

            System.out.println("引数に" + actressId + "が入力されました。");
            System.out.println("引数に" + actressName + "が入力されました。");
//            System.out.println("引数に" + birthDate + "が入力されました。");
//            System.out.println("引数に" + bloodType + "が入力されました。");
//            System.out.println("引数に" + birthPlace + "が入力されました。");
            System.out.println(sql);

            //SELECT文を実行するコード
            resultSet = statement.executeQuery(sql);

            //SELECT文の結果を参照
            while(resultSet.next()) {

        	   HashMap<String, String> actressInfo = new HashMap<String, String>();
        	   actressInfo.put("actressId", resultSet.getString("actress_id"));
        	   actressInfo.put("actressName", resultSet.getString("actress_name"));
        	   //所属会社IDがなかったら
//        	   if(companyName == "null"){
//        		    actressInfo.put("未所属", resultSet.getString("actress_name"));
//        	   }
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

//            if(deleteCount != 1){
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