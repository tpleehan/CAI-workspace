package kr.co.jsp.board.commons;

public class PageCreator {

	private PageVO paging;
	private int aticleTotalCount;
	private int beginPage; 
	private int endPage; 
	private boolean prev; 
	private boolean next; 
	
	private final int displayBtn = 10;
	
	private void calcDataOfPage() {
		
		endPage = (int) (Math.ceil(paging.getPage() / (double) displayBtn) * displayBtn);
		beginPage = (endPage - displayBtn) + 1;

		if (beginPage == 1) {
			prev = false;
			
		} else {
			prev = true;
			
		}
		next = (aticleTotalCount <= (endPage * paging.getCountPerPage())) ? false : true;

		if(!next) {
			endPage = (int) Math.ceil(aticleTotalCount / (double) paging.getCountPerPage());
		}
	}
	
	public PageVO getPaging() {
		return paging;
	}
	
	public void setPaging(PageVO paging) {
		this.paging = paging;
	}
	
	public int getAticleTotalCount() {
		return aticleTotalCount;
	}
	
	public void setAticleTotalCount(int aticleTotalCount) {
		this.aticleTotalCount = aticleTotalCount;
		calcDataOfPage();
	}
	
	public int getBeginPage() {
		return beginPage;
	}
	
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public void setNext(boolean next) {
		this.next = next;
	}
	
}
