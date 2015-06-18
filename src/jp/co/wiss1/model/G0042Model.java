package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0042Model {


	//ドラマ・映画一覧UPDATEの実行！！！
	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		//getEmployeeList_SELECT("0" , "島" , "雅");
		//getEmployeeList_INSERT("128" , "檜山" , "隼" , "20001001");
		//getCompanyList(0,null);
		//getPreferenceList();
		updateContents("","","","");
		//getActressList();
	}


	//ドラマ・映画一覧UPDATE文の実行！！！
	public static int updateContents(String contentsId , String contentsName , String summary , String actressId) { //社員テーブル参照

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


            String sql = "UPDATE t_contents SET";
            	if(!"". equals(contentsId)){
            		sql = sql+ " contents_name = '"+ contentsName +"', "
            		+ " summary = '"+ summary +"' WHERE"
            		+ " contents_id = '"+ contentsId +"'";

                    upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + contentsId + "が入力されました。");
            System.out.println("引数に" + contentsName + "が入力されました。");
            System.out.println("引数に" + summary + "が入力されました。");
            System.out.println(sql);


            System.out.println(upDateCount + "行を更新しました。");



            // テーブル照会結果を出力
            /*while(rs0.next())
            {

            	map.add(new HashMap());


            	map.get(i).put("コンテンツID", rs0.getInt("contents_ID"));
            	map.get(i).put("作品名", rs0.getString("contents_name"));
            	map.get(i).put("概要", rs0.getString("summary"));




            	//リストに入ったかの確認
            	System.out.println(map.get(i).get("コンテンツID"));
    			System.out.println(map.get(i).get("作品名"));
    			System.out.println(map.get(i).get("概要"));

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


