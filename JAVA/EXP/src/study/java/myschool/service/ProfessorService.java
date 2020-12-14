package study.java.myschool.service;

import java.util.List;

import study.java.myschool.model.Professor;
public interface ProfessorService {
	/**
	 * 교수 등록하기
	 * @param professor 저장될 정보를 담고 있는 Beans
	 * @throws Exception - SQL처리에 실패한 경우
	 */
	
	public void addProfessor(Professor professor)
		throws Exception;
	
	/**
	 * 교수 수정하기
	 * @param professor - 수정될 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public void editProfessor(Professor professor) 
			throws Exception;
	/**
	 * 교수 삭제한다.
	 * @param professor - 삭제될 학과의 정보를 담고 있는 Beans
	 * @throws Exception - SQL처리에 실패한 경우

	 */
	public void deleteProfessor(Professor professor)
		throws Exception;
	
	/**
	 * 교수 상세 조회
	 * @param professor - 조회할 교수의 일련번호를  담고 있는 Beans
	 * @return - 조회결과를 담고 있는 Beans
	 * @throws Exception - SQL처리에 실패한 경우
	 */
	public Professor getProfessorItem(Professor professor)
		throws Exception;
	
	/**
	 * 교수 목록을 조회하여 리턴한다.
	 * @return - 조회결과를 담고 있는 컬렉션
	 * @throws Exception - SQL처리에 실패한 경우
	 */
	public List<Professor> getProfessorList(Professor professor)
		throws Exception;
}
