package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0123Model {

	public static void main(String[] args) {
		getColumnArtistList();

	}


	public static List<HashMap<String,String>> getColumnArtistList() //プルダウン表示に必要な会社データを送るメソッド
	{
		List<HashMap<String,String>> columnArtistList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

		//各変数を宣言、初期化
		ResultSet resultSet = null;
    	Connection connection = null;
    	Statement statement = null;


        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            //自動コミットを無効にする
        	connection.setAutoCommit(false);

        	//プルダウン用にカラム名を取得
            String columnSelectSql = "SELECT artist_id , artist_name FROM t_artist";
            System.out.println("1:" + columnSelectSql);

            //引数に入った値を出力
            //System.out.println("引数に" + artistName + "が入力されました。");
            System.out.println(columnSelectSql);


            resultSet = statement.executeQuery (columnSelectSql);

            //影響のあった行数を出力

            //System.out.println(insertCount + " 行挿入しました。");


           // テーブル照会結果を出力
           while(resultSet.next())
           {
            	//社員情報を作成する
            	HashMap<String, String> artistInfo = new HashMap<String, String>();
            	artistInfo.put("artistId", resultSet.getString("artist_id"));
            	artistInfo.put("artistName", resultSet.getString("artist_name"));

            	//社員情報をリストに追加する
            	columnArtistList.add(artistInfo);

            	//リストに入ったかの確認
            	System.out.println(artistInfo.get("artistId"));
            	System.out.println(artistInfo.get("artistName"));

			}

        }
        catch (SQLException e)
        {
            System.err.println("SQL failed.");
            e.printStackTrace ();
        }
        finally
        {
			// データベースのクローズ
        	try
        	{
                //resultSet.close();
                statement.close();
                connection.close();
        	}
        	catch (Exception e)
        	{
        		System.out.println("Close failed.");
        	}
        	System.out.println("一覧取得処理終了");
        }
        return columnArtistList;
	}
}
