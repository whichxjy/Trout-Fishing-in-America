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
        } else {
            return false;
        }
    }

    public void update() {
        position.set(mouseX, mouseY);
        if (mousePressed) {
            radius = constrain(radius + 5, 0, height / 6);
        } else {
            radius = 0;
        }
    }

    public void display() {
        noFill();
        stroke(198, 171, 87);
        strokeWeight(5);
        pushMatrix();
        translate(position.x, position.y);
        float r;
        for (r = radius; r > 0; r -= 30) {
            circle(0, 0, 2 * r);
        }
        for (float i = 0; i < 24; i++) {
            rotate(PI / 12);
            line(0, 0, 0, radius);
        }
        popMatrix();
    }
}
