CollisionSystem collisionSystem;

void setup() {
    fullScreen();

    ArrayList<HardSphere> hardSpheres = new ArrayList<HardSphere>();
    for (int i = 0; i < 15; i++) {
        hardSpheres.add(new Particle(new PVector(random(30, width - 30), random(30, height - 30)), 20, 50));
    } 
    collisionSystem = new CollisionSystem(hardSpheres, 99999);
}

void draw() {
    background(138, 170, 234);
    collisionSystem.run();
}
