package com.spring.dct.util;

public class PageCreator {

	private PageVO paging;
	private int articleTotalCount;
	private int endPage;
	private int beginPage;
	private boolean prev;
	private boolean next;

	private final int buttonNum = 5;

	public PageVO getPaging() {
		return paging;
	}

	public void setPaging(PageVO paging) {
		this.paging = paging;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
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

	public int getArticleTotalCount() {
		return articleTotalCount;
	}

	public int getButtonNum() {
		return buttonNum;
	}

	@Override
	public String toString() {
		return "PageCreator [paging=" + paging + ", articleTotalCount=" + articleTotalCount + ", endPage=" + endPage
				+ ", beginPage=" + beginPage + ", prev=" + prev + ", next=" + next + ", buttonNum=" + buttonNum + "]";
	}

	private void calcDataOfPage() {

		endPage = (int) (Math.ceil(paging.getPageNum() / (double) buttonNum) * buttonNum);

		beginPage = (endPage - buttonNum) + 1;

		prev = (beginPage == 1) ? false : true;

		next = articleTotalCount <= (endPage * paging.getCountPerPage()) ? false : true;

		if (!next) {
			endPage = (int) Math.ceil(articleTotalCount / (double) paging.getCountPerPage());
		}

	}

	// 컨트롤러가 총 게시물의 개수를 PageCreator에게 전달한 직후에
	// 바로 페이징 버튼 알고리즘이 돌아갈 수 있도록 setter를 커스텀.
	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}

}
