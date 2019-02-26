public class PerlinNoiseField extends FlowField {

    public PerlinNoiseField(int resolution) {
        super(resolution);
    }

    public void generate() {
        noiseSeed((int)random(12345));
        float noiseScale = 0.1;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                float theta = map(noise(i * noiseScale, j * noiseScale), 0, 1, 0, TWO_PI);
                field[i][j] = new PVector(cos(theta), sin(theta));
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
