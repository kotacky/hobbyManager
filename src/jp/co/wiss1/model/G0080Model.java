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

public class G0080Model {



		public static void main(String[] args)
		{
			getPreferenceList("", "", "");
			deletePreference("0");
		}
		//好みテーブル参照
		public static List<HashMap<String, String>> getPreferenceList(String employeeId , String familyName, String firstName )
		{

			List<HashMap<String, String>> preferenceList = new ArrayList<HashMap<String, String>>() ;
			//初期化
			ResultSet resultSet = null;
			Connection connection = null;
			Statement statement = null;
			List<HashMap<String, String>> preferList = new ArrayList<HashMap<String, String>>() ;

			//特殊文字をエスケープ文字に置き換える
			employeeId = ChangeCharacter.CC(employeeId);
			familyName = ChangeCharacter.CC(familyName);
			firstName = ChangeCharacter.CC(firstName);

			// テーブル照会実行
			try{
				//データベースへ接続
				connection = DBAccessUtils.getConnection();
				//Statementを取得するためのコード
				statement = connection.createStatement();
				//自動コミットを無効にする
				connection.setAutoCommit(false);


				String sql = "SELECT distinct t_employee.employee_id,"
						+"t_employee.employee_family_name, "
						+"t_employee.employee_first_name, "
						+"t_actress.actress_id, "
						+"COALESCE(actress_name,'未登録') AS actress_name, "
						+"COALESCE(magazine_name,'未登録') AS magazine_name, "
						+"COALESCE(drama_title,'未登録') AS drama_title, "
						+"COALESCE(movie_title,'未登録') AS movie_title, "
						+"COALESCE(commercial_name,'未登録') AS commercial_name "
						+"FROM "
						+"t_preference "
						+"LEFT OUTER JOIN t_actress ON t_preference.actress_id = t_actress.actress_id "
						+"LEFT OUTER JOIN t_dramas ON t_actress.drama_id = t_dramas.drama_id "
						+"LEFT OUTER JOIN t_movie ON t_actress.movie_id = t_movie.movie_id "
						+"LEFT OUTER JOIN t_magazine ON t_actress.magazine_id = t_magazine.magazine_id "
						+"LEFT OUTER JOIN t_commercial ON t_actress.commercial_id = t_commercial.commercial_id "
						+"LEFT OUTER JOIN t_employee ON t_preference.employee_id = t_employee.employee_id where ";

				System.out.println(sql);

				if(!"".equals(employeeId)) {
					sql = sql + "t_employee.employee_id = '"+ employeeId +"' AND ";
				}
				if(!"".equals(familyName)) {
					sql = sql + "t_employee.employee_family_name like '%"+ familyName +"%' AND ";
				}
				sql = sql + "t_employee.employee_first_name like '%"+ firstName +"%'";
				//sql文終了
				sql = sql + "ORDER BY employee_id";


				System.out.println("引数に" + employeeId + "が入力されました。");
				System.out.println("引数に" + familyName + "が入力されました。");
				System.out.println("引数に" + firstName + "が入力されました。");
				System.out.println(sql);

	          //SELECT文を実行するコード
				resultSet = statement.executeQuery(sql);
				System.out.println(resultSet);

	          //SELECT文の結果を参照
				while(resultSet.next()) {
					HashMap<String, String> preferenceInfo = new HashMap<String, String>();
					preferenceInfo.put("employeeId", resultSet.getString("employee_id"));
					preferenceInfo.put("employeeFamilyName", resultSet.getString("employee_family_name"));
					preferenceInfo.put("employeeFirstName", resultSet.getString("employee_first_name"));
					preferenceInfo.put("actressName", resultSet.getString("actress_name"));
					preferenceInfo.put("magazineName", resultSet.getString("magazine_name"));
					preferenceInfo.put("dramaName", resultSet.getString("drama_title"));
					preferenceInfo.put("movieName", resultSet.getString("movie_title"));
					preferenceInfo.put("commercialName", resultSet.getString("commercial_name"));
					preferenceInfo.put("actressId", resultSet.getString("actress_id"));


					preferenceList.add(preferenceInfo);

	        	   //リストに入ったかの確認
					System.out.println(preferenceInfo.get("employeeId"));
					System.out.println(preferenceInfo.get("employeeFamilyName"));
					System.out.println(preferenceInfo.get("employeeFirstName"));
					System.out.println(preferenceInfo.get("actressId"));
					System.out.println(preferenceInfo.get("actressName"));
					System.out.println(preferenceInfo.get("magazineName"));
					System.out.println(preferenceInfo.get("dramaName"));
					System.out.println(preferenceInfo.get("movieName"));
					System.out.println(preferenceInfo.get("commercialName"));

				}
				for(int i = 1; i <= preferenceList.size(); i++){
					String magazineName, dramaTitle, movieTitle, commercialName;
					//HashMapを作る
					HashMap<String, String> employeePreference = new HashMap<String, String>();
					//HashMapに情報を追加する
					employeePreference.put("employeeId", preferenceList.get(i-1).get("employeeId"));
					employeePreference.put("employeeFamilyName", preferenceList.get(i-1).get("employeeFamilyName"));
					employeePreference.put("employeeFirstName", preferenceList.get(i-1).get("employeeFirstName"));
					employeePreference.put("actressName", preferenceList.get(i-1).get("actressName"));
					magazineName = preferenceList.get(i-1).get("magazineName");
					dramaTitle = preferenceList.get(i-1).get("dramaName");
					movieTitle = preferenceList.get(i-1).get("movieName");
					commercialName = preferenceList.get(i-1).get("commercialName");
					if(i == preferenceList.size()){
						employeePreference.put("magazineName", magazineName);
						employeePreference.put("dramaName", dramaTitle);
						employeePreference.put("movieName", movieTitle);
						employeePreference.put("commercialName", commercialName);
						preferList.add(employeePreference);
						break;
					}
//					ひとつ前の社員IDと比較してる
					if(preferenceList.get(i-1).get("employeeId").equals(preferenceList.get(i).get("employeeId"))){
						//社員IDに登録されている女優のレコード分回す
						for(int j = 0; j < preferenceList.size(); j++){
							//社員が登録した女優とをひもづけて、あってたら処理していく
							if(preferenceList.get(i-1).get("actressId").equals(preferenceList.get(i).get("actressId"))
									&& preferenceList.get(i-1).get("employeeId").equals(preferenceList.get(i).get("employeeId"))){
								if(!preferenceList.get(i-1).get("magazineName").equals(preferenceList.get(i).get("magazineName"))){
									magazineName += "、"+preferenceList.get(i).get("magazineName");
								}
								if(!preferenceList.get(i-1).get("dramaName").equals(preferenceList.get(i).get("dramaName"))){
									movieTitle += "、"+preferenceList.get(i).get("dramaName");
								}


								if(!preferenceList.get(i-1).get("movieName").equals(preferenceList.get(i).get("movieName"))){
									movieTitle += "、"+preferenceList.get(i).get("movieName");
								}
								if(!preferenceList.get(i-1).get("commercialName").equals(preferenceList.get(i).get("commercialName"))){
									commercialName += "、"+preferenceList.get(i).get("commercialName");
								}
								i++;
							}else{
								break;
							}
							if(i == preferenceList.size()){

								break;
							}
						}
						employeePreference.put("magazineName", magazineName);
						employeePreference.put("dramaName", dramaTitle);
						employeePreference.put("movieName", movieTitle);
						employeePreference.put("commercialName", commercialName);
						preferList.add(employeePreference);
					}else{
						employeePreference.put("magazineName", magazineName);
						employeePreference.put("dramaName", dramaTitle);
						employeePreference.put("movieName", movieTitle);
						employeePreference.put("commercialName", commercialName);
						preferList.add(employeePreference);
						continue;
					}
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
	        return preferList;
		}


		//好みテーブル削除
		public static int deletePreference(String employeeId) {


			Connection connection = null;
			Statement statement = null;
			int deleteCount = 0;

			// テーブル照会実行
			try
	        {
				//DBへ接続
	        	connection = DBAccessUtils.getConnection();
	        	//Statementを取得するためのコード
	        	statement = connection.createStatement();
	        	//自動コミットを有効にする
	            connection.setAutoCommit(true);

	            //sql文
	            String sql = "DELETE FROM t_preference where employee_id = '"+ employeeId +"'";
	            System.out.println("引数に" + employeeId + "が入力されました。");
	            System.out.println(sql);

	            deleteCount = statement.executeUpdate (sql);

	            //削除が成功しているかどうかの確認
	            if(deleteCount == 1){
	            	System.out.println("削除成功");
	            }
	            else{
	            	System.out.println("削除失敗");
	            }
	        }
			catch (SQLException e){
			System.err.println("SQL failed.");
			//エラーの情報
			e.printStackTrace ();
			}
			finally{
			}
		return deleteCount;
		}

	}






//SELECT t_actress.actress_id, t_actress.actress_name, t_contents.contents_name, t_contents.summary from t_actress INNER JOIN t_contents
//ON t_actress.contents_id = t_contents.contents_id;


//SELECT t_actress.actress_id, t_actress.actress_name, t_company.company_name, t_contents.contents_name
//from t_actress INNER JOIN
//(t_contents INNER JOIN t_company ON t_contents.company_id = t_company.company_id)
	//ON t_actress.contents_id = t_contents.contents_id where actress_id = 41;


/*

SELECT t_employee.employee_id,
t_employee.employee_family_name, t_employee.employee_first_name,
t_actress.actress_name,
t_contents.contents_name
FROM
(((t_actress INNER JOIN t_preference ON t_actress.actress_id = t_preference.actress_id)
INNER JOIN t_contents ON t_actress.contents_id = t_contents.contents_id)
INNER JOIN t_company ON t_actress.company_id = t_company.company_id)
INNER JOIN t_employee ON t_employee.employee_id = t_preference.employee_id;

*/


/*
String sql = "SELECT t_actress.actress_name, t_actress.actress_id, t_contents.contents_name, t_contents.summary FROM ";						//sql文開始
System.out.println("1:" + sql);

sql = sql + "t_actress INNER JOIN t_contents ";
sql = sql + "ON t_actress.contents_id = t_contents.contents_id";


if(!"".equals(actressId)) {
	sql = sql + "actress_id = '"+ actressId +"' AND ";
	System.out.println("2:" + sql);
}
if(!"".equals(contentsId)) {
	sql = sql + "contents_id = '"+ contentsId +"' AND ";
	System.out.println("3:" + sql);
}
if(!"".equals(companyId)) {
	sql = sql + "company_id = '"+ companyId +"' AND ";
	System.out.println("3:" + sql);
}
	sql = sql + "employee_id = '"+ employeeId +"'";
	System.out.println("4:" + sql);								*/	//sql文終了




/*

SELECT t_employee.employee_id,
t_employee.employee_family_name,
t_employee.employee_first_name,
t_actress.actress_name,
t_contents.contents_name
FROM
((t_preference INNER JOIN t_employee ON t_employee.employee_id = t_preference.employee_id)
	     INNER JOIN t_contents ON t_contents.contents_id = t_preference.contents_id)
              INNER JOIN t_actress ON t_actress.actress_id = t_preference.actress_id AND t_actress.contents_id = t_preference.contents_id;


*/