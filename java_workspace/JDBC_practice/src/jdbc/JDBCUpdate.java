package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class JDBCUpdate {

	public static void main(String[] args) {
		
		// ID를 입력받는다.
		// 수정할 이름과 이메일도 입력 받는다.
		// 지목한 ID의 이름과 이메일을 새로운 값으로 수정한다.
		// (ID)는 존재하는 ID를 넣어야 수정이 가능하다.
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("*** 회원  수정 페이지 ***");
		
		System.out.print("수정할 아이디: ");
		String id = sc.next();
		
		System.out.print("수정할 이름: ");
		String name = sc.next();
		
		System.out.print("수정할 이메일: ");
		String email = sc.next();
		
		String sql = "UPDATE members SET name = ?, email = ? WHERE id = ?";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "hr";
		String upw = "hr";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, id);
			int rn = pstmt.executeUpdate();
			
			if (rn == 1) {
				System.out.println("회원정보 수정 성공");
			} else {
				System.out.println("회원정보 수정 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				sc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
