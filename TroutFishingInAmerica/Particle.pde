public class Particle extends HardSphere {
   
    public Particle(PVector position, PVector velocity, float radius, float mass) {
        super(position, velocity, radius, mass);
    }

    public void display() {
        noStroke();
        if (highlight) {
            fill(255);
        } else {
            fill(29, 0, 255);
        }
        circle(position.x, position.y, 2 * radius);
    }
}
