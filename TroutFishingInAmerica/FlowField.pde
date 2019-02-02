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

    public abstract void generate();
    public abstract void display();
    
}