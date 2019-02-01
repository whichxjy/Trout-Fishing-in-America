CollisionSystem collisionSystem;

void setup() {
    fullScreen();

    ArrayList<HardSphere> hardSpheres = new ArrayList<HardSphere>();
    for (int i = 0; i < 10; i++) {
        PVector position = new PVector(random(30, width - 30), random(30, height - 30));
        PVector direction = (new PVector(randomGaussian(), randomGaussian())).normalize();
        PVector velocity = PVector.mult(direction, randomGaussian() * 1.5);
        hardSpheres.add(new Particle(position, velocity, 20, 50));
    } 
    collisionSystem = new CollisionSystem(hardSpheres, 99999);
}

void draw() {
    collisionSystem.run();
}
