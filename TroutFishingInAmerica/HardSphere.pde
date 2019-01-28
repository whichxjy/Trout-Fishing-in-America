public abstract class HardSphere extends Mover {  
    protected float radius;
    protected float mass;
    protected int count;  // number of collisions so far

    private static final float INFINITY = Float.POSITIVE_INFINITY;

    public HardSphere (PVector position, float radius, float mass) {
        super(position);
        this.radius = radius;
        this.mass = mass;
    }

    public void move() {
        position.add(velocity);
    }

    public float timeToHit(HardSphere that) {
        if (this == that) {
            return INFINITY;
        }

        PVector dr = PVector.sub(this.position, that.position); // Delta position
        PVector dv = PVector.sub(this.velocity, that.velocity); // Delta velocity
        float dvdr = PVector.dot(dv, dr);

        if (dvdr >= 0) {
            return INFINITY;
        }

        float dvdv = PVector.dot(dv, dv);

        if (dvdv == 0) {
            return INFINITY;
        }

        float drdr = PVector.dot(dr, dr);
        float sigma = this.radius + that.radius;
        float d = (dvdr * dvdr) - dvdv * (drdr - sigma * sigma);

        if (d < 0) {
            return INFINITY;
        }

        return -(dvdr + sqrt(d)) / dvdv;
    }

    public float timeToHitHorizontalWall() {
        if (velocity.y > 0) {
            return (height - position.y - radius) / velocity.y;
        } else if (velocity.y < 0) {
            return (radius - position.y) / velocity.y;
        } else {
            return INFINITY;
        }
    }

    public float timeToHitVerticalWall() {
        if (velocity.x > 0) {
            return (width - position.x - radius) / velocity.x;
        } else if (velocity.x < 0) {
            return (radius - position.x) / velocity.x;
        } else {
            return INFINITY;
        }
    }

    public void bounceOff(HardSphere that) {
        PVector dr = PVector.sub(this.position, that.position); // Delta position
        PVector dv = PVector.sub(this.velocity, that.velocity); // Delta velocity
        float dvdr = PVector.dot(dv, dr);
        float dist = this.radius + that.radius;

        // magnitude of normal force
        float magnitude = (2 * this.mass * that.mass * dvdr) / ((this.mass + that.mass) * dist);

        // normal force
        PVector normalForce = dr.mult(magnitude).div(dist);

        // update velocities according to normal force
        this.velocity.add(PVector.div(normalForce, this.mass));
        that.velocity.sub(PVector.div(normalForce, that.mass));

        // update collision counts
        this.count++;
        that.count++;
    }

    public void bounceOffHorizontalWall() {
        velocity.y = -velocity.y;
        count++;
    }

    public void bounceOffVerticalWall() {
        velocity.x = -velocity.x;
        count++;
    }

    public int getCount() {
        return this.count;
    }
}
