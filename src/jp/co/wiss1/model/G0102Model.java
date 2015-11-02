package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0102Model {

	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		updateTelevision("","","");

	}


	//テレビ局一覧更新の実行！！！
	public static int updateTelevision(String televisionId , String televisionName , String televisionAddress ) {

		Connection connection = null;
    	Statement statement = null;
    	int upDateCount = 0;


        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            /* 自動コミットを無効にする */
        	connection.setAutoCommit(true);

            String sql = "UPDATE t_television SET";
            	if(!"". equals(televisionId)){
            		sql = sql + " television_name = '"+ televisionName +"',"
            		+ " television_address = '"+ televisionAddress +"' WHERE"
            		+ " television_id = '"+ televisionId +"'";

            		upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + televisionId + "が入力されました。");
            System.out.println("引数に" + televisionName + "が入力されました。");
            System.out.println("引数に" + televisionAddress + "が入力されました。");
            System.out.println(sql);


            System.out.println(upDateCount + "行を更新しました。");




        }
        catch (SQLException e)
        {
            System.err.println("SQL failed.");
            e.printStackTrace ();
        }
        finally{
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
