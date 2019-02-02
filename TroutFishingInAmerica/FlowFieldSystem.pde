public class FlowFieldSystem {
    private FlowField field;
    private ArrayList<Vehicle> vehicles;
    
    public FlowFieldSystem(ArrayList<Vehicle> vehicles, int resolution) {
        this.vehicles = vehicles;
        field = new PerlinFlowField(resolution);
    }

    public void run() {
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
