package jp.co.wiss1.common;

//追加分import↓
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//ここまで↑


public class DBAccessUtils {

	public static Connection getConnection() {
	    // JDBCドライバの登録
	    String driver = "org.postgresql.Driver";
	    // データベースの指定
	    String host   = "localhost";   // PostgreSQL サーバ ( IP または ホスト名 )
	    String port   = "5432";        //ポート番号
	    String dbname   = "postgres";         // データベース名
	    String user     = "postgres";         //データベース作成ユーザ名(ロール名？)
	    String password = "postgres";     //データベース作成ユーザパスワード
	    String url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;

        /* 接続パラメータを設定する */
        //Properties props = new Properties();
        //props.setProperty("user", user);
        //props.setProperty("password", password);

	    Connection con = null;

	    try {
	    	//driver変数にJDBCドライバを読みに行く
		    Class.forName (driver);
		    // データベースとの接続(urlとpropsにアクセス情報を読みに行く)
		    con = DriverManager.getConnection(url, user, password);

	    } catch (ClassNotFoundException e) {
            System.err.println("JDBCドライバが見つかりませんでした。");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("エラーコード    : " + e.getSQLState());
            System.err.println("エラーメッセージ: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();

        }
		return con;
    }
}
