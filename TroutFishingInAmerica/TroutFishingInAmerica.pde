CollisionSystem cs;

void setup() {
    fullScreen();

    ArrayList<HardSphere> hardSpheres = new ArrayList<HardSphere>();
    for (int i = 0; i < 10; i++) {
        hardSpheres.add(new Particle(new PVector(random(30, width - 30), random(30, height - 30)), 40, 50));
    } 
    cs = new CollisionSystem(hardSpheres, 99999);
}

void draw() {
    background(138, 170, 234);
    cs.run();
}
