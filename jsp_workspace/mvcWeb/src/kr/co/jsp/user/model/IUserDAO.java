package kr.co.jsp.user.model;

public interface IUserDAO {

	boolean confirmId(String id);
	
	void insertUser(UserVO vo);
	
	int userCheck(String id, String pw);
	
	UserVO getUserInfo(String id);
	
	void changePassword(String id, String pw);
	
	void updateUser(UserVO vo);
	
	void deleteUser(String id);
	
}
