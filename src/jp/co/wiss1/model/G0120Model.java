package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0120Model {

		public static void main(String[] args)
		{
			getMusicList("", "");
			deletemusic("0");
		}
		//コンテンツテーブル参照
		public static List<HashMap<String, String>>
		getMusicList(String musicId , String musicname)
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

		      //sql文一覧
	            String sql = "SELECT"
	            		+ "t_music.music_id,"
	            		+ "t_music.music_name,"
	            		+ "t_artist.artist_name"
	            		+"FROM"
	            		+"t_music"
	            		+"LEFT OUTER JOIN t_artist ON t_artist.artist_name = t_music.music_artist";


	            System.out.println("1:" + sql);

	        	if(!"".equals(musicId)) {
	        		sql = sql + "music_id = '"+ musicId +"' AND ";
	        		System.out.println("2:" + sql);
	        	}
	        	if(!"".equals(musicname)) {
	        		sql = sql + "music_name like '%"+ musicname +"%' AND ";
	        		System.out.println("3:" + sql);
	        	}
	        													//sql文終了

	            System.out.println("引数に" + musicId + "が入力されました。");
	            System.out.println("引数に" + musicname + "が入力されました。");

	            System.out.println(sql);

	            resultSet = statement.executeQuery(sql);										//SELECT文を実行するコード


	          //SELECT文の結果を参照
	            while(resultSet.next()) {

	            	HashMap<String, String> musicInfo = new HashMap<String, String>();

	            	musicInfo.put("musicId", resultSet.getString("music_id"));
	            	musicInfo.put("musicName", resultSet.getString("music_name"));

	        	   	musicList.add(musicInfo);

	            	System.out.println(musicInfo.get("musicId"));						//リストに入ったかの確認
	            	System.out.println(musicInfo.get("musicname"));
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






		public static int deletemusic(String musicId) {	 								//ドラマテーブル削除


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			try
	        {
	            // テーブル照会実行
	        	connection = DBAccessUtils.getConnection();										//DBへ接続
	        	statement = connection.createStatement();										//Statementを取得するためのコード

	            connection.setAutoCommit(true);													//自動コミットを有効にする

	            String sql = "DELETE FROM t_musics where music_id = '"+ musicId +"'";
	            System.out.println("引数に" + musicId + "が入力されました。");
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

