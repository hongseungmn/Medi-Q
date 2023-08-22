package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import com.kosmo.springapp.qnabbs.service.DaoService;
import com.kosmo.springapp.qnabbs.service.ListPagingData;
import com.kosmo.springapp.qnabbs.service.PagingUtil;



@Service("board")
public class BoardServiceImpl implements DaoService {

	@Autowired
	private BoardMapper mapper;
	
	/*
	  첫번째 인자 Map에는 검색 안하면  빈 맵이다
	                   검색시에는 검색어와 검색 컬럼명이 저장됨
	  두번째 인자는 컨텍스트 패스를 얻기 위함(페이징시 절대경로 지정)
	  세번째 인자는 현재 페이지 번호
	 */
	//속성파일(paging.properties)에서 페이지 사이즈 수/블록 페이지 수 읽어오기
	@Value("${"+PagingUtil.PAGE_SIZE+"}")
	private int pageSize;
	@Value("${"+PagingUtil.BLOCK_PAGE+"}")
	private int blockPage;
	
	
	@Override
	public ListPagingData selectList(Map map, HttpServletRequest req, int nowPage,Map likemap) {
		//[페이징 로직 시작]
		//1.총 레코드 수 : 테이블에서 조회
		//  페이지 사이즈 수/블록 페이지 수: 속성파일(paging.properties-PlaceHolderConfig.java에 위치 설정해주어야 한다)에서 읽기
		//  현재 페이지 번호:인자로 받는다
		// 위 4개의 값을 맵에 설정
		int totalCount=mapper.count(map);
		map.put(PagingUtil.TOTAL_RECORD_COUNT, totalCount);
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.NOWPAGE, nowPage);
		//System.out.println("listmap:"+map);
		//시작/끝 행번호 및 총 페이지 수 설정:PagingUtil.setMapForPaging()호출
		PagingUtil.setMapForPaging(map);		
		//글 전체 목록 얻기
		List records= mapper.selectList(map);
		//System.out.println("records체크:"+records);
		//추천수TOP3 목록 얻기
		List likes=mapper.likeList(map);
		//System.out.println("likes체크:"+likes);
		//페이징 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(totalCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/board/List.do?");
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData listPagingData = ListPagingData.builder()
													.records(records)//글 전체 목록 설정
													.likes(likes)//추천수 목록 설정
													.map(map)//페이징 관련 데이타 설정
													.pagingString(pagingString)//페이징 문자열 설정
													.build();
		return listPagingData;
	}////////////////////
	
	
	@Override
	public Map selectOne(Map map) {
		return mapper.selectOne(map);
	}///////////////////

	@Override
	public int insert(Map map) {
		
		int affected=0;
		
		try {
			affected=mapper.insert(map);
		}
		catch(Exception e) {
			e.printStackTrace();			
		}
		return affected;
	}//////////////////////

	@Override
	public int update(Map map) {
		int affected=0;
		try {
			affected=mapper.update(map);
		}
		catch(Exception e) {
			e.printStackTrace();			
		}
		return affected;
	}///////////////////////
	//트랜잭션 처리 관련 빈 주입 받기
	@Autowired
	private TransactionTemplate template;
	@Autowired
	private AnswerMapper answermapper;
	
	@Override
	public int delete(Map map) {
		
		int affected=0;
		try {
			//람다함수
			affected=template.execute(status -> {
				//답변삭제 되면1 안되면0
				int boarddelete = answermapper.boarddelete(map); //글번호로 게시물의 답변글들 삭제(글작성시 버튼이 없어서 1개만 삭제됨)
	            mapper.delete(map); //답변이 다 삭제된, 게시물 삭제
	            return boarddelete; //0,1 (답변글의 갯수 반환)
			});
		}
		catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		System.out.println("affected:"+affected); //boarddelete의 반환값이 저장
		return 	affected; //boarddelete의 반환값이 저장
	}///////////////

}
