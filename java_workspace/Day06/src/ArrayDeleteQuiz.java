import java.util.Arrays;
import java.util.Scanner;

public class ArrayDeleteQuiz {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String[] kakao = {"무지", "네오", "어피치", "라이언", "제이지", "튜브", "콘"};
		System.out.println("현재 저장된 친구들: " + Arrays.toString(kakao));
		
		System.out.print("삭제할 친구를 입력하세요. : ");
		String name = sc.next();
		
		/*
		 1. 삭제할 친구를 입력 받아서 삭제를 진행하세요.
		 
		 2. 입력받은 이름이 없다면 없다고 얘기해 주세요. 
		 */
		
		int i;
		for(i = 0; i < kakao.length; i++) {
			if(name.equals(kakao[i])) {
				break;
			} else if(i == kakao.length - 1) {
				System.out.println(name + "은(는) 없는 이름입니다.");
			}
		}
		
		if(i != kakao.length) {
			for(int j = i; j < kakao.length - 1; j++) {
				kakao[j] = kakao[j+1];
			}
			String[] temp = new String[kakao.length - 1] ;
			for(int k = 0; k < temp.length; k++) {
				temp[k] = kakao[k];
			}
			kakao = temp;
			temp = null;
			
			System.out.println(Arrays.toString(kakao));
		}
		
		
		/*
		boolean flag = false;
		for(int i = 0; i < kakao.length; i++) {
			if(name.equals(kakao[i])) {
				flag = true;
				for(int j = i; j < kakao.length - 1; j++) {
					kakao[j] = kakao[j+1];
				}
				break;
			}
		}
		
		if(!flag) {
			System.out.println(name + "은(는) 없는 이름입니다.");
		} else {
			String[] temp = new String[kakao.length - 1] ;
			for(int k = 0; k < temp.length; k++) {
				temp[k] = kakao[k];
			}
			kakao = temp;
			temp = null;
			
			System.out.println("삭제 후 정보: " + Arrays.toString(kakao));
			
		} 
		 */
		sc.close();
	}

}
