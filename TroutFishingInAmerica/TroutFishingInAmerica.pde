CollisionSystem collisionSystem;
FlowFieldSystem flowFieldSystem;

void setup() {
    fullScreen();
    /***************************************
     *     Initialize Collision System     *
     ***************************************/
    ArrayList<HardSphere> hardSpheres = new ArrayList<HardSphere>();
    for (int i = 0; i < 10; i++) {
        PVector position = new PVector(random(30, width - 30), random(30, height - 30));
        PVector direction = (new PVector(randomGaussian(), randomGaussian())).normalize();
        PVector velocity = PVector.mult(direction, randomGaussian() * 1.5);
        float radius = 20;
        float mass = 50;
        hardSpheres.add(new HardSphere(position, velocity, radius, mass));
    }
    int limit = 99999;
    collisionSystem = new CollisionSystem(hardSpheres, limit);

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
    // collisionSystem.run();
    flowFieldSystem.run();
}
