public class PerlinFlowField extends FlowField {

    public PerlinFlowField(int resolution) {
        super(resolution);
    }

    public void generate() {
        float noiseScale = 0.2;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                float theta = map(noise(i * noiseScale, j * noiseScale), 0, 1, 0, TWO_PI);
                field[i][j] = new PVector(cos(theta), sin(theta));
            }
        }
    }

    public void updateResolution(int resolution) {
        setResolution(resolution);
        generate();
    }

    public void display() {
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                drawVector(i, j);
            }
        }
    }

    private void drawVector(int row, int col) {
        stroke(0);
        pushMatrix();
        translate(col * resolution, row * resolution);
        rotate(field[row][col].heading());
        int drawScale = resolution - 1;
        float len = field[row][col].mag() * drawScale;
        line(0, 0, len, 0);
        popMatrix();
    }

}
