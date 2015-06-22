package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0012Model {

	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		updateEmployee("","","","");
	}


	//社員一覧UPDATEの実行！！！
	public static int updateEmployee(String employeeId , String familyName , String firstName ,String birthDate) { //社員テーブル参照

		Connection connection = null;
    	Statement statement = null;
    	int upDateCount = 0;


        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();		//データベースにアクセスする
        	statement = connection.createStatement();		//Statementを取得し、SQL文を打てるようにする。

            /* 自動コミットを無効にする */
            connection.setAutoCommit(true);

            //SQL文を入力
            String sql = "UPDATE t_employee SET ";
            	if(!"". equals(employeeId)){
            		sql = sql + "employee_family_name = '"+ familyName +"',"
            		+ "employee_first_name = '"+ firstName +"',"
            		+ "birth_date = '"+ birthDate +"' WHERE "
            		+ "employee_id = '"+ employeeId +"'";
            		System.out.println(sql);

            		upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + employeeId + "が入力されました。");
            System.out.println("引数に" + familyName + "が入力されました。");
            System.out.println("引数に" + firstName + "が入力されました。");
            System.out.println("引数に" + birthDate + "が入力されました。");
            System.out.println(sql);


            System.out.println(upDateCount + "行を更新しました。");

        }
        catch (SQLException e)
        {
            System.err.println("SQL failed.");
            e.printStackTrace ();
        }
        finally {
        	// データベースのクローズ
        	try {
                //resultSet.close();
                statement.close();
                connection.close();
        	}
        	catch(Exception e) {
	            System.err.println("Close failed.");
				e.printStackTrace();
        	}
        	finally {
        		System.out.println("更新終了");
        	}
        }
        return upDateCount;
	}

}

