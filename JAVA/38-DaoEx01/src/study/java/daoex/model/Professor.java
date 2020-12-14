package study.java.daoex.model;

/** professor 테이블 구조에 맞춘 Java Beans 생성 */
public class Professor {
	
	private int profNo;
	private String name;
	private String userId;
	private String position;
	private int sal;
	private String hiredate;
	private int comm;
	private int deptno;
	
	public Professor(int profNo, String name, String userId, String position, int sal, String hiredate, int comm,
			int deptno) {
		super();
		this.profNo = profNo;
		this.name = name;
		this.userId = userId;
		this.position = position;
		this.sal = sal;
		this.hiredate = hiredate;
		this.comm = comm;
		this.deptno = deptno;
	}

	public int getProfNo() {
		return profNo;
	}

	public void setProfNo(int profNo) {
		this.profNo = profNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		this.comm = comm;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	@Override
	public String toString() {
		return "Professor [profNo=" + profNo + ", name=" + name + ", userId=" + userId + ", position=" + position
				+ ", sal=" + sal + ", hiredate=" + hiredate + ", comm=" + comm + ", deptno=" + deptno + "]";
	}

	
}