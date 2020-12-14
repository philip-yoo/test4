package study.java.myschool.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import study.java.myschool.model.Student;
import study.java.myschool.service.StudentService;

public class StudentServiceImpl implements StudentService{
	
	/** MyBatis의 Mapper를 호출하기 위한 SqlSession 객체 */
	// --> import org.apache.ibatis.session.SqlSession;
	private SqlSession session;
	
	/** 생성자. SqlSession을 전달받는다. */
	public StudentServiceImpl(SqlSession session) {
		this.session = session;
	}
	
	/** 학생 저장하기 -> 저장 후 저장된 결과를 조회하여 리턴한다.*/
	// -> import study.java.myschool.model.Student;
	@Override
	public Student addStudent(Student params) throws NullPointerException, Exception {
		int row_count = session.insert("StudentMapper.add_student", params);
		
		// 저장된 데이터의 행 수가 없을 경우 강제로 예외를 발생시킨다.
		if (row_count == 0) {
			throw new NullPointerException();
		}
		return session.selectOne("StudentMapper.get_student_item", params);
	}
	
	
	/** 학생 수정하기 -> 수정된 결과를 조회하여 리턴한다. */
	@Override
	public Student editStudent(Student params) throws NullPointerException, Exception {
		int row_count = session.update("StudentMapper.edit_student", params);
		
		// 수정된 데이터의 행 수가 없을 경우 강제로 예외를 발생시킨다.
		if (row_count == 0) {
			throw new NullPointerException();
		}
		return session.selectOne("StudentMapper.get_student_item", params);
	}
	
	/** 학생 삭제하기 */
	@Override
	public void deleteStudent(Student params) throws NullPointerException, Exception {
		
		// 학생 데이터 삭제
		int row_count = session.delete("StudentMapper.remove_student", params);
		
		// 최종적으로 삭제된 행이 없을 경우 강제로 예외를 발생시킨다.
		if (row_count == 0) {
			throw new NullPointerException();
		} 
		
	}

	/** 학생 데이터 조회하기 (단일행) */
	@Override
	public Student getStudentItem(Student params) throws NullPointerException, Exception {
		Student item = session.selectOne("StudentMapper.get_student_item", params);
		
		if (item == null) {
			throw new NullPointerException();
		}
		return item;
	}

	/** 학생 데이터 조회 (다중행) */
	@Override
	public List<Student> getStudentList() throws NullPointerException, Exception {
		List<Student> list = session.selectList(
				"StudentMapper.get_student_list", null);
		
		if (list == null) {
			throw new NullPointerException();
		}
		
		return list;
	}

}
