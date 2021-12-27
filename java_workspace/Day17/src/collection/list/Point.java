package collection.list;

import java.util.List;
import java.util.Scanner;

// 프로그램의 기능들을 메서드화 시킨 클래스
public class Point {

	private Scanner sc = new Scanner(System.in);
	
	// 점수 입력창 틀 메서드.
   public void showPointUI() {
      System.out.println("================================================================");
      System.out.printf("%4s%6s%7s%8s%8s%8s%8s%8s\n"
            , "학번", "이름", "국어", "영어", "수학", "총점", "평균", "학점");
      System.out.println("================================================================");
   }
	
	//프로그램 메뉴 정보를 보여줄 메서드
	public int menuInfo() {
		System.out.println("*** 성적 관리 프로그램 ***");
		System.out.println("# 1. 성적 정보 입력");
		System.out.println("# 2. 전체 성적 조회");
		System.out.println("# 3. 개별 성적 조회");
		System.out.println("# 4. 성적 정보 수정");
		System.out.println("# 5. 성적 정보 삭제");
		System.out.println("# 6. 프로그램 종료");
		System.out.println("------------------------");
		System.out.print("# 메뉴를 입력하세요: ");
		int menu = sc.nextInt();
		return menu;
	}

	// 1. 학생의 성적 정보를 입력할 메서드
	public void inputPoints(List<Student> students) {
		/*
		 * 1. 학생 객체를 1개 생성
	     * 2. 학생 객체에 속성값을 설정하는 메서드들을 호출
	     * 3. 정보 저장이 완료된 객체를 리스트(sList)에 추가
	     * 4. 저장 완료 메세지를 호출
	     *    ex) XXX님의 성적 정보가 정상적으로 입력되었습니다.
		 */
		
		Student stu = new Student();
		students.add(stu);
//		stu.inpuetStuInfo();
//		stu.calcTotAvgGrade();
		
		System.out.println(stu.getName() + "님의 성적 정보가 정상적으로 입력되었습니다.");
		
	}
	
	// 2. 전체 학생들의 성적 정보를 출력할 메서드
	public void showAllPoints(List<Student> students) { // 학생 객체들이 들어있는 리스트
		
		/*
		 * 1. 리스트 안에 들어있는 학생 객체들의 정보를 반복문을 이용하여 하나씩 전체 출력
		 *    한 명의 학생 정보를 출력하는 메서드는 이미 작성 완료 (outputStuInfo)
		 *    
		 * 2. 학생 점수를 출력할 때 showPointUI를 먼저 출력하고 학생들의 점수를 밑에 반복 출력
		 * 
		 * 3. 우리 반 평균을 가장 아랫부분에 출력
		 */
		
		double totalAvg = 0.0;
		
		showPointUI();
		
		for (Student stu : students) {
			stu.outputStuInfo();
			totalAvg += stu.getAverage();
		}
		System.out.println("--------------------------------------------");
		System.out.printf("\t\t\t\t\t우리반 전체 평균: %.2f점\n", totalAvg / students.size());
		
	}
	
	// 3. 개별 성적 조회 로직을 처리할 메서드
	public void searchPoint(List<Student> students) {
		System.out.println("성적을 조회할 학생의 학번을 입력하세요.");
		System.out.print("> ");
		String stuNum = sc.next();
		
		/*
		 * 1. 입력받은 학번과 일치하는 학생 객체를 리스트에서 찾아내어 그 학생의 성적 정보만 출력
		 * 2. 찾는 학번이 존재하지 않는다면 검색하지 못했다는 메세지를 출력
		 */
		
		boolean flag = false;
		for (Student stu : students) {
			if (stuNum.equals(stu.getStuId())) {
				System.out.printf("%s님의 성적 정보를 출력합니다.\n", stu.getName());
				showPointUI();
				stu.outputStuInfo();
				flag = true;
				break;
			} 
			
		}
		
		if (!flag) {
			System.out.println("입력한 학번과 일치하는 학생 정보가 존재하지 않습니다.");
		}
		
		
	}
	
	// 4. 학생의 개인 성적 정보를 수정하는 메서드
	public void modifyPoint(List<Student> students) {
		/*
		 * - 먼저 학번을 입력 받는다.
		 * - 해당 학번과 일치하는 학생 객체를 리스트에서 찾아내어 
		 *   그 학생의 국어, 영어, 수학점수를 새롭게 입력받아 수정을 진행
		 *   점수를 수정했다면 그 학생의 총점, 평균, 학점도 새롭게 계산
		 * - 찾는 학번이 없을 시 검색하지 못했다는 메세지를 출력해 주세요.
		 */
		
		System.out.println("성적을 수정할 학생의 학번을 입력하세요.");
		System.out.print("> ");
		String stuNum = sc.next();
		
		boolean flag = false;
		for (Student stu : students) {
			if (stuNum.equals(stu.getStuId())) {
				System.out.println(stu.getName() + "님의 성적 정보를 수정합니다.");
				
				while (true) {
					
					try {
						System.out.print("수정할 국어점수: ");
						stu.setKor(sc.nextInt());
						
						System.out.print("수정할 영어점수: ");
						stu.setEng(sc.nextInt());
						
						System.out.print("수정할 수학점수: ");
						stu.setMath(sc.nextInt());
						break; // while true break;
						
					} catch (Exception e) {
						System.out.println("정수로만 입력하세요.");
						sc.nextLine();
					}
					
				}
				stu.calcTotAvgGrade();
				System.out.println("성적 수정이 정상 처리 되었습니다.");
				flag = true;
				break; // 학생 검색하는 for문 break
				
			}
		}
		
		if (!flag) {
			System.out.println("입력한 학번과 일치하는 학생 정보가 존재하지 않습니다.");
		}
	}
	
	// 5. 학생 정보를 삭제하는 메서드
	public void deletePoint(List<Student> students) {
		/*
		 * - 학번을 입력받아 해당 학번과 일치하는
		 *   학생 객체를 리스트에서 찾아내어 그 학생의 모든 정보를 삭제
		 *   (리스트에서 해당 객체의 주소값 없애기)
		 *   학생 정보를 삭제할 때 "XXX님의 정보를 삭제합니다.
		 *   [Y / N]" 를 출력 후 한 번 더 삭제 여부를 확인
		 * - 학생이 없다면 없다고 출력
		 */
		
		System.out.println("정보를 삭제할 학생의 학번을 입력하세요.");
		System.out.print("> ");
		String stuNum = sc.next();
		
		boolean flag = false;
		for (Student stu : students) {
			if (stuNum.equals(stu.getStuId())) {
				System.out.println(stu.getName() + "님의 정보를 삭제하시겠습니까? [Y / N]");
				System.out.print("> ");
				String answer = sc.next();
				
				if (answer.toLowerCase().equals("y") || answer.equals("ㅛ")) {
					students.remove(stu);
					System.out.println("삭제가 정상 처리 되었습니다.");
				} else if (answer.toLowerCase().equals("n") || answer.equals("ㅜ")) {
					return;
					
				} else {
					System.out.println("제대로 입력해주세요.");
					sc.nextLine();
				}
				flag = true;
				break;
			}
		}
		
		if (!flag) {
			System.out.println("입력한 학번과 일치하는 학생 정보가 존재하지 않습니다.");
		}
	}
	
	
	public void close() {
		sc.close();
	}

}
