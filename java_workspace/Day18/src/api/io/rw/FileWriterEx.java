package api.io.rw;

import java.io.FileWriter;
import java.io.IOException;

public class FileWriterEx {

	public static void main(String[] args) {

		/*
		 * - 문자를 써서 저장할 때 사용하는 클래스 FileWriter
		 * - 기본적으로 2byte 단위로 처리하기 때문에 문자 쓰기에 적합
		 */
		
		FileWriter fw = null;
		
		try {
			fw = new FileWriter("D:\\Workspace\\CAI_projects\\java_workspace\\Day18\\file\\hello.txt");
			
			// \r: 캐리지 리턴 -> 커서를 맨 앞으로 땡기는 동작
			// \n: 줄 개행 (줄바꿈)
			// 상황과 환경에 따라 줄 개행 시 커서를 맨 앞으로 안 땡겨주는 경우가 있다.
			String str = "오늘은 11월 11일 입니다.\r\n목요일 입니다.\r\n모두 즐거운 하루 되세요.";
			fw.write(str);
			
			System.out.println("파일이 정상적으로 저장 되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
