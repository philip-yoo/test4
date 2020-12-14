package study.java.dao;

import java.util.List;
import study.java.model.Grade;

public interface GradeDao {
	/**
	 * 데이터 파일을 읽어들이 후 , 파일안에 저장된 데이터를
	 * JavaBeans 객체로 변환하여 List에 담아 리턴한다.
	 * @return Grade형의 객체가 담긴 컬렉션
	 */
	public List<Grade> getGradeList();

}
