public class Timer {
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
