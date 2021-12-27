package api.io.folder;

import java.io.File;

public class DeleteFileEx {

	public static void main(String[] args) {
		
		File file = new File("D:\\Workspace\\CAI_projects\\java_workspace\\Day18\\file\\folder_test");
		
		if (file.exists()) { 
			file.delete(); // delete 성공 시 true, 실패 시 false를 리턴
			System.out.println("폴더 삭제 완료");
		} else {
			System.out.println("해당 폴더 삭제 실패 or 해당 폴더가 존재 하지않습니다.");
		}
		
	}

}
