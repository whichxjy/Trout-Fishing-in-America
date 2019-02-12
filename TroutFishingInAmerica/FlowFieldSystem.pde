public class FlowFieldSystem {
    private FlowField field;
    private ArrayList<Vehicle> vehicles;
    private Timer timer;
    
    public FlowFieldSystem(ArrayList<Vehicle> vehicles, int resolution) {
        this.vehicles = vehicles;
        field = new PerlinFlowField(resolution);
        timer = new Timer(7000);
        timer.start();
    }

    public void run() {
        if (timer.isFinished()) {
            field.generate();
            timer.start();
        }

        for (Vehicle v : vehicles) {
            v.follow(field);
            v.run();
        }
        
        display();
    }

    public void display() {
        background(255);
        field.display();
        for (Vehicle v : vehicles) {
            v.display();
        }
    }

}
