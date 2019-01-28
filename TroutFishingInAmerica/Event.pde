public class Event implements Comparable<Event> {
    private final int time;             // time that event is scheduled to occur
    private final HardSphere a, b;      // hard spheres involved in event, possibly null
    private final int countA, countB;   // collision counts at event creation

    public Event (int time, HardSphere a, HardSphere b) {
        this.time = time;
        this.a = a;
        this.b = b;
        this.countA = (a != null) ? a.getCount() : -1;
        this.countB = (b != null) ? b.getCount() : -1;
    }

    public int compareTo(Event that) {
        return Integer.compare(this.time, that.time);
    }

    public boolean isValid() {
        if (a != null && a.getCount() != countA) {
            return false;
        } else if (b != null && b.getCount() != countB) {
            return false;
        } else {
            return true;
        }
    }

}
