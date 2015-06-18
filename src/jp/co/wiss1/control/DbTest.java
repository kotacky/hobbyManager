

import java.sql.*;

/**
 * @author �{��
 *
 */
public class DbTest {

	/**
	 * @param args
	 */
    public static void main(String[] args) {
    	String name;
        try {
            // JDBC�h���C�o�̓o�^
            String driver = "org.postgresql.Driver";
            // �f�[�^�x�[�X�̎w��
            String server   = "localhost";   // PostgreSQL �T�[�o ( IP �܂��� �z�X�g�� )
            String dbname   = "postgres";         // �f�[�^�x�[�X��
            String url = "jdbc:postgresql://" + server + "/" + dbname;
            String user     = "postgres";         //�f�[�^�x�[�X�쐬���[�U��
            String password = "postgres";     //�f�[�^�x�[�X�쐬���[�U�p�X���[�h
            Class.forName (driver);
            // �f�[�^�x�[�X�Ƃ̐ڑ�
            Connection con = DriverManager.getConnection(url, user, password);
            // �e�[�u���Ɖ���s
            Statement stmt = con.createStatement ();
            String sql = "SELECT * FROM syainlist";
            ResultSet rs = stmt.executeQuery (sql);
            // �e�[�u���Ɖ�ʂ��o��
            while(rs.next()){
            	name = rs.getString("name");
               System.out.println("name�F" + name);
            }
            // �f�[�^�x�[�X�̃N���[�Y
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            System.err.println("SQL failed.");
            e.printStackTrace ();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace ();
        }
    }
}