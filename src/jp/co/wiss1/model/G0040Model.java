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

public class G0040Model {

		public static void main(String[] args)
		{
			getMagazineList("", "", "");
			deleteMagazine("0");
		}

		public static List<HashMap<String, String>> getMagazineList(String magazineId , String magazineName , String publisherName)	//コンテンツテーブル参照
		{

			List<HashMap<String, String>> magazineList = new ArrayList<HashMap<String, String>>() ;
			ResultSet resultSet = null;															//初期化
			Connection connection = null;
			Statement statement = null;

			//特殊文字をエスケープ文字に置き換える
			magazineId = ChangeCharacter.CC(magazineId);
			magazineName = ChangeCharacter.CC(magazineName);
			publisherName = ChangeCharacter.CC(publisherName);


	        try{
	            // テーブル照会実行
		    	connection = DBAccessUtils.getConnection(); 									//データベースへ接続
		    	statement = connection.createStatement();										//Statementを取得するためのコード

		        connection.setAutoCommit(false);												//自動コミットを無効にする


	            String sql = "SELECT * FROM t_magazine where ";									//sql文一覧
	            System.out.println("1:" + sql);

	        	if(!"".equals(magazineId)) {
	        		sql = sql + "magazine_id = '"+ magazineId +"' AND ";
	        		System.out.println("2:" + sql);
	        	}

	        		sql = sql + "magazine_name like '%"+ magazineName +"%' AND ";
	        		System.out.println("3:" + sql);

	        		sql = sql + "publisher_name like '%"+ publisherName +"%'";
	        		sql = sql + " ORDER BY magazine_id";
	        		System.out.println("4:" + sql);												//sql文終了

	            System.out.println("引数に" + magazineId + "が入力されました。");
	            System.out.println("引数に" + magazineName + "が入力されました。");
	            System.out.println("引数に" + publisherName + "が入力されました。");
	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード



	            while(resultSet.next()) {														//SELECT文の結果を参照

	        	   HashMap<String, String> magazineInfo = new HashMap<String, String>();
	        	   magazineInfo.put("magazineId", resultSet.getString("magazine_id"));
	        	   magazineInfo.put("magazineName", resultSet.getString("magazine_name"));
	        	   magazineInfo.put("publisherName", resultSet.getString("publisher_name"));

	        	   magazineList.add(magazineInfo);

	            	System.out.println(magazineInfo.get("magazineId"));						//リストに入ったかの確認
	            	System.out.println(magazineInfo.get("magazineName"));
	            	System.out.println(magazineInfo.get("publisherName"));
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
	        return magazineList;
		}






		public static int deleteMagazine(String magazineId) {	 								//コンテンツテーブル削除


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();										//DBへ接続
	        	statement = connection.createStatement();										//Statementを取得するためのコード

	            connection.setAutoCommit(true);													//自動コミットを有効にする

	            String sql = "DELETE FROM t_magazine where magazine_id = '"+ magazineId +"'";
	            System.out.println("引数に" + magazineId + "が入力されました。");
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

