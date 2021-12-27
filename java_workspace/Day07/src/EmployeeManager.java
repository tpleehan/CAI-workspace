import java.util.Scanner;

//사원 관리 프로그램 제작.
public class EmployeeManager {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		//사원의 정보: 사번, 이름, 나이, 부서명
		String[] userNums = new String[100];
		String[] names = new String[100];
		int[] ages = new int[100];
		String[] departments = new String[100];
		
		//실제로 입력된 데이터(사원의 정보)의 개수를 체크하는 변수.
		int count = 0;
		
		while(true) {
			System.out.println("\n========== 사원 관리 프로그램 ==========");
			System.out.println("# 1. 사원 정보 신규 등록");
			System.out.println("# 2. 모든 사원 정보 보기");
			System.out.println("# 3. 사원 정보 검색");
			System.out.println("# 4. 사원 정보 수정");
			System.out.println("# 5. 사원 정보 삭제");
			System.out.println("# 6. 프로그램 종료");
			System.out.println("========================================");
			
			System.out.print("메뉴 입력: ");
			int menu = sc.nextInt();
			
			if(menu == 1) {
				
				//사원 정보 4가지를 입력 받아 각 배열에 저장하는 코드를 작성
				//사번은 중복되면 안됨
				//(무한루프를 구현해서 중복이 발생하면 다시 입력받기.)
				
				System.out.println("# 사원 정보 등록을 시작합니다.");
				System.out.print("- 사번: ");
				String empNum = sc.next();
				
				while(true) {
					boolean flag = false;
					for(int i = 0; i < count; i++) {
						if (empNum.equals(userNums[i])) { //입력한 사번이 이미 존재하는 경우
							System.out.println("사번은 중복될 수 없습니다.");
							flag = true;
							break;
						}
					}
					if(!flag) { //flag -> false -> 중복 발생 x
						userNums[count] = empNum;
						break; //사번 확인용 무한 루프를 탈출.
					} else {
						System.out.print("- 사번 재입력: ");
						empNum = sc.next();
					}
					
				}
				
				System.out.print("- 이름: ");
				names[count] = sc.next();
				
				System.out.print("- 나이: ");
				ages[count] = sc.nextInt();
				
				System.out.print("- 부서명: ");
				departments[count] = sc.next();
				
				System.out.println(names[count] + "님의 정보가 정상 등록 되었습니다.");
				count++;
				
			} else if(menu == 2) {
				
				//각 배열을 반복문으로 저장된 데이터까지만 출력.
				//만약 사용자가 사원 등록을 한 명도 하지 않았다면
				//"등록된 사원 정보가 없습니다."를 출력
				
				if(count == 0) {
					System.out.println("등록된 사원 정보가 없습니다.");
				} else {
					System.out.println("========== 전체 사원 정보 ==========");
					for(int i = 0; i < count; i++) {
						System.out.printf("%s %s %d세 %s\n", userNums[i], names[i], ages[i], departments[i]);
					}
				}
				
			} else if(menu == 3) {
				
				System.out.println("# 조회할 사원의 번호를 입력하세요.");
				System.out.print("> ");
				String empNum = sc.next();
				
				//입력한 사번에 일치하는 사원의 4가지 정보를 모두 출력
				//입력한 사번이 존재하지 않는다면 "조회한 사원의 정보가 없습니다."
				
				int i;
				for(i = 0; i < count; i++) {
					if(empNum.equals(userNums[i])) {
						System.out.println("========== 사원 정보 ==========");
						System.out.printf("%s %10s %10d세 %10s\n", userNums[i], names[i], ages[i], departments[i]);
						break;
					}
				}
				
				if(i == count) {
					System.out.println("조회한 사원의 정보가 없습니다.");
				} 
				
			} else if(menu == 4) {
				
				//해당 사번과 일치하는 사원의 나이와 부서를 선택적으로 변경할 수 있도록
				//프로그램을 구성, 나이와 부서를 수정하는 코드를 작성
				//사번 입력 -> 존재하는 사번이 맞으면 -> [1. 나이 변경 | 2. 부서 변경 | 3. 취소]
				
				System.out.println("# 수정할 사원의 번호를 입력하세요.");
				System.out.print("> ");
				String empNum = sc.next();
				
				boolean flag = false;
				for(int i = 0; i < count; i++) {
					if(empNum.equals(userNums[i])) {
						System.out.println("# " + names[i] + "님의 정보를 변경합니다.");
						System.out.println("[1. 나이 변경 | 2. 부서 변경 | 3. 취소]");
						System.out.print("> ");
						int sel = sc.nextInt();
						
						switch (sel) {
						case 1:
							System.out.print("- 변경할 나이: ");
							ages[i] = sc.nextInt();
							System.out.printf("나이가 %d세로 변경 되었습니다.\n", ages[i]);
							break;

						case 2:
							System.out.print("- 변경할 부서명: ");
							departments[i] = sc.next();
							System.out.print("부서가 %s로 변경 되었습니다.\n" + departments[i]);
							break;
						
						case 3:
							System.out.println("- 정보 수정을 취소합니다.");
							break;

						default:
							System.out.println("- 변경 메뉴를 잘못 입력하였습니다.");
						}
						
						flag = true;
						break;
					} 
					
				}
				
				if(!flag) {
					System.out.println("조회 결과 존재하는 사원의 번호가 아닙니다.");
				} 
				
			} else if(menu == 5) {
				//해당 사번과 일치하는 사원의 4가지 정보를 각 배열에서 모두 삭제하고
				//삭제하기 전에 "삭제하겠습니까? [Y/N]" 를 입력 받아서
				//y를 눌렀을 시에 삭제가 되도록 코드를 구성하시오.
				//배열의 크기는 줄이지 않는다. 삭제할 인덱스를 기준으로 뒤에 있는 값을
				//앞으로 한칸씩 땡기고 count를 하나 내린다.

				System.out.println("# 삭제할 사원의 번호를 입력하세요.");
				System.out.print("> ");
				String empNum = sc.next();
				
				boolean flag = false;
				for(int i = 0; i < count; i++) {
					if(empNum.equals(userNums[i])) {
						System.out.println("삭제할 사원 이름: " + names[i]);
						System.out.println("삭제하시겠습니까? [Y/N]");
						System.out.print("> ");
						String answer = sc.next();
						
						switch (answer) {
						case "Y": case "y": case "ㅛ":
							for(int j = i; j < count-1; j++) {
								userNums[j] = userNums[j + 1];
								names[j] = names[j + 1];
								ages[j] = ages[j + 1];
								departments[j] = departments[j + 1];
								
							}
							count--;
							System.out.println("# 삭제가 정상적으로 진행되었습니다.");
							break;
							
						case "N": case "n": case "ㅜ":
							System.out.println("# 삭제를 취소합니다.");
							break;
							
						default:
							System.out.println("# 잘 못 입력하였습니다.");
						}
						flag = true;
						break;
						
					}
					
				}
				
				if(!flag) {
					System.out.println("# 조회한 사원 정보는 존재하지 않습니다.");
				}
				
			} else if(menu == 6) {
				System.out.println("프로그램 종료");
				sc.close();
				break;
			} else {
				System.out.println("메뉴를 잘못 입력하였습니다.");
			}
		}
	
	}

}
