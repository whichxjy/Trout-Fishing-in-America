public class Vehicle {
    private PVector position;
    private PVector velocity;
    private PVector acceleration;
    private float r;                // Vehicle size
    private float maxForce;         // Maximum steering force
    private float maxSpeed;         // Maximum speed
    private boolean caught;

    public Vehicle(PVector position, PVector velocity, float size, float maxForce, float maxSpeed) {
        this.position = position;
        this.velocity = velocity;
        this.r = size;
        this.acceleration = new PVector(0, 0);
        this.maxForce = maxForce;
        this.maxSpeed = maxSpeed;
        this.caught = false;

    }

    public void follow(FlowField flowField) {
        PVector desired = flowField.lookup(position);
        desired.mult(maxSpeed);
        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxForce);
        applyForce(steer);
    }

    public void applyForce(PVector force) {
        acceleration.add(force);
    }

    public void caught() {
        caught = true;
    }

    public void escape() {
        caught = false;
    }

    public void update() {
        if (caught) {
            // change direction randomly
            velocity.rotate(((int)random(2) * 2 - 1) * PI / 10);
        }
        else {
            velocity.add(acceleration);
            velocity.limit(maxSpeed);
            position.add(velocity);
            acceleration.mult(0);
        }
    }

    public void display() {
        // direction of velocity
        float theta = velocity.heading();
        fill(164, 165, 139);
        stroke(0);
        pushMatrix();
        translate(position.x, position.y);
        rotate(theta);
        beginShape(TRIANGLES);
        vertex(r / 2, 0);
        vertex(-r / 2, r / 3);
        vertex(-r / 2, -r / 3);
        endShape();
        popMatrix();
    }

    public PVector getPosition() {
        return this.position;
    }

    public float getSize() {
        return this.r;
    }

}
