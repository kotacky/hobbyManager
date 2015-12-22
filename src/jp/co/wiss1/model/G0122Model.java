package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.ChangeCharacter;
import jp.co.wiss1.common.DBAccessUtils;

public class G0122Model {


	//ドラマ・映画一覧UPDATEの実行！！！
	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		updateMusic("","","");
	}


	//ドラマ・映画一覧UPDATE文の実行！！！
	 //社員テーブル参照
	public static int updateMusic
	(String musicId , String musicName ,String artistId)
	{

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
        	//エスケープ文字に置き換え
        	musicName = ChangeCharacter.CC(musicName);

        	//－－－－－－－－－－sql文構築－－－－－－－－－－//
			//－－－－－－－－－－String型のsqlにposgreのIDが同じ女優テーブルの情報を入れている//
            String sql = "UPDATE t_music SET";
            	if(!"".equals(musicId)){
            		sql = sql +" music_name = '"+ musicName +"',"
            		+ " artist_id = '"+ artistId + "' "
            		+ " WHERE music_id = '"+ musicId +"'";

            		upDateCount = statement.executeUpdate (sql);
            	}

       	 System.out.println("引数に" + musicName + "が入力されました。");
            System.out.println("引数に" + musicName + "が入力されました。");
            System.out.println("引数に" + musicId + "が入力されました。");
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
