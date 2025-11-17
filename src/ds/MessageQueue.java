package ds;

public class MessageQueue {
    private String[] arr;
    private int front, rear, capacity;

    public MessageQueue(int size) {
        arr = new String[size];
        capacity = size;
        front = rear = -1;
    }

    public synchronized void enqueue(String msg) {
        if ((rear + 1) % capacity == front) {
            System.out.println("Queue Full!");
            return;
        }
        if (front == -1) front = 0;
        rear = (rear + 1) % capacity;
        arr[rear] = msg;
    }

    public synchronized String dequeue() {
        if (front == -1) return null;

        String msg = arr[front];
        if (front == rear) front = rear = -1;
        else front = (front + 1) % capacity;

        return msg;
    }

    public synchronized boolean isEmpty() {
        return front == -1;
    }
}
