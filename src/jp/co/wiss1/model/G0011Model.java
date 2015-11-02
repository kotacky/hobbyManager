package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.DBAccessUtils;

public class G0011Model {

	/**
	 * 社員一覧取得メソッド
	 * @return List 社員情報
	 */
	public static void main(String args[])
	{

		insertEmployee("128" , "大伝馬" , "太郎" , "19910823" , "神奈川県" , "O型" , "社長" , "password");

	}

	//List<HashMap<String,String>>⇒void
	public static int insertEmployee(String employeeId , String familyName , String firstName , String birthDate , String from , String bloodType , String authority, String password) { //社員テーブルにINSERTするメソッド

		//List<HashMap<String,String>> insertEmployee = new ArrayList<HashMap<String,String>>() ;

		//ResultSet resultSet = null;

		//各変数を宣言、初期化
    	Connection connection = null;
    	Statement statement = null;
    	int insertCount = 0;
    	//String columnName = null;
    	//String value = null;

        try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            //自動コミットを有効にする
        	connection.setAutoCommit(true);

        	//主キーが入力されなかったとき、SQL文を実行しない
            String insertSql = "INSERT INTO t_employee ";
            System.out.println("1:" + insertSql);

            if(!"".equals(employeeId))
            {
            	insertSql = insertSql + "(employee_id"
            			+ ",employee_family_name"
            			+ ",employee_first_name"
            			+ ",birth_date"
            			+ ",employee_from"
            			+ ",employee_blood_type"
            			+ ",employee_authority"
            			+ ",employee_password)"
            			+ "VALUES('" + employeeId + "'"
            			+ ",'" + familyName + "'"
						+ ",'" + firstName + "'"
						+ ",'" + birthDate + "'"
						+ ",'" + from + "'"
		            	+ ",'" + bloodType + "'"
		            	+ ",'" + authority + "'"
		            	+ ",'" + password + "')";
            	System.out.println(insertSql);
            	insertCount = statement.executeUpdate(insertSql);
            }
            else
            {
            	System.out.println("主キーが入力されていないのでINSERT文を実行しません。");
            }

            //引数に入った値を出力
            System.out.println("引数に" + employeeId + "が入力されました。");
            System.out.println("引数に" + familyName + "が入力されました。");
            System.out.println("引数に" + firstName + "が入力されました。");
            System.out.println("引数に" + birthDate + "が入力されました。");
            System.out.println("引数に" + from + "が入力されました。");
            System.out.println("引数に" + bloodType + "が入力されました。");
            System.out.println("引数に" + authority + "が入力されました。");
            System.out.println("引数に" + password + "が入力されました。");
            System.out.println(insertSql);

            //String selectSql = "SELECT * FROM t_employee where employee_id like '119' ORDER BY employee_id";
            //System.out.println(selectSql);

            //resultSet = statement.executeQuery (selectSql);

            //影響のあった行数を出力

            System.out.println(insertCount + " 行挿入しました。");


           // テーブル照会結果を出力
           /*while(resultSet.next())
           {
            	//社員情報を作成する
            	HashMap<String, String> employeeInfo = new HashMap<String, String>();
            	employeeInfo.put("社員ID", resultSet.getString("employee_ID"));
            	employeeInfo.put("姓", resultSet.getString("employee_family_name"));
            	employeeInfo.put("名", resultSet.getString("employee_first_name"));
            	employeeInfo.put("生年月日", resultSet.getString("birth_date"));

            	//社員情報をリストに追加する
            	insertEmployee.add(employeeInfo);

            	//リストに入ったかの確認
            	System.out.println(employeeInfo.get("社員ID"));
    			System.out.println(employeeInfo.get("姓"));
    			System.out.println(employeeInfo.get("名"));
    			System.out.println(employeeInfo.get("生年月日"));
            }*/

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
        return insertCount;
	}
}

//同期化テスト