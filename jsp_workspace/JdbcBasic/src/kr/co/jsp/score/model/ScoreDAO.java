package kr.co.jsp.score.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO는 웹 서버의 DB 연동 요청이 발생할 때마다
// DataBase CRUD(create, read, update, delete)작업을 전담하는 클래스
public class ScoreDAO {

	// 싱글톤 디자인 패턴 (객체의 생성을 단 하나로 제한하기 위한 코드 디자인 패턴)
	// 1. 클래스 외부에서 객체를 생성하지 못하게 생성자에 private 접근 제한을 붙인다.
	private ScoreDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// 2. 객체를 생성할 수 있는 영역은 해당 클래스 뿐이므로 스스로의 객체를 단 하나만 생성
	private static ScoreDAO dao = new ScoreDAO();
	
	// 3. 외부에서 객체를 요구할 시 공개된 메서드를 통해 2번에서 미리 생성한 단 하나의 객체의 주소값을 리턴
	public static ScoreDAO getInstance() {
		if (dao == null) {
			dao = new ScoreDAO();
		}
		return dao;
	}
	
	////////////////////////////////////////////////////////////////
	
	// DB 관련 작업 메서드가 들어가는 공간
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// Connection 객체를 얻을 수 있는 유틸 메서드
	private Connection getConnection() throws Exception {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "jsp";
		String upw = "jsp";
		
		return DriverManager.getConnection(url, uid, upw);
	}
	
	// 점수 데이터를 저장하는 메서드
	public boolean insert(ScoreVO vo) {
		
		// id값은 시퀀스 객체를 이용하여 INSERT 명령이 실행될 때마다
		// 하나씩 증가하도록 명령하면 된다. (NEXTVAL)
		
		boolean flag = false;
		
		String sql = "INSERT INTO scores VALUES(id_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getKor());
			pstmt.setInt(3, vo.getEng());
			pstmt.setInt(4, vo.getMath());
			pstmt.setInt(5, vo.getTotal());
			pstmt.setDouble(6, vo.getAverage());
			
			int rn = pstmt.executeUpdate();
			
			if (rn == 1) {
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
	}
	
	// 점수 목록을 조회하는 메서드
	public List<ScoreVO> selectAll() {
		List<ScoreVO> scoreList = new ArrayList<>();
		String sql = "SELECT * FROM scores ORDER BY id ASC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ScoreVO vo = new ScoreVO(
							rs.getInt("id"),
							rs.getString("name"),
							rs.getInt("kor"),
							rs.getInt("eng"),
							rs.getInt("math"),
							rs.getInt("total"),
							rs.getDouble("average")
						);
				scoreList.add(vo);
			}
			
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
		
		return scoreList;
		
	}
	
	// 점수 데이터를 삭제하는 메서드
	public boolean delete(int id) {
		boolean flag = false;
		
		String sql = "DELETE FROM scores WHERE id = ?";
				
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			int rn = pstmt.executeUpdate();
			
			if (rn == 1) {
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		
		return flag;
				
	}
	
	// 이름 검색 메서드
	public List<ScoreVO> seach(String keyword) {
		
		List<ScoreVO> scoreList = new ArrayList<>();
		
		//String sql = "SELECT * FROM scores WHERE name LIKE ?;
		String sql = "SELECT * FROM scores WHERE name LIKE '%" + keyword + "%' ORDER BY id ASC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ScoreVO vo = new ScoreVO(
							rs.getInt("id"),
							rs.getString("name"),
							rs.getInt("kor"),
							rs.getInt("eng"),
							rs.getInt("math"),
							rs.getInt("total"),
							rs.getDouble("average")
						);
				scoreList.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		
		return scoreList;
		
	}
	
}
