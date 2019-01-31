public abstract class Mover {
    protected PVector position;
    protected PVector velocity;

    public Mover(PVector position) {
        this.position = position;
        
        // direction
        PVector dir = new PVector(randomGaussian(), randomGaussian());
        dir.normalize();
        // this.velocity = PVector.mult(dir, 1.0);
        this.velocity = PVector.mult(dir, randomGaussian() * 1.5);
    }

    public Mover(PVector position, PVector velocity) {
        this.position = position;
        this.velocity = velocity;
    }

    public abstract void display();
}
