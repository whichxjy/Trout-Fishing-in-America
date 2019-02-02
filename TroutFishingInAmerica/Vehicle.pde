public class Vehicle extends Mover {
    private PVector acceleration;
    private float r;                // size
    private float maxForce;         // Maximum steering force
    private float maxSpeed;         // Maximum speed

    public Vehicle(PVector position, PVector velocity, float maxForce, float maxSpeed) {
        super(position, velocity);
        this.maxForce = maxForce;
        this.maxSpeed = maxSpeed;
    }

    public void follow(FlowField flowField) {
        PVector desired = flowField.lookup(position);
        desired.mult(maxSpeed);
        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxForce);
        applyForce(steer);
    }

    public void run() {
        update();
        checkBorders();
        display();
    }

    public void applyForce(PVector force) {
        acceleration.add(force);
    }

    public void update() {
        velocity.add(acceleration);
        velocity.limit(maxSpeed);
        position.add(velocity);
        acceleration.mult(0);
    }

    public void display() {
        // direction of velocity
        float theta = velocity.heading();
        fill(0);
        noStroke();
        pushMatrix();
        translate(position.x, position.y);
        rotate(theta);
        beginShape(TRIANGLES);
        vertex(r / 2, 0);
        vertex(-r / 2, r / 2);
        vertex(-r / 2, -r / 2);
        endShape();
        popMatrix();
    }

    public void checkBorders() {
        if (position.x < -r) {
            position.x = width + r;
        } else if (position.x > width + r) {
            position.x = -r;
        } else if (position.y < -r) {
            position.y = height + r;
        } else if (position.y > height + r) {
            position.y = -r;
        }
    }

}
