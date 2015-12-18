package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0050Model {

		public static void main(String[] args)
		{
			getDramaList("", "", "","","");
			deleteDrama("0");
		}
		//コンテンツテーブル参照
		public static List<HashMap<String, String>>
		getDramaList(String dramaId , String dramaTitle , String broadcastCool, String television, String genre)
		{

			List<HashMap<String, String>> dramaList = new ArrayList<HashMap<String, String>>() ;
			ResultSet resultSet = null;															//初期化
			Connection connection = null;
			Statement statement = null;


	        try{
	            // テーブル照会実行
	        	//データベースへ接続
		    	connection = DBAccessUtils.getConnection();
		    	//Statementを取得するためのコード
		    	statement = connection.createStatement();
		    	//自動コミットを無効にする
		        connection.setAutoCommit(false);

		      //sql文一覧
	            String sql = "SELECT * FROM t_dramas where ";
	            System.out.println("1:" + sql);

	        	if(!"".equals(dramaId)) {
	        		sql = sql + "drama_id = '"+ dramaId +"' AND ";
	        		System.out.println("2:" + sql);
	        	}
	        	if(!"".equals(dramaTitle)) {
	        		sql = sql + "drama_title like '%"+ dramaTitle +"%' AND ";
	        		System.out.println("3:" + sql);
	        	}
	        	if(!"".equals(television)) {
	        		sql = sql + "television_name like '%"+ television +"%' AND ";
	        		System.out.println("3:" + sql);
	        	}
	        		sql = sql + "dramas_genre like '%"+ genre +"%'";
	        		sql = sql + " ORDER BY drama_id";
	        		System.out.println("4:" + sql);												//sql文終了

	            System.out.println("引数に" + dramaId + "が入力されました。");
	            System.out.println("引数に" + dramaTitle + "が入力されました。");
	            System.out.println("引数に" + broadcastCool + "が入力されました。");
	            System.out.println("引数に" + television + "が入力されました。");
	            System.out.println("引数に" + genre + "が入力されました。");

	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード


	          //SELECT文の結果を参照
	            while(resultSet.next()) {

	            	HashMap<String, String> dramaInfo = new HashMap<String, String>();

	            	dramaInfo.put("dramaId", resultSet.getString("drama_id"));
	            	dramaInfo.put("dramaName", resultSet.getString("drama_title"));
	            	dramaInfo.put("broadcastCool", resultSet.getString("broadcast_cool"));
	        	   	dramaInfo.put("television", resultSet.getString("television_name"));
	        	   	dramaInfo.put("genre", resultSet.getString("dramas_genre"));

	        	   	dramaList.add(dramaInfo);

	            	System.out.println(dramaInfo.get("dramaId"));						//リストに入ったかの確認
	            	System.out.println(dramaInfo.get("dramaName"));
	            	System.out.println(dramaInfo.get("broadcastCool"));
	            	System.out.println(dramaInfo.get("television"));
	            	System.out.println(dramaInfo.get("genre"));
	            }

	        }
	        catch (SQLException e) {
	        	System.out.println("SQL failed");
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
	        return dramaList;
		}






		public static int deleteDrama(String dramaId) {	 								//ドラマテーブル削除


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();										//DBへ接続
	        	statement = connection.createStatement();										//Statementを取得するためのコード

	            connection.setAutoCommit(true);													//自動コミットを有効にする

	            String sql = "DELETE FROM t_dramas where drama_id = '"+ dramaId +"'";
	            System.out.println("引数に" + dramaId + "が入力されました。");
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

