public abstract class Mover {
    protected PVector position;
    protected PVector velocity;

    public Mover(PVector position) {
        this.position = position;

        PVector dir = new PVector(random(-10, 10), random(-10, 10));
        dir.normalize();
        dir.mult(1.0);
        this.velocity = dir;
        //this(position, new PVector(randomGaussian() * 0.5, randomGaussian() * 0.5));
    }

    public Mover(PVector position, PVector velocity) {
        this.position = position;
        this.velocity = velocity;
    }

    public abstract void display();
}

