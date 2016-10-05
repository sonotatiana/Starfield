Particle [] group;
void setup()
{	
	size(600,600);
	group = new Particle[1000];
	for(int i = 0; i<group.length; i++) {
		if(i% 500== 0 ){
			group[i] = new OddballParticle();
		}
		else if (i% 50 == 0){
			group[i] = new JumboParticle(); 
		}
		else {
			group[i] = new NormalParticle();
		}
		//group[i]= new NormalParticle();
	}
}
void draw()
{
	background(0);
	for(int i = 0; i<group.length; i++) {
		group[i].move();
		group[i].show();
	}
}
class NormalParticle implements Particle
{
	double myX, myY, mySpeed, myAngle;
	int myColor;

	NormalParticle(){
		myX = Math.random()*600 + 10;
		myY = Math.random()*600 + 10;
		mySpeed = 5;
		myAngle = Math.random()*2*Math.PI;//360;
		myColor = color((int)(Math.random()*250), (int)(Math.random()*250), (int)(Math.random()*250));
	}

	void move(){
		myX = myX + mySpeed*cos((float)(myAngle));
		myY = myY + mySpeed*sin((float)(myAngle));
		myAngle+=0.02;
	}

	void show(){
		//background(0);
		noStroke();
		fill(myColor);
		ellipse((float)myX,(float)myY,4,4);
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle //uses an interface
{
	double myX, myY, mySpeed, myAngle;
	int myColor;

	OddballParticle(){
		myX = Math.random()*600 + 10;
		myY = Math.random()*600 + 10;
		mySpeed = 5;
		myAngle = Math.random()*2*Math.PI;//360;
		myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
	}

	public void show() {
		fill(myColor);
		rect((float)myX,(float)myY, 10,10);
	}
	public void move() {
		myX = myX + mySpeed*cos((float)(myAngle));
		myY = myY + mySpeed*sin((float)(myAngle));
		myAngle-=.05;

	}
}
class JumboParticle extends NormalParticle 	//uses an inheritance
{
	void show() {
		fill(myColor);
		ellipse((float)myX,(float)myY,20,20);

	}
}

