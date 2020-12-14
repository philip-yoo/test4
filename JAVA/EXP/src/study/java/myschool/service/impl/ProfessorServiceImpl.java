package study.java.myschool.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.java.myschool.model.Professor;
import study.java.myschool.service.ProfessorService;

public class ProfessorServiceImpl implements ProfessorService {

	Logger logger;

	/** MyBatis의 Mapper를 호출하기 위한 SqlSession 객체 */
	SqlSession sqlSession;

	/** 생성자.SqlSession을 전달받는다. */
	public ProfessorServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	/** 학과 저장하기 -> 저장 후 저장된 결과를 조회하여 리턴한다. */

	@Override
	public void addProfessor(Professor professor) throws Exception {
		try {
			int result = sqlSession.insert("ProfessorMapper.add_professor", professor);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void editProfessor(Professor professor) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProfessor(Professor professor) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Professor getProfessorItem(Professor professor) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Professor> getProfessorList(Professor professor) throws Exception {
		List<Professor> result = null;
		
		try {
			result = sqlSession.selectList("ProfessorMapper.get_professor_list", professor);
			if (result == null) {
				throw new NullPointerException();
				}
		} catch (NullPointerException e) {
			throw new Exception ("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				logger.error(e.getLocalizedMessage());
				throw new Exception ("데이터 조회에 실패했습니다.");
			}
		return result;
	}

}
