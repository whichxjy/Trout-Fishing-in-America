public class Catcher {
    private PVector position;
    private float radius;
    
    public Catcher() {
        this.position = new PVector(0, 0);
        this.radius = 0;
    }

    public boolean capture(Vehicle vehicle) {
        float distance = PVector.dist(this.position, vehicle.getPosition());
        if (distance < this.radius) {
            return true;
        }
        else {
            return false;
        }
    }

    public void update() {
        position.set(mouseX, mouseY);
        if (mousePressed) {
            radius = constrain(radius + 5, 0, height / 3);
        }
        else {
            radius = 0;
        }
    }

    public void display() {
        fill(100);
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
    }

}
