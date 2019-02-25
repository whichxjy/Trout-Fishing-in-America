public abstract class FlowField {
    protected PVector[][] field;
    protected int rows, cols;       // rows and columns
    protected int resolution;       // determine the size of each cell

    public FlowField(int resolution) {
        setResolution(resolution);
        generate();
    }

    public void setResolution(int resolution) {
        this.resolution = resolution; 
        this.rows = height / resolution;
        this.cols = width / resolution;
        this.field = new PVector[rows][cols];
    }

    public PVector lookup(PVector position) {
        int row = int(constrain(position.y / resolution, 0, rows - 1));
        int col = int(constrain(position.x / resolution, 0, cols - 1));
        return field[row][col].copy();
    }

    public void display() {
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                drawVector(i, j);
            }
        }
    }

    private void drawVector(int row, int col) {
        stroke(91, 166, 247);
        pushMatrix();
        translate(col * resolution, row * resolution);
        rotate(field[row][col].heading());
        float drawScale = 0.9 * resolution;
        float len = field[row][col].mag() * drawScale;
        line(0, 0, len, 0);
        line(0, 3, len, 3);
        popMatrix();
    }

    public abstract void generate();
    public abstract void checkBorders(Vehicle vehicle);
    
}
