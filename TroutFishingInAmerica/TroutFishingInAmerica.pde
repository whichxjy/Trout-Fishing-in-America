FlowFieldSystem flowFieldSystem;

void setup() {
    fullScreen();
    /****************************************
     *     Initialize Flow Field System     *
     ****************************************/
    ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
    for (int i = 0; i < 200; i++) {
        PVector position = new PVector(random(width), random(height));
        PVector velocity = new PVector(0, 0);
        float size = 30;
        float maxForce = random(15, 30);
        float maxSpeed = random(15, 30);
        vehicles.add(new Vehicle(position, velocity, size, maxForce, maxSpeed));
    }
    int resolution = 20;
    flowFieldSystem = new FlowFieldSystem(vehicles, resolution);
}

void draw() {
    flowFieldSystem.run();
}
