package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0050Model {



		public static void main(String[] args)
		{
			getPreferenceList("119", "", "");
			deletePreference("0");
		}

		public static List<HashMap<String, String>> getPreferenceList(String employeeId , String familyName, String firstName)	//好みテーブル参照
		{

			List<HashMap<String, String>> preferenceList = new ArrayList<HashMap<String, String>>() ;
			ResultSet resultSet = null;																	//初期化
			Connection connection = null;
			Statement statement = null;


	        try{
	            // テーブル照会実行
		    	connection = DBAccessUtils.getConnection(); 											//データベースへ接続
		    	statement = connection.createStatement();												//Statementを取得するためのコード

		        connection.setAutoCommit(false);														//自動コミットを無効にする


		        String sql = "SELECT t_employee.employee_id,"
		        					+ "t_employee.employee_family_name,"
		        					+ "t_employee.employee_first_name,"
		        					+ "t_actress.actress_name,"
		        					+ "t_contents.contents_name "
		        					+ "FROM "
		        					+ "t_preference INNER JOIN t_employee ON t_employee.employee_id = t_preference.employee_id "
		        					+ "INNER JOIN t_contents ON t_contents.contents_id = t_preference.contents_id "
		        					+ "INNER JOIN t_actress ON t_actress.actress_id = t_preference.actress_id "
		        					+ "AND t_actress.contents_id = t_preference.contents_id where ";


		        if(!"".equals(employeeId)) {
		        	sql = sql + "t_employee.employee_id = '"+ employeeId +"' AND ";
		        }
		        if(!"".equals(familyName)) {
		        	sql = sql + "t_employee.employee_family_name like '%"+ familyName +"%' AND ";
		        }
		        	sql = sql + "t_employee.employee_first_name like '%"+ firstName +"%'";
		        	sql = sql + "ORDER BY employee_id";												     //sql文終了



	            System.out.println("引数に" + employeeId + "が入力されました。");
	            System.out.println("引数に" + familyName + "が入力されました。");
	            System.out.println("引数に" + firstName + "が入力されました。");
	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);												//SELECT文を実行するコード



	            while(resultSet.next()) {																//SELECT文の結果を参照

	        	   HashMap<String, String> preferenceInfo = new HashMap<String, String>();
	        	   preferenceInfo.put("employeeId", resultSet.getString("employee_id"));
	        	   preferenceInfo.put("employeeFamilyName", resultSet.getString("employee_family_name"));
	        	   preferenceInfo.put("employeeFirstName", resultSet.getString("employee_first_name"));
	        	   preferenceInfo.put("actressName", resultSet.getString("actress_name"));
	        	   preferenceInfo.put("contentsName", resultSet.getString("contents_name"));



	        	   preferenceList.add(preferenceInfo);

	        	   System.out.println(preferenceInfo.get("employeeId"));
	        	   System.out.println(preferenceInfo.get("employeeFamilyName"));
	        	   System.out.println(preferenceInfo.get("employeeFirstName"));
	        	   System.out.println(preferenceInfo.get("actressName"));
	        	   System.out.println(preferenceInfo.get("contentsName"));								//リストに入ったかの確認

	            }

	        }
	        catch (SQLException e) {
	        	System.out.println("SQL failed");
	        	e.printStackTrace();
	        }
	        finally{

	        	try {
	        		resultSet.close();																	//データベースのクローズ
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
	        return preferenceList;
		}






		public static int deletePreference(String employeeId) {	 										//好みテーブル削除


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();												//DBへ接続
	        	statement = connection.createStatement();												//Statementを取得するためのコード

	            connection.setAutoCommit(true);															//自動コミットを有効にする

	            String sql = "DELETE FROM t_preference where employee_id = '"+ employeeId +"'";			//sql文
	            System.out.println("引数に" + employeeId + "が入力されました。");
	            System.out.println(sql);

	            deleteCount = statement.executeUpdate (sql);

	            if(deleteCount == 1){																	//削除が成功しているかどうかの確認
	            	System.out.println("削除成功");
	            }
	            else{
	            	System.out.println("削除失敗");
	            }
	        }
			catch (SQLException e){
			System.err.println("SQL failed.");
			e.printStackTrace ();																		//エラーの情報
			}
			finally{
			}
		return deleteCount;
		}

	}






//SELECT t_actress.actress_id, t_actress.actress_name, t_contents.contents_name, t_contents.summary from t_actress INNER JOIN t_contents
//ON t_actress.contents_id = t_contents.contents_id;


//SELECT t_actress.actress_id, t_actress.actress_name, t_company.company_name, t_contents.contents_name
//from t_actress INNER JOIN
//(t_contents INNER JOIN t_company ON t_contents.company_id = t_company.company_id)
	//ON t_actress.contents_id = t_contents.contents_id where actress_id = 41;


/*

SELECT t_employee.employee_id,
t_employee.employee_family_name, t_employee.employee_first_name,
t_actress.actress_name,
t_contents.contents_name
FROM
(((t_actress INNER JOIN t_preference ON t_actress.actress_id = t_preference.actress_id)
INNER JOIN t_contents ON t_actress.contents_id = t_contents.contents_id)
INNER JOIN t_company ON t_actress.company_id = t_company.company_id)
INNER JOIN t_employee ON t_employee.employee_id = t_preference.employee_id;

*/


/*
String sql = "SELECT t_actress.actress_name, t_actress.actress_id, t_contents.contents_name, t_contents.summary FROM ";						//sql文開始
System.out.println("1:" + sql);

sql = sql + "t_actress INNER JOIN t_contents ";
sql = sql + "ON t_actress.contents_id = t_contents.contents_id";


if(!"".equals(actressId)) {
	sql = sql + "actress_id = '"+ actressId +"' AND ";
	System.out.println("2:" + sql);
}
if(!"".equals(contentsId)) {
	sql = sql + "contents_id = '"+ contentsId +"' AND ";
	System.out.println("3:" + sql);
}
if(!"".equals(companyId)) {
	sql = sql + "company_id = '"+ companyId +"' AND ";
	System.out.println("3:" + sql);
}
	sql = sql + "employee_id = '"+ employeeId +"'";
	System.out.println("4:" + sql);								*/	//sql文終了




/*

SELECT t_employee.employee_id,
t_employee.employee_family_name,
t_employee.employee_first_name,
t_actress.actress_name,
t_contents.contents_name
FROM
((t_preference INNER JOIN t_employee ON t_employee.employee_id = t_preference.employee_id)
	     INNER JOIN t_contents ON t_contents.contents_id = t_preference.contents_id)
              INNER JOIN t_actress ON t_actress.actress_id = t_preference.actress_id AND t_actress.contents_id = t_preference.contents_id;


*/