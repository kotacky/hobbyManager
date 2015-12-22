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

public class G0120Model {

		public static void main(String[] args)
		{
			getMusicList("", "","");
			deleteMusic("0");
		}
		//コンテンツテーブル参照
		public static List<HashMap<String, String>>
		getMusicList(String musicId , String musicName, String artistName)
		{

			List<HashMap<String, String>> musicList = new ArrayList<HashMap<String, String>>() ;
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

	        	//エスケープ文字に置き換え
		        musicId = ChangeCharacter.CC(musicId);
		        musicName = ChangeCharacter.CC(musicName);
		        artistName = ChangeCharacter.CC(artistName);
		      //sql文一覧
	            String sql = "SELECT distinct "
	            		+  "t_music.music_id, "
	            		+ " t_music.music_name, "
	            		+ "COALESCE(artist_name,'未登録') AS artist_name, "
	            	    + " t_artist.artist_id"
	        		 +" FROM "+" t_music "
	            	 +" LEFT OUTER JOIN t_artist "
	        		 +" ON t_music.artist_id = t_artist.artist_id where ";


	            if(!"".equals(musicId)) {
	            	sql = sql + " t_music.music_id = '"+ musicId +"' AND ";
	            }
		        	sql = sql + " music_name like '%" + musicName + "%' ";

		        	if (artistName != null && !"".equals(artistName)) {
			        	sql = sql + "AND artist_name like '%"+ artistName +"%' ";
		        	}



	            System.out.println("引数に" + musicId + "が入力されました。");
	            System.out.println("引数に" + musicName + "が入力されました。");
	            System.out.println("引数に" + artistName + "が入力されました。");
	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);

	          //SELECT文の結果を参照
	            while(resultSet.next()) {

	            	HashMap<String, String> musicInfo = new HashMap<String, String>();
	            	musicInfo.put("musicId", resultSet.getString("music_id"));
	            	musicInfo.put("musicName", resultSet.getString("music_name"));
	            	musicInfo.put("artistName", resultSet.getString("artist_name"));
	        	   	musicList.add(musicInfo);

	            	System.out.println(musicInfo.get("musicId"));						//リストに入ったかの確認
	            	System.out.println(musicInfo.get("musicName"));
	            	System.out.println(musicInfo.get("artistName"));
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
	        return musicList;
		}






		public static int deleteMusic(String musicId) {	 								//ドラマテーブル削除

			List<HashMap<String, String>> musicList = new ArrayList<HashMap<String, String>>() ;
			ResultSet resultSet = null;
			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();										//DBへ接続
	        	statement = connection.createStatement();										//Statementを取得するためのコード

	            connection.setAutoCommit(true);													//自動コミットを有効にする

	            String sql = "DELETE FROM t_music where music_id = '"+ musicId +"'";
	            System.out.println("引数に" + musicId + "が入力されました。");
	            System.out.println(sql);

	            deleteCount = statement.executeUpdate (sql);

	            if(deleteCount == 0){															//削除が成功しているかどうかの確認
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

