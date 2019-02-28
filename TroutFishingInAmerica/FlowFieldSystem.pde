public class FlowFieldSystem {
    private FlowField field;
    private ArrayList<Vehicle> vehicles;
    private Catcher catcher;
    private Timer timer;
    private int resolution;
    
    public FlowFieldSystem(ArrayList<Vehicle> vehicles, int resolution) {
        this.vehicles = vehicles;
        this.catcher = new Catcher();
        this.resolution = resolution;
        field = new PerlinNoiseField(resolution);
        timer = new Timer(15000);
        timer.start();
    }

    public void run() {
        update();
        display();
    }

    private void update() {
        if (keyPressed) {
            selectFlowField();
        }

        // If timer is finished, regenerate flow field and restart timer
        if (timer.isFinished()) {
            field.generate();
            timer.start();
        }

        catcher.update();

        for (Vehicle v : vehicles) {
            v.follow(field);
            if (catcher.capture(v)) {
                v.caught();
            } else {
                v.escape();
            }
            field.checkBorders(v);
            v.update();
        }
    }

    private void selectFlowField() {
        if (key == '1') {
            field = new PerlinNoiseField(resolution);
        } else if (key == '2') {
            field = new RadialRepulsionField(resolution);
        } else if (key == '3') {
            field = new CircleField(resolution);
        } else if (key == '4') {
            field = new SidewaysField(resolution);
        }
    }
    
    private void display() {
        background(255);
        field.display();
        catcher.display();
        for (Vehicle v : vehicles) {
            v.display();
        }
    }

}
