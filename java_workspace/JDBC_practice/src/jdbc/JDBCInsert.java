package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class JDBCInsert {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("*** 회원 가입 페이지 ***");
		
		System.out.print("아이디: ");
		String id = sc.next();
		
		System.out.print("비밀번호: ");
		String pw = sc.next();
		
		System.out.print("이름: ");
		String name = sc.next();
		
		System.out.print("이메일: ");
		String email = sc.next();
		
		
		////////////////////////////////////////////////////////////////////
		
		// SQL문 작성
		// SQL문은 String 형태로 작성한다.
		// 변수가 들어갈 자리에 ?(물음표)를 채운다.
		String sql = "INSERT INTO members VALUES (?, ?, ?, ?)";
		
		// DB 연동 순서
		// 1. DB 사용자 계정명, 암호, DB url 등 초기 데이터 변수 설정
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "hr";
		String upw = "hr";
		
		// 사용할 객체의 변수를 미리 선언 (finally에서 사용하기 위함)
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// 2. JDBC 커넥터 드라이버를 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 3. DB 연동을 위한 클래스들의 객체를 생성
			/*
			 * # a. Connection 객체
			 *  DB와의 연결(접속)을 위한 객체 
			 *  Connection 객체는 직접 new 연산자를 통해 객체를 생성하는 것이 아니고
			 *  DriverManager 클래스가 제공하는 정적 메서드인 
			 *  getConnection()을 호출하여 객체를 받아온다.
			 */
			conn = DriverManager.getConnection(url, uid, upw);
			
			/*
			 * # b. PreparedStatement 객체
			 *  SQL문을 실행시키기 위한 객체
			 *  pstmt 객체는 conn 객체가 제공하는 메서드 
			 *  prepareStatement() 메서드를 호출하여 객체를 받아온다.
			 *  매개값으로 실행시킬 sql문을 전달한다.
			 */
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * # c. 물음표 채우기 (SQL문 완성하기)
			 *  pstmt 객체를 생성했다면 SQL의 ?를 채운다.
			 *  - ?는 첫번째 물음표부터 1번 인덱스값을 가지며, 순차적으로 인덱스가 1씩 증가한다.
			 *  - DB 테이블의 컬럼 타입에 따라 
			 *    setString(), setInt(), setDouble() ... 등의 메서드를 통해 ?를 채운다.
			 */
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			/*
			 * # d. pstmt 객체를 통한 SQL문 실행
			 * 1. INSERT, UPDATE, DELETE 명령일 경우
			 *    executeUpdate() 를 호출한다.
			 * 2. SELECT 명령일 경우 executeQuery()를 호출한다.
			 * 3. executeUpdate()는 sql문 실행 시
			 *    성공한 쿼리문의 개수를 리턴하고 실패 시 0을 리턴한다. 
			 */
			 
			int rn = pstmt.executeUpdate();
			
			if (rn == 1) {
				System.out.println("DB에 회원정보 저장 성공");
			} else {
				System.out.println("DB에 회원정보 저장 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			/*
			 * 4. DB 연동 객체들 자원 반납
			 * - 원활한 JDBC 프로그래밍을 위해 사용한 자원을 반납한다.
			 */
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
