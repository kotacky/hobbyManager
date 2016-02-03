package jp.co.wiss1.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jp.co.wiss1.common.ChangeCharacter;
import jp.co.wiss1.common.DBAccessUtils;

public class G0011Model {

	/**
	 * 社員一覧取得メソッド
	 * @return List 社員情報
	 */
	public static void main(String args[])
	{

		insertEmployee("128" , "大伝馬" , "太郎" ,"おおでんま","たろう", "19910823" , "神奈川県" , "O型" , "社長" , "password");

	}

	//List<HashMap<String,String>>⇒void
	public static int insertEmployee(String employeeId , String familyName , String firstName,String familyNameRead ,String firstNameRead, String birthDate , String from , String bloodType , String authority, String hashedPassword) { //社員テーブルにINSERTするメソッド

		//List<HashMap<String,String>> insertEmployee = new ArrayList<HashMap<String,String>>() ;

		//ResultSet resultSet = null;

		//各変数を宣言、初期化
    	Connection connection = null;
    	Statement statement = null;
    	int insertCount = 0;
    	ResultSet resultSet = null;
    	//String columnName = null;
    	//String value = null;

		//特殊文字をエスケープ文字に置き換える
		employeeId = ChangeCharacter.CC(employeeId);
		familyName = ChangeCharacter.CC(familyName);
		firstName = ChangeCharacter.CC(firstName);
		firstNameRead = ChangeCharacter.CC(firstNameRead);
		familyNameRead = ChangeCharacter.CC(familyNameRead);
		birthDate = ChangeCharacter.CC(birthDate);
		from = ChangeCharacter.CC(from);
		bloodType = ChangeCharacter.CC(bloodType);
		authority = ChangeCharacter.CC(authority);
		hashedPassword = ChangeCharacter.CC(hashedPassword);

		System.out.print("確認"+firstNameRead);

		try
        {
            // テーブル照会実行
        	connection = DBAccessUtils.getConnection();
        	statement = connection.createStatement();

            //自動コミットを有効にする
        	connection.setAutoCommit(true);

        	//employeeIdをt_employeeから取得
        	String sql = "SELECT * FROM t_employee where employee_id = '"+ employeeId + "'";

        	//このセレクト文でDBに「 Query(質問、問い合わせ) execute(実行する。)」
        	//resultSet 結果をテーブル形式で保持し、色々出来るクラス
        	resultSet = statement.executeQuery(sql);

        	//SELECT文の結果を参照
            while(resultSet.next()) {
	             //入力されたcompanyIdとテーブルのcompanyIdを比較。同じだったらcontrolに返す。
           	 	if(employeeId.equals(resultSet.getString("employee_id"))){
	            	 insertCount = 2;
	            	 return insertCount;
           	 	}
            }

        	//主キーが入力されなかったとき、SQL文を実行しない
            if(!"".equals(employeeId) && employeeId.matches("[0-9]{4}") && familyName.matches("[ぁ-んァ-ンa-zA-Z一-龠]+") && firstName.matches("[ぁ-んァ-ンa-zA-Z一-龠]+"))
            {
            	String insertSql = "INSERT INTO t_employee ";
                System.out.println("1:" + insertSql);
            	insertSql = insertSql + "(employee_id"
            			+ ",employee_family_name"
            			+ ",employee_first_name"
            			+ ",employee_family_name_read"
            			+ ",employee_first_name_read"
            			+ ",birth_date"
            			+ ",employee_from"
            			+ ",employee_blood_type"
            			+ ",employee_authority"
            			+ ",employee_password)"
            			+ "VALUES('" + employeeId + "'"
            			+ ",'" + familyName + "'"
						+ ",'" + familyNameRead + "'"
						+ ",'" + firstName + "'"
						+ ",'" + firstNameRead +  "'"
						+ ",'" + birthDate + "'"
						+ ",'" + from + "'"
		            	+ ",'" + bloodType + "'"
		            	+ ",'" + authority + "'"
		            	+ ",'" + hashedPassword + "')";

            	insertCount = statement.executeUpdate(insertSql);
            	System.out.println(firstName + "確認No17");
            	System.out.println(firstNameRead + "確認No8");
            	System.out.println(familyNameRead + "確認No18");
            	System.out.println(familyName + "確認No20");
                System.out.println(insertSql);

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
            System.out.println("引数に" + hashedPassword + "が入力されました。");


            //影響のあった行数を出力

            System.out.println(insertCount + " 行挿入しました。");


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