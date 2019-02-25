public class FlowFieldSystem {
    private FlowField field;
    private ArrayList<Vehicle> vehicles;
    private Timer timer;
    private int resolution;
    
    public FlowFieldSystem(ArrayList<Vehicle> vehicles, int resolution) {
        this.vehicles = vehicles;
        this.resolution = resolution;
        field = new PerlinNoiseField(resolution);
        timer = new Timer(10000);
        timer.start();
    }

    public void run() {
        if (keyPressed) {
            selectFlowField();
        }

        if (timer.isFinished()) {
            field.generate();
            timer.start();
        }

        for (Vehicle v : vehicles) {
            v.follow(field);
            v.run();
            field.checkBorders(v);
        }

        display();
    }

    private void selectFlowField() {
        if (key == '1') {
            field = new PerlinNoiseField(resolution);
        }
        else if (key == '2') {
            field = new RadialRepulsionField(resolution);
        }
    }
    
    private void display() {
        background(255);
        field.display();
        for (Vehicle v : vehicles) {
            v.display();
        }
    }

}
