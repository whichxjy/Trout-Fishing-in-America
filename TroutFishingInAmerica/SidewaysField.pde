public class SidewaysField extends FlowField {
    private float alpha;    // direction of flow field
    private PVector end;

    public SidewaysField(int resolution) {
        super(resolution);
    }

    public void generate() {
        alpha = random(-PI, PI);
        end = new PVector(random(0.2 * width, 0.8 * width), random(0.2 * height, 0.8 * height));

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                PVector dir = new PVector(i - end.y / resolution, j - end.x / resolution).rotate(alpha);
                float theta = atan2(dir.x, dir.y);

                if (theta > 3 * QUARTER_PI || theta < -3 * QUARTER_PI) {
                    field[i][j] = new PVector(1.5 * cos(alpha), 1.5 * sin(alpha));
                } else {
                    field[i][j] = new PVector(0.3 * cos(alpha), 0.3 * sin(alpha));
                }
            }
        }
    }

    public void checkBorders(Vehicle vehicle) {
        PVector position = vehicle.getPosition();
        float r = vehicle.getSize();
        if (position.x < -r) {
            position.x = width + r;
        } else if (position.x > width + r) {
            position.x = -r;
        } else if (position.y < -r) {
            position.y = height + r;
        } else if (position.y > height + r) {
            position.y = -r;
        }
    }
}
