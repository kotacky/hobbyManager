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

public class G0010Model//git
{

	/**
	 * 社員一覧取得メソッド
	 * @return List 社員情報
	 */
	public static void main(String[] args) {
		getEmployeeList("119" , "" , "","" ,"");
		deleteEmployee("0");
	}


	public static List<HashMap<String, String>> getEmployeeList(String employeeId , String familyName , String firstName, String firstNameRead, String familyNameRead)	//社員テーブル参照
	{

		List<HashMap<String, String>> employeeList = new ArrayList<HashMap<String, String>>() ;
		ResultSet resultSet = null;															//初期化
		Connection connection = null;
		Statement statement = null;

		//特殊文字をエスケープ文字に置き換える
		employeeId = ChangeCharacter.CC(employeeId);
		familyName = ChangeCharacter.CC(familyName);
		firstName = ChangeCharacter.CC(firstName);

        try
        {
            // テーブル照会実行
	    	connection = DBAccessUtils.getConnection(); 									//データベースへ接続
	    	statement = connection.createStatement();										//Statementを取得するためのコード

	        connection.setAutoCommit(false);												//自動コミットを無効にする


            String sql = "SELECT * FROM t_employee where ";									//sql文開始
            System.out.println("1:" + sql);

        	if(!"".equals(employeeId)) {
        		sql = sql + "employee_id = '"+ employeeId +"' AND ";
        		System.out.println("2:" + sql);
        	}
        	if(!"".equals(familyName)) {
        		sql = sql + "employee_family_name like '%"+ familyName +"%'"
        				+ " OR family_name_read like '%"+ familyName +"%' AND ";
        		System.out.println("3:" + sql);
        	}
        	sql = sql + "employee_first_name like '%"+ firstName +"%' "
        			+ "OR employee_first_name_read like '%"+ firstName +"%'";
    		sql = sql + " ORDER BY employee_id";
    		System.out.println("4:" + sql);												//sql文終了

        		System.out.println("4:" + sql);												//sql文終了

            System.out.println("引数に" + employeeId + "が入力されました。");				//コメント一覧
            System.out.println("引数に" + familyName + "が入力されました。");
            System.out.println("引数に" + firstName + "が入力されました。");
            System.out.println(sql);

            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード



            while(resultSet.next()) {														//SELECT文の結果を参照

        	   HashMap<String, String> employeeInfo = new HashMap<String, String>();
        	   employeeInfo.put("employeeId", resultSet.getString("employee_id"));
        	   employeeInfo.put("employeeFamilyName", resultSet.getString("employee_family_name"));
        	   employeeInfo.put("employeeFirstName", resultSet.getString("employee_first_name"));
        	   employeeInfo.put("employeeBirthDate", resultSet.getString("birth_date"));
        	   employeeInfo.put("employeeFrom", resultSet.getString("employee_from"));
        	   employeeInfo.put("employeeBloodType", resultSet.getString("employee_blood_type"));
        	   employeeInfo.put("employeeAuthority", resultSet.getString("employee_authority"));
        	   employeeInfo.put("employeePassword", resultSet.getString("employee_password"));
        	   employeeList.add(employeeInfo);

            	System.out.println(employeeInfo.get("employeeId"));								//リストに入ったかの確認
            	System.out.println(employeeInfo.get("employeeFamilyName"));
            	System.out.println(employeeInfo.get("employeeFirstName"));
            	System.out.println(employeeInfo.get("employeeBirthDate"));
            	System.out.println(employeeInfo.get("employeeFrom"));
            	System.out.println(employeeInfo.get("employeeBloodType"));
            	System.out.println(employeeInfo.get("employeeAuthority"));
            	System.out.println(employeeInfo.get("employeePassword"));
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
        return employeeList;
	}






	public static int deleteEmployee(String employeeId) {	 								//社員テーブル削除


		Connection connection = null;
		Statement statement = null;
		int deleteCount = 0;;

		try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();										//DBへ接続
        	statement = connection.createStatement();										//Statementを取得するためのコード
            connection.setAutoCommit(true);												//自動コミットを有効にする

            String sql = "DELETE FROM t_employee where employee_id = '"+ employeeId +"'";	//sql文
            System.out.println("引数に" + employeeId + "が入力されました。");
            System.out.println(sql);

            deleteCount = statement.executeUpdate (sql);									//削除が成功しているかどうかの確認

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

