public class Truck extends Car {
	public Truck(int speed) { super(speed); }	
	public void speedUp() {
		int speed = this.getSpeed();
		speed += 5;
		this.setSpeed(speed); }}