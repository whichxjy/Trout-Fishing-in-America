public abstract class Mover {
    protected PVector position;
    protected PVector velocity;

    public Mover (PVector position) {
        this.position = position;
        this.velocity = new PVector(randomGaussian() * 0.3, randomGaussian() * 0.3);
    }

    public abstract void run();
    
    public abstract void update();
    public abstract void display();
}

