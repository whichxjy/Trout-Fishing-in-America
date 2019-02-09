public class FlowFieldSystem {
    private FlowField field;
    private ArrayList<Vehicle> vehicles;
    private Timer timer;
    
    public FlowFieldSystem(ArrayList<Vehicle> vehicles, int resolution) {
        this.vehicles = vehicles;
        field = new PerlinFlowField(resolution);
        timer = new Timer(7000);
        timer.start();
    }

    public void run() {
        if (timer.isFinished()) {
            field.generate();
            timer.start();
        }

        for (Vehicle v : vehicles) {
            v.follow(field);
            v.run();
        }
        
        display();
    }

    public void display() {
        background(255);
        field.display();
        for (Vehicle v : vehicles) {
            v.display();
        }
    }

    private class Timer {
        private int savedTime;  // When Timer started
        private int totalTime;  // How long Timer should last

        Timer(int totalTime) {
            setTotalTime(totalTime);
        }

        public void start() {
            savedTime = millis();
        }

        public boolean isFinished() {
            int passedTime = millis() - savedTime;
            return passedTime > totalTime;
        }

        public void setTotalTime(int totalTime) {
            this.totalTime = totalTime;
        }

    }
}
