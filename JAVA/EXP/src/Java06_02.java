import study.java.member.dao.MemberDao;
class MemberDaoImpl implements MemberDao {
	@Override
	public void doJoin()
	{System.out.println("가입이 완료되었습니다.");}
	@Override
	public void doLogin()
	{System.out.println("로그인 되셨습니다.");}
	@Override
	public void doUpdate()
	{System.out.println("회원 정보가 수정되었습니다.");}
	@Override
	public void getInfo()
	{System.out.println("회원 정보를 수정합니다.");}
	@Override
	public void dologout()
	{System.out.println("로그아웃 되셨습니다."); }}

public class Java06_02 {	
	public static void main(String[] args) {
		MemberDao member = new MemberDaoImpl();
		member.doJoin();
		member.doLogin();
		member.doUpdate();
		member.getInfo();
		member.dologout();}}