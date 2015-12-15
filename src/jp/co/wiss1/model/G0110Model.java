package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0110Model
{

	public static void main(String[] args)
	{
		getArtistList("", "","");
		deleteArtist("0");

	}

	//アーティストテーブル参照
	public static List<HashMap<String, String>> getArtistList
	(String artistId,String artistName, String companyName)
	{
		List<HashMap<String, String>> artistList = new ArrayList<HashMap<String, String>>() ;
		//初期化
		ResultSet resultSet = null;
		Connection connection = null;
		Statement statement = null;


        try{

        	//データベースへ接続
	    	connection = DBAccessUtils.getConnection();
	    	//Statementを取得するためのコード
	    	statement = connection.createStatement();
	    	//自動コミットを無効にする
	        connection.setAutoCommit(false);


	        String sql = "SELECT distinct "
	        		+ " t_artist.artist_id, "
	        		+ " t_artist.artist_name, "
	        		+ " t_company.company_name, "
	        		+ "COALESCE(artist_id,'未登録') AS artist_id,"
	        		+ "COALESCE(artist_name,'未登録') AS artist_name,"
	        		+ "COALESCE(company_name,'未登録') AS company_name,"
	        		+ " t_company.company_id"
	        		//+ " t_artist.birth_date,"
	        		//+ " t_artist.blood_type,"
	        		//+ " t_artist.birth_place"
	        		 +" FROM "+"t_artist "
        	         +" LEFT OUTER JOIN t_company "
        	         +" ON t_artist.company_id = t_company.company_id  ";

	        //排他的論理和を使いましょう(^^)
	        if(!"".equals(artistName)) {
	        	sql = sql + "where artist_name like '%" + artistName + "%' ";
		        if(!"".equals(companyName)) {
		        	sql = sql + "AND company_name like '%"+ companyName +"%' ";
		        }
	        }
	        if(!"".equals(companyName) && "".equals(artistName)) {
	        	sql = sql + "where company_name like '%"+ companyName +"%' ";
	        }




	        //if(!"".equals(Name)) {
	        //	sql = sql + "t_artist.artist_name = '"+ artistName +"' AND ";
	        //}


	        //sql = sql + "artist_name like '%"+ artistName +"%'";

	        sql = sql + "ORDER BY company_id ";

	        System.out.println("引数に" + artistId + "が入力されました。");
	        System.out.println("引数に" + artistName + "が入力されました。");
	        System.out.println("引数に" + companyName + "が入力されました。");
	        System.out.println(sql);

            //SELECT文を実行するコード
            resultSet = statement.executeQuery(sql);

            //SELECT文の結果を参照
            while(resultSet.next()) {

        	   HashMap<String, String> artistInfo = new HashMap<String, String>();
        	   artistInfo.put("artistId", resultSet.getString("artist_id"));
        	   artistInfo.put("artistName", resultSet.getString("artist_name"));
        	   artistInfo.put("companyName", resultSet.getString("company_name"));
//        	   artistInfo.put("birthDate", resultSet.getString("birth_date"));
//        	   artistInfo.put("bloodType", resultSet.getString("blood_type"));
//        	   artistInfo.put("birthPlace", resultSet.getString("birth_place"));
        	   artistList.add(artistInfo);

        	   //リストに入ったかの確認
        	   //System.out.println(artistInfo.get("アーティスト一覧カラム"));
        	   System.out.println(artistInfo.get("artistId"));
        	   System.out.println(artistInfo.get("artistName"));
        	   System.out.println(artistInfo.get("companyName"));
//        	   System.out.println(artistInfo.get("birthDate"));
//        	   System.out.println(artistInfo.get("bloodType"));
//        	   System.out.println(artistInfo.get("birthPlace"));
            }

        }
        catch (SQLException e) {
        	System.out.println("SQL failed");
        	e.printStackTrace();
        }
        finally{

        	try {
        		resultSet.close();
        		//データベースのクローズ
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
        return artistList;
	}






	public static int deleteArtist(String artistId) {	 					//アーティストテーブル削除

		List<HashMap<String, String>> artistList = new ArrayList<HashMap<String, String>>() ;
		ResultSet resultSet = null;
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

			String sql = "DELETE FROM t_artist where artist_id = '"+ artistId +"'";

			System.out.println("引数に" + artistId + "が入力されました。");
			System.out.println(sql);

			deleteCount = statement.executeUpdate (sql);

			if(deleteCount != 0 ){																		//削除が成功しているかどうかの確認
            	System.out.println("削除成功");
            }
            else{
            	System.out.println("削除失敗");
            }
        }
		catch (SQLException e){
		System.err.println("SQL failed.");
		e.printStackTrace ();																			//エラーの情報
		}
		finally{
		}
	return deleteCount;
	}
}