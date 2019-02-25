public class RadialRepulsionField extends FlowField {
    private PVector centre;

    public RadialRepulsionField(int resolution) {
        super(resolution);
    }

    public void generate() {
        centre = new PVector(random(0.3 * width, 0.7 * width), random(0.3 * height, 0.7 * height));
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                float x = j - centre.x / resolution;
                float y = centre.y / resolution - i;
                float theta = atan2(x, y) + 3 * PI / 2;
                field[i][j] = new PVector(cos(theta), sin(theta));
            }
        }
    }
    public void checkBorders(Vehicle vehicle) {
        PVector position = vehicle.getPosition();
        float r = vehicle.getSize();
        if (position.x < -r || position.x > (width + r) || position.y < -r || position.y > (height + r)) {
            position.set(centre.x + random(-1.5, 1.5) * resolution, centre.y + random(-1.5, 1.5) * resolution);
        }
    }
}
