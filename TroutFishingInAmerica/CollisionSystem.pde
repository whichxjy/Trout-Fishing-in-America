public class CollisionSystem {
    private MinPQ<Event> pq;                    // the priority queue
    private Timer timer;                        // simulation clock time
    private ArrayList<HardSphere> hardSpheres;  // array list of hardSpheres

    private Event nextEvent;                    // next event
    private int limit;                          // limit time

    public CollisionSystem (ArrayList<HardSphere> hardSpheres) {
        this.pq = new MinPQ<Event>();
        this.timer = new Timer();
        this.hardSpheres = hardSpheres;

        for (HardSphere h : hardSpheres) {
            predict(h);
        }
    }

    public void run() {
        // if the event wasn't initialized or was removed, fetch next event from the priority queue
        while (nextEvent == null && !pq.isEmpty()) {
            nextEvent = pq.delMin();
            if (nextEvent.isValid()) {
                nextEvent.highlight();
            } else {
                nextEvent = null;
            }
        }

        // update position
        for (HardSphere h : hardSpheres) {
            h.move();
        }

        // if event occurs, update velocity
        if (nextEvent != null && timer.getCurrentTime() == nextEvent.getTime()) {
            // event occurs 
            nextEvent.occur();
            // remove highlight
            nextEvent.removeHighlight();
            // remove event
            nextEvent = null;
        }

        // display all hardSpheres
        for (HardSphere h : hardSpheres) {
            h.display();
        }
    }

    private void predict(HardSphere hardSphere) {
        if (hardSphere == null) {
            return;
        }

        int currTime = timer.getCurrentTime();

        // particle-particle collisions
        for (HardSphere h : hardSpheres) {
            int dt = hardSphere.timeToHit(h);
            if (dt <= limit) {
                pq.insert(new Event(currTime + dt, hardSphere, h));
            }
        }

        // particle-vertical_wall collision
        int dtX = hardSphere.timeToHitVerticalWall();
        if (dtX <= limit) {
            pq.insert(new Event(currTime + dtX, hardSphere, null));
        }

        // particle-horizontal_wall collision
        int dtY = hardSphere.timeToHitHorizontalWall();
        if (dtY <= limit) {
            pq.insert(new Event(currTime + dtY, null, hardSphere));
        }
    }

}
