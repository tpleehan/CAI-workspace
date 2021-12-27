package kr.co.jsp.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO implements IUserDAO {

	
	private DataSource ds;
	
	private UserDAO() {
		
		try {
			InitialContext ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/myOracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	private static UserDAO dao = new UserDAO();
	
	public static UserDAO getInstance() {
		if (dao == null) {
			dao = new UserDAO();
		}
		return dao;
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public boolean confirmId(String id) {
		
		boolean flag = false;
		
		String sql = "SELECT * FROM mvc_user WHERE user_id = ?";
		
		try (Connection conn = ds.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return flag;
	}

	@Override
	public void insertUser(UserVO vo) {
		
		String sql = "INSERT INTO mvc_user VALUES (?, ?, ?, ?, ?, ?)";
	
	    try (Connection conn = ds.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getAddress());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	@Override
	public int userCheck(String id, String pw) {
		
		int check = 0;
		
		String sql = "SELECT * FROM mvc_user WHERE user_id = ?";
		
		try (Connection conn = ds.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String dbPw = rs.getString("user_pw");
				if (dbPw.equals(pw)) check = 1;
				else check = 0;
				
			} else {
				check = -1;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return check;
	}

	@Override
	public UserVO getUserInfo(String id) {
		
		UserVO user = null;
		
		String sql = "SELECT * FROM mvc_board INNER JOIN mvc_user ON writer = user_id WHERE user_id = '" + id + "'";
		
		try (Connection conn = ds.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 ResultSet rs = pstmt.executeQuery()) {
			
			if (rs.next()) {
				user = new UserVO(
							rs.getString("user_id"),
							rs.getString("user_pw"),
							rs.getString("user_name"),
							rs.getString("user_phone"),
							rs.getString("user_email"),
							rs.getString("user_address")
						);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return user;
	}

	@Override
	public void changePassword(String id, String newPw) {
		
		String sql = "UPDATE mvc_user SET user_pw = ? WHERE user_id = ?";
		
		try (Connection conn = ds.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, newPw);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUser(UserVO vo) {
		
		String sql = "UPDATE mvc_user "
				+ "SET user_name = ?, user_pw = ?, user_email = ?, user_phone = ?, user_address = ? "
				+ "WHERE user_id = ?";
		
		try (Connection conn = ds.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getAddress());
			pstmt.setString(6, vo.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteUser(String id) {
		
		String sql = "DELETE FROM mvc_user WHERE user_id = ?";
		
		try (Connection conn = ds.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
