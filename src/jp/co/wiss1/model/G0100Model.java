package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.ChangeCharacter;
import jp.co.wiss1.common.DBAccessUtils;

public class G0100Model
{
	//メイン関数
	/**
	 * テレビ局一覧取得メソッド
	 */


//	所属会社一覧SELECT文実行！！！
//	public static void main(String[] args)
//	{
//		getTelevisionList("", "", "");
//		deleteCompany("0");
//	}

	// テレビ局テーブル参照
	public static List<HashMap<String, String>> getTelevisionList(String televisionId, String televisionName, String televisionAddress)
	{
		//DBを作る準備を行う
		List<HashMap<String, String>> televisionList = new ArrayList<HashMap<String, String>>();


		ResultSet resultSet = null;
		Connection connection = null;
		Statement statement = null;

		//特殊文字をエスケープ文字に置き換える
    	televisionId = ChangeCharacter.CC(televisionId);
    	televisionName = ChangeCharacter.CC(televisionName);
    	televisionAddress = ChangeCharacter.CC(televisionAddress);

		try {

			//－－－－－－－－－－postgresに接続する－－－－－－－－－－//
			// テーブル照会実行
			// データベースへの接続情報を保持、登録
			// ドライバ/サーバ/ポート/DB名/ユーザー名/パスワード
			connection = DBAccessUtils.getConnection();
			// statement作成
			// この接続情報でSQL流すぞー！！！っていう声明みたいなもの
			statement = connection.createStatement();
			// 自動コミットを無効にする
			connection.setAutoCommit(false);

			//－－－－－－－－－－sql文構築－－－－－－－－－－//
			//－－－－－－－－－－String型のsqlにposのテレビ局テーブルを入れている//
			String sql = new String();
			sql = "select * from t_television where ";

//			System.out.println("検索開始:" + sql.toString());

//			televisionIDが空じゃなかったら
			if(!"".equals(televisionId)) {
        		sql = sql + "television_id = '"+ televisionId +"' AND ";
        		System.out.println("2:" + sql);
        	}
//			televisionNameが空じゃなかったら
        	if(!"".equals(televisionName)) {
        		sql = sql + "television_name like '%"+ televisionName +"%' AND ";
        		System.out.println("3:" + sql);
        	}
        	sql = sql + "television_address like '%"+ televisionAddress +"%'";
        	sql = sql + " ORDER BY television_id";
        	System.out.println("4:" + sql);												//sql終了

            System.out.println("引数に" + televisionId + "が入力されました。");
            System.out.println("引数に" + televisionName + "が入力されました。");
            System.out.println("引数に" + televisionAddress + "が入力されました。");
            System.out.println(sql);

			// 作成したSQLを実行するためのメソッド
			// このセレクト文でDBに「 Query(質問、問い合わせ) execute(実行する。)」
			// resultSet 結果をテーブル形式で保持し、色々出来るクラス
			//－－－－－－－－－－設定した内容をもとにSQLをpostgresに投げる－－－－－－－－－－//
			//－－－－－－－－－－resultSetでsqlに入力されたドラマテーブルを保持する－－－－－－－－－－//
			resultSet = statement.executeQuery(sql);

			//SELECT文の結果を参照
            //resultSetが保持するテーブルの一行目からhashMap
            while(resultSet.next()) {
				HashMap<String, String> televisionInfo = new HashMap<String, String>();
				// テレビ局IDをリザルトセット(n行目レコード)から取得
				//employyInfoにresultSetから社員ID、姓、名、誕生日つめる//
				televisionInfo.put("televisionId", resultSet.getString("television_id"));
				televisionInfo.put("televisionName", resultSet.getString("television_name"));
				televisionInfo.put("televisionAddress", resultSet.getString("television_address"));

				//コンソール上に値がとれているか確認するために出力//
				System.out.println(televisionInfo.get("televisionId"));
				System.out.println(televisionInfo.get("televisionName"));
				System.out.println(televisionInfo.get("televisionAddress"));

				// 返却用employyListに取得したemployyInfoの情報を一行ごとに加えていく。
				televisionList.add(televisionInfo);

            }
		}catch (Exception e) {
			// try中で起きたエラーをcatch
			e.printStackTrace();
		}
		 finally{

	        	try {
	        		//データベースのクローズ
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
		return televisionList;
	}

//	テレビ局テーブル削除
	public static int deleteTelevision(String televisionId) {


		Connection connection = null;
		Statement statement = null;
		int deleteCount = 0;

		try
        {
            // テーブル照会実行
			//DBへ接続
        	connection = DBAccessUtils.getConnection();
        	//Statementを取得するためのコード
        	statement = connection.createStatement();
        	//自動コミットを有効にする
            connection.setAutoCommit(true);

            String sql = "DELETE FROM t_television where television_id = '"+ televisionId +"'";
            System.out.println("引数に" + televisionId + "が入力されました。");
            System.out.println(sql);

            //削除成功したかどうかの確認
            deleteCount = statement.executeUpdate (sql);

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
