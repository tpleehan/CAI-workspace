package api.io.buffered;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BufferedQuiz {

	public static void main(String[] args) {

		/*
		 * 1. Date클래스와 SimpleDateFormat클래스를 활용하여 
		 *    file 경로에 20211111.txt이름으로 파일을 쓴다.
		 * 2. 내용은 아무거나 작성해도 무방
		 * 3. 파일을 정상적으로 썼다면 BufferedReader를 통해 파일을 읽어들인다.
		 */

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(date);

		String str = "안녕하세요. 반갑습니다. \n오늘은" +  today + "입니다. \n오늘의 날씨가 춥기 때문에 감기를 조심하세요. \n즐거운 하루 되세요.";
		
		FileWriter fw = null;
		BufferedWriter bw = null;
		
		
		try {
			fw = new FileWriter("D:\\Workspace\\CAI_projects\\java_workspace\\Day18\\file\\" + today + ".txt");
			bw = new BufferedWriter(fw);
			
			bw.write(str);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				bw.close();
				fw.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		/////////////////////////// 파일 읽기 ///////////////////////////
		
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			fr = new FileReader("D:\\Workspace\\CAI_projects\\java_workspace\\Day18\\file\\" + today + ".txt");
			br = new BufferedReader(fr);
			
			String read;
			
			while ((read = br.readLine()) != null) {
				System.out.println(read);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}
