import java.util.Scanner;

public class ArrayInsertQuiz {

	public static void main(String[] args) {
		
		/*
		 1. String 배열을 생성. (foods)
		 	크기는 50개로 지정
		 	
		 2. 사용자에게 음식 이름을 입력 받아서 배열에 삽입한다.
		 	사용자가 음식 입력창에 '배불러' 라고 작성하면
		 	입력을 종료한다.
		 
		 3. 입력이 종료되면 사용자가 입력한 음식을 가로로 출력한다.
		    (null은 출력하지 않는다.)
		    
		 *** 추가 문제 ***
		 - 입력을 받았는데 이미 배열에 존재하는 음식이라면
		   '이미 존재하는 음식입니다.' 를 출력하고
		   다시 새로운 음식을 입력 받을 수 있도록 코드를 제어한다.
		 
		 */
		
		String[] foods = new String[50]; //음식의 이름을 입력 받는 배열 변수명: foods라는 String 배열 생성
		Scanner sc = new Scanner(System.in); //입력 받을 스캐너 선언
		
		for(int i = 0; i < foods.length; i++) { 
			
			System.out.print("음식 이름을 입력하세요 : ");
			String foodName = sc.nextLine();
			
			
			if(foodName.equals("배불러")) { //배열에 들어가지 않도록 입력 종료 선언
				System.out.println("입력을 종료합니다.");
				break;
			}
			
			int j;
			for(j = 0; j< foods.length; j++) {
				if(foodName.equals(foods[j])) {
					break;
				}
			}
			
			if(j != foods.length) {
				System.out.println("이미 존재하는 음식입니다.");
				i--;
				continue;
				
			}
			
			foods[i] = foodName;
			
		}
		
		System.out.println("--------------------------------------");
		System.out.print("먹고 싶은 음식들: ");
		
		for(String f : foods) {
			if(f == null) {
				break;
			}
			System.out.print(f + " ");
		}
		
		sc.close();
		
	}

}
