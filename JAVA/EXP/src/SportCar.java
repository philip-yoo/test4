public class SportCar extends Car {
	public SportCar(int speed) { super(speed); }
	public void speedUp() { int speed = this.getSpeed();
	speed += 10;
	this.setSpeed(speed);}}