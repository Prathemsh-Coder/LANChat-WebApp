package ds;

public class ChatHistoryArray {
    private String[] arr;
    private int size = 0;

    public ChatHistoryArray() {
        arr = new String[10];
    }

    public synchronized void add(String msg) {
        if (size == arr.length) {
            String[] newArr = new String[arr.length * 2];
            for (int i = 0; i < arr.length; i++)
                newArr[i] = arr[i];
            arr = newArr;
        }
        arr[size++] = msg;
    }

    public synchronized String[] getAll() {
        String[] out = new String[size];
        for (int i = 0; i < size; i++)
            out[i] = arr[i];
        return out;
    }
}
