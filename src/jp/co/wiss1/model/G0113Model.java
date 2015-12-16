package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jp.co.wiss1.common.DBAccessUtils;

public class G0113Model {

	public static void main(String[] args) {
		getColumnCompanyList();
	}



//クラス0110に入れる予定のメソッド

	public static List<HashMap<String,String>> getColumnCompanyList() //プルダウン表示に必要な会社データを送るメソッド
	{
		List<HashMap<String,String>> columnCompanyList = new ArrayList<HashMap<String,String>>() ;//DBから取得したデータを詰める

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
            String columnSelectSql = "SELECT company_id , company_name FROM t_company";
            System.out.println("1:" + columnSelectSql);

            //引数に入った値を出力
            //System.out.println("引数に" + companyName + "が入力されました。");
            System.out.println(columnSelectSql);


            resultSet = statement.executeQuery (columnSelectSql);

            //影響のあった行数を出力

            //System.out.println(insertCount + " 行挿入しました。");


           // テーブル照会結果を出力
           while(resultSet.next())
           {
            	//社員情報を作成する
            	HashMap<String, String> companyInfo = new HashMap<String, String>();
            	companyInfo.put("companyId", resultSet.getString("company_id"));
            	companyInfo.put("companyName", resultSet.getString("company_name"));

            	//社員情報をリストに追加する
            	columnCompanyList.add(companyInfo);

            	//リストに入ったかの確認
            	System.out.println(companyInfo.get("companyId"));
            	System.out.println(companyInfo.get("companyName"));

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
        return columnCompanyList;
	}
}