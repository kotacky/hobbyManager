package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0040Model {

		public static void main(String[] args)
		{
			getContentsList("", "", "");
			deleteContents("0");
		}

		public static List<HashMap<String, String>> getContentsList(String contentsId , String contentsName , String summary)	//コンテンツテーブル参照
		{

			List<HashMap<String, String>> contentsList = new ArrayList<HashMap<String, String>>() ;
			ResultSet resultSet = null;															//初期化
			Connection connection = null;
			Statement statement = null;


	        try{
	            // テーブル照会実行
		    	connection = DBAccessUtils.getConnection(); 									//データベースへ接続
		    	statement = connection.createStatement();										//Statementを取得するためのコード

		        connection.setAutoCommit(false);												//自動コミットを無効にする


	            String sql = "SELECT * FROM t_contents where ";									//sql文一覧
	            System.out.println("1:" + sql);

	        	if(!"".equals(contentsId)) {
	        		sql = sql + "contents_id = '"+ contentsId +"' AND ";
	        		System.out.println("2:" + sql);
	        	}
	        	if(!"".equals(contentsName)) {
	        		sql = sql + "contents_name like '%"+ contentsName +"%' AND ";
	        		System.out.println("3:" + sql);
	        	}
	        		sql = sql + "summary like '%"+ summary +"%'";
	        		sql = sql + " ORDER BY contents_id";
	        		System.out.println("4:" + sql);												//sql文終了

	            System.out.println("引数に" + contentsId + "が入力されました。");
	            System.out.println("引数に" + contentsName + "が入力されました。");
	            System.out.println("引数に" + summary + "が入力されました。");
	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード



	            while(resultSet.next()) {														//SELECT文の結果を参照

	        	   HashMap<String, String> contentsInfo = new HashMap<String, String>();
	        	   contentsInfo.put("contentsId", resultSet.getString("contents_id"));
	        	   contentsInfo.put("contentsName", resultSet.getString("contents_name"));
	        	   contentsInfo.put("summary", resultSet.getString("summary"));

	        	   contentsList.add(contentsInfo);

	            	System.out.println(contentsInfo.get("contentsId"));						//リストに入ったかの確認
	            	System.out.println(contentsInfo.get("contentsName"));
	            	System.out.println(contentsInfo.get("summary"));
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
	        return contentsList;
		}






		public static int deleteContents(String contentsId) {	 								//コンテンツテーブル削除


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();										//DBへ接続
	        	statement = connection.createStatement();										//Statementを取得するためのコード

	            connection.setAutoCommit(true);													//自動コミットを有効にする

	            String sql = "DELETE FROM t_contents where contents_id = '"+ contentsId +"'";
	            System.out.println("引数に" + contentsId + "が入力されました。");
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

