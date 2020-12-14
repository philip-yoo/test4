class Hello{
	public void say() {
		System.out.println("Hello");
	}
}
class Korean extends Hello{
	public void say() {
		super.say();
		System.out.println("안녕하세요.");
	}
}

public class Foo {
	public static void main(String[] args) {

		Korean k = new Korean();
		k.say();
				
	}

}
