package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.ChangeCharacter;
import jp.co.wiss1.common.DBAccessUtils;

public class G0072Model {


	//映画一覧UPDATEの実行！！！
	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		updateCommercial("","","");
	}


	//映画一覧UPDATE文の実行！！！
	public static int updateCommercial(String commercialId , String commercialName , String sponserName) { //映画テーブル参照

		Connection connection = null;
    	Statement statement = null;
    	int upDateCount = 0;

		//特殊文字をエスケープ文字に置き換える
		commercialId = ChangeCharacter.CC(commercialId);
		commercialName = ChangeCharacter.CC(commercialName);
		sponserName = ChangeCharacter.CC(sponserName);

        try
        {
            // 映画テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            /* 自動コミットを無効にする */
        	connection.setAutoCommit(true);


            String sql = "UPDATE t_commercial SET";
            	if(!"". equals(commercialId)){
            		sql = sql+ " commercial_name = '"+ commercialName +"', "
            		+ " sponser_name = '"+ sponserName +"' WHERE"
            		+ " commercial_id = '"+ commercialId +"'";

                    upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + commercialId + "が入力されました。");
            System.out.println("引数に" + commercialName + "が入力されました。");
            System.out.println("引数に" + sponserName + "が入力されました。");
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


