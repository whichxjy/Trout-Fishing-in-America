public abstract class Mover {
    protected PVector position;
    protected PVector velocity;
    
    public Mover(PVector position, PVector velocity) {
        this.position = position;
        this.velocity = velocity;
    }

    public abstract void display();
}
