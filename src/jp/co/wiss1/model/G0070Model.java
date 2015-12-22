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

public class G0070Model {

		public static void main(String[] args)
		{
			getCommercialList("", "", "");
			deleteCommercial("0");
		}

		public static List<HashMap<String, String>> getCommercialList(String commercialId , String commercialName , String sponserName)	//映画テーブル参照
		{

			List<HashMap<String, String>> commercialList = new ArrayList<HashMap<String, String>>() ;
			ResultSet resultSet = null;															//初期化
			Connection connection = null;
			Statement statement = null;

			//特殊文字をエスケープ文字に置き換える
			commercialId = ChangeCharacter.CC(commercialId);
			commercialName = ChangeCharacter.CC(commercialName);
			sponserName = ChangeCharacter.CC(sponserName);

	        try{
	            // テーブル照会実行
		    	connection = DBAccessUtils.getConnection(); 									//データベースへ接続
		    	statement = connection.createStatement();										//Statementを取得するためのコード

		        connection.setAutoCommit(false);												//自動コミットを無効にする


	            String sql = "SELECT * FROM t_commercial where ";									//sql文一覧
	            System.out.println("1:" + sql);

	        	if(!"".equals(commercialId)) {
	        		sql = sql + "commercial_id = '"+ commercialId +"' AND ";
	        		System.out.println("2:" + sql);
	        	}
	        	if(!"".equals(commercialName)) {
	        		sql = sql + "commercial_name like '%"+ commercialName +"%' AND ";
	        		System.out.println("3:" + sql);
	        	}
	        		sql = sql + "sponser_name like '%"+ sponserName +"%'";
	        		sql = sql + " ORDER BY commercial_id";
	        		System.out.println("4:" + sql);												//sql文終了

	            System.out.println("引数に" + commercialId + "が入力されました。");
	            System.out.println("引数に" + commercialName + "が入力されました。");
	            System.out.println("引数に" + sponserName + "が入力されました。");
	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード



	            while(resultSet.next()) {														//SELECT文の結果を参照

	        	   HashMap<String, String> commercialInfo = new HashMap<String, String>();
	        	   commercialInfo.put("commercialId", resultSet.getString("commercial_id"));
	        	   commercialInfo.put("commercialName", resultSet.getString("commercial_name"));
	        	   commercialInfo.put("sponserName", resultSet.getString("sponser_name"));

	        	   commercialList.add(commercialInfo);

	            	System.out.println(commercialInfo.get("commercialId"));						//リストに入ったかの確認
	            	System.out.println(commercialInfo.get("commercialName"));
	            	System.out.println(commercialInfo.get("sponserName"));
	            }

	        }
	        catch (SQLException e) {
	        	System.out.println("SQL failed");
	        	e.printStackTrace();
	        }
	        finally{

	        	try {
	        		resultSet.close();															//データベースのクローズ
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
	        return commercialList;
		}






		public static int deleteCommercial(String commercialId) {	 								//CMテーブル削除


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();										//DBへ接続
	        	statement = connection.createStatement();										//Statementを取得するためのコード

	            connection.setAutoCommit(true);													//自動コミットを有効にする

	            String sql = "DELETE FROM t_commercial where commercial_id = '"+ commercialId +"'";
	            System.out.println("引数に" + commercialId + "が入力されました。");
	            System.out.println(sql);

	            deleteCount = statement.executeUpdate (sql);

	            if(deleteCount == 1){															//削除が成功しているかどうかの確認
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

