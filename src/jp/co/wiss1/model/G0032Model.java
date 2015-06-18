package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0032Model {

	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		//getEmployeeList_SELECT("0" , "島" , "雅");
		//getEmployeeList_INSERT("128" , "檜山" , "隼" , "20001001");
		updateCompany("","","");
		//getPreferenceList();
		//getContentsList();
		//getActressList();
	}


	//所属会社一覧UPDATEの実行！！！
	public static int updateCompany(String companyId , String companyName , String company_address ) { //社員テーブル参照

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

            String sql = "UPDATE t_company SET";
            	if(!"". equals(companyId)){
            		sql = sql + " company_name = '"+ companyName +"',"
            		+ " company_address = '"+ company_address +"' WHERE"
            		+ " company_id = '"+ companyId +"'";

            		upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + companyId + "が入力されました。");
            System.out.println("引数に" + companyName + "が入力されました。");
            System.out.println("引数に" + company_address + "が入力されました。");
            System.out.println(sql);


            System.out.println(upDateCount + "行を更新しました。");



            /*System.out.println(rows);
            int i = 0;
            // テーブル照会結果を出力
            while(rs0.next())
           {

            	map.add(new HashMap());


            	map.get(i).put("所属会社ID", rs0.getInt("company_ID"));
            	map.get(i).put("所属会社名", rs0.getString("company_name"));
            	map.get(i).put("所属会社住所", rs0.getString("company_ID"));




            	//リストに入ったかの確認
            	System.out.println(map.get(i).get("所属会社ID"));
    			System.out.println(map.get(i).get("所属会社名"));
    			System.out.println(map.get(i).get("所属会社住所"));

				i++;
            }*/


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
