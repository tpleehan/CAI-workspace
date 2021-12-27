package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCSelect {

	public static void main(String[] args) {
		
		String sql = "SELECT * FROM members";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "hr";
		String upw = "hr";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // SELECT문에서만 사용하는 객체
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			// SELECT문은 executeQuery()를 통해 ResultSet 객체를 받아온다.
			// rs는 SELECT문의 쿼리 실행 결과 전체를 가지고 있다.
			rs = pstmt.executeQuery();
			
			/*
			 * - SELECT 쿼리문의 실행 결과, 조회할 데이터가 단 한 줄이라도 존재한다면
			 *   rs 객체의 next() 메서드는 true값을 리턴하면서 해당 행을 지목한다. 
			 *   (리턴값이 true이기 때문에 while을 사용 / 정확한 범위를 모르기 때문에 for보다 while이 좋다.) 
			 *   rs에게 데이터를 읽어올 때 반드시 next() 메서드를 먼저 호출해서
			 *   데이터의 존재 유무를 물어보고 확인해야 한다.
			 *   next() 메서드를 호출을 해야 행 하나만 지목되면서 데이터를 부를 수 있다.
			 */
			int count = 0;
			while (rs.next()) {
				/*
				 * - SELECT의 실행 결과 컬럼을 읽어오려면
				 *   rs의 getString(), getInt(), getDouble() ...
				 *   메서드를 사용해서 리턴을 받는다. (컬럼의 타입에 따라)
				 */
				String id = rs.getString("id"); // getString(컬럼명) 컬럼명은 반드시 정확하게 입력해야한다.
				String pw = rs.getString("pw"); // DB 컬럼명 확인을 해야 한다.
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.printf("# 아이디: %s\n# 비밀번호: %s\n# 이름: %s\n# 이메일: %s\n", id, pw, name, email);
				System.out.println("-----------------------------------------");
				count++;
			} 
			System.out.println("조회된 행의 개수: " + count + "개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
