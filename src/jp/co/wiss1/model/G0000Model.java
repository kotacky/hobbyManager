package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0000Model{

	public static int getLogin(String employeeId, String hashedPassword){

    	int loginFlag =0 ;
		ResultSet resultSet = null;
		Connection connection = null;
		Statement statement = null;
		try {

			/* ここから下記括りまでがDBへのアクセスするお約束*/
			// テーブル照会実行
			// データベースへの接続情報を保持、登録
			// ドライバ/サーバ/ポート/DB名/ユーザー名/パスワード
			connection = DBAccessUtils.getConnection();
			// statement作成
			// この接続情報でSQL流すぞー！！！っていう声明みたいなもの
			statement = connection.createStatement();
			// 自動コミットを無効にする

			connection.setAutoCommit(false);
			/*-----------------------------------------------*/

			/*SQL文構築*/

			String sql = "SELECT * FROM t_employee where employee_id = '"
				+ employeeId + "' AND " +  "employee_password ='"+ hashedPassword +"'";
//			System.out.println(sql);
			/*SQL文終了*/

			// SELECT文を実行するためのメソッド
			// このセレクト文でDBに「 Query(質問、問い合わせ) execute(実行する。)」
			// resultSet 結果をテーブル形式で保持し、色々出来るクラス
            resultSet = statement.executeQuery(sql);
            //上記文章にて、設定した内容を元にSQL(postgres)アクセス！！


            //SELECT文の結果を参照
            while(resultSet.next()) {														//SELECT文の結果を参照
				if(hashedPassword.equals(resultSet.getString("employee_password"))){
					loginFlag = 1;
				}
				else{
					loginFlag = 0;
				}
            }

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
        	System.out.println("SQL failed");
			e.printStackTrace();
		}
        	finally{
/*データベースのクローズ*/
	        	try {
	        		resultSet.close();
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
       return loginFlag;
	}
}

