package kr.co.jsp.board.commons;

public class PageVO {

	private int page; 
	private int countPerPage;
	
	public PageVO() {
		page = 1;
		countPerPage = 10;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if (page <= 0) this.page = 1;
		this.page = page;
	}
	
	public int getCountPerPage() {
		return countPerPage;
	}
	
	public void setCountPerPage(int countPerPage) {
		if (countPerPage <= 10 || countPerPage > 30)
			this.countPerPage = 10;
		this.countPerPage = countPerPage;
	}
	
}
