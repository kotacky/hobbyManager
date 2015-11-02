package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0062Model {


	//映画一覧UPDATEの実行！！！
	public static void main(String[] args)
	{
		// TODO 自動生成されたメソッド・スタブ
		updateMovie("","","","");
	}


	//映画一覧UPDATE文の実行！！！
	public static int updateMovie(String movieId , String movieTitle , String releaseDate , String movieGenre) { //映画テーブル参照

		Connection connection = null;
    	Statement statement = null;
    	int upDateCount = 0;


        try
        {
            // 映画テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            /* 自動コミットを無効にする */
        	connection.setAutoCommit(true);


            String sql = "UPDATE t_movie SET";
            	if(!"". equals(movieId)){
            		sql = sql+ " movie_title = '"+ movieTitle +"', "
            		+ " release_date = '"+ releaseDate +"', "
            		+ " movie_genre = '"+ movieGenre +"' WHERE"
            		+ " movie_id = '"+ movieId +"'";

                    upDateCount = statement.executeUpdate (sql);
            	}

            System.out.println("引数に" + movieId + "が入力されました。");
            System.out.println("引数に" + movieTitle + "が入力されました。");
            System.out.println("引数に" + releaseDate + "が入力されました。");
            System.out.println("引数に" + movieGenre + "が入力されました。");
            System.out.println(sql);


            System.out.println(upDateCount + "行を更新しました。");


        }
        catch (SQLException e)
        {
            System.err.println("SQL failed.");
            e.printStackTrace ();
        }
        finally{
        	// データベースのクローズ
        	try {
                statement.close();
                connection.close();
        	}
        	catch(Exception e) {
	            System.err.println("Close failed.");
				e.printStackTrace();
        	}
        	finally {
        		System.out.println("更新終了");
        	}
        }
        return upDateCount;
	}
}


