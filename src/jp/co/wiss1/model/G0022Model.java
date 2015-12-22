package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.ChangeCharacter;
import jp.co.wiss1.common.DBAccessUtils;

public class G0022Model {

	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		updateActress("0301","あああ","0201","0401","","","");
	}

	//女優一覧UPDATE実行！！！
	//女優テーブル参照
	public static int updateActress
	(String companyId , String actressName , String actressId , String contentsId , String birthDate , String bloodType , String birthPlace)
	{

		Connection connection = null;
    	Statement statement = null;
    	int upDateCount = 0;

		//特殊文字をエスケープ文字に置き換える
    	companyId = ChangeCharacter.CC(companyId);
		actressId = ChangeCharacter.CC(actressId);
		actressName = ChangeCharacter.CC(actressName);
		contentsId = ChangeCharacter.CC(contentsId);
		birthDate = ChangeCharacter.CC(birthDate);
		bloodType = ChangeCharacter.CC(bloodType);
		birthPlace = ChangeCharacter.CC(birthPlace);


        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            /* 自動コミットを無効にする */
        	connection.setAutoCommit(true);

        	//－－－－－－－－－－sql文構築－－－－－－－－－－//
			//－－－－－－－－－－String型のsqlにposgreのIDが同じ女優テーブルの情報を入れている//
            String sql = "UPDATE t_actress SET";
            	if(!"".equals(actressId)){
            		sql = sql +" actress_name = '"+ actressName +"',"
            		+ "company_id = '"+ companyId + "',"
            		+ "contents_id = '"+ contentsId +"',"
            		+ "birth_date = '"+ birthDate +"',"
            		+ "blood_type = '"+ bloodType +"',"
            		+ "birth_place = '"+ birthPlace +"',"
            		+ "WHERE actress_id = '"+ actressId +"' AND contents_id = '"+ contentsId +"' ";

            		upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + actressName + "が入力されました。");
            System.out.println("引数に" + actressId + "が入力されました。");
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
