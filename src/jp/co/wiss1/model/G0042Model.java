package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.ChangeCharacter;
import jp.co.wiss1.common.DBAccessUtils;

public class G0042Model {


	//ドラマ・映画一覧UPDATEの実行！！！
	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		updateMagazine("","","");
	}


	//ドラマ・映画一覧UPDATE文の実行！！！
	public static int updateMagazine(String magazineId , String magazineName , String publisherName) { //社員テーブル参照

		Connection connection = null;
    	Statement statement = null;
    	int upDateCount = 0;

		//特殊文字をエスケープ文字に置き換える
		magazineId = ChangeCharacter.CC(magazineId);
		magazineName = ChangeCharacter.CC(magazineName);
		publisherName = ChangeCharacter.CC(publisherName);

        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            /* 自動コミットを無効にする */
        	connection.setAutoCommit(true);


            String sql = "UPDATE t_magazine SET";
            	if(!"". equals(magazineId)){
            		sql = sql+ " magazine_name = '"+ magazineName +"', "
            		+ " publisher_name = '"+ publisherName +"' WHERE"
            		+ " magazine_id = '"+ magazineId +"'";

                    upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + magazineId + "が入力されました。");
            System.out.println("引数に" + magazineName + "が入力されました。");
            System.out.println("引数に" + publisherName + "が入力されました。");
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


