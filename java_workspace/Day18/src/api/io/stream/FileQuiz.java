package api.io.stream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class FileQuiz {

	public static void main(String[] args) {
		
		/*
		 * 1. 스캐너를 통해서 파일명을 정확히 입력받는다.
		 * 
		 * 2. file폴더에 해당 파일이 존재한다면 해당 파일을 upload폴더로 복사한다.
		 *    파일이 존재하지 않는다면 "파일명이 없습니다." 라고 예외구문을 출력
		 *    
		 * 3. 복사 도중에 에러가 발생하면 "파일 처리 중 예외 발생!" 구문을 출력
		 */
		
		Scanner sc = new Scanner(System.in);
		
		FileInputStream  oldFile = null;
		FileOutputStream newFile = null;
		
		try {
			System.out.print("파일명을 입력하세요: ");
			String name = sc.next();
			
			oldFile = new FileInputStream("D:\\Workspace\\CAI_projects\\java_workspace\\Day18\\file\\" + name + ".txt");
			newFile = new FileOutputStream("D:\\Workspace\\CAI_projects\\java_workspace\\Day18\\upload\\" + name + ".txt");
			int result;
			byte[] arr = new byte[100];
			
			/*
			while ((result = oldFile.read(arr)) != -1) {
				newFile.write(arr, 0, result);
				
			}
			 */
			
			while (true) {
				result = oldFile.read(arr);
				if (result == -1) {
					break;
				} else {
					newFile.write(arr, 0, result);
				}
			}
			System.out.println("파일 복사를 완료 했습니다.");
			
		} catch (FileNotFoundException e) {
			System.out.println("해당 파일명을 찾을 수 없습니다.");
		} catch (IOException e){
			System.out.println("파일 처리 중 예외가 발생했습니다.");
		} finally {
			try {
				oldFile.close();
				newFile.close();
				sc.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
				
	}

}
