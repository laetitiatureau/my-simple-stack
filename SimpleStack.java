import java.util.ArrayList;
import java.util.EmptyStackException;

public interface SimpleStack {

    //la pile
    ArrayList<Item> stack = new ArrayList<Item>();

    /**
     * Tests if this stack is empty
     */
    public boolean isEmpty() {
        return stack.isEmpty();
    }

    /**
     * Returns the number of items in this stack
     */
    public int getSize() {
        return stack.size();
    }

    /**
     * Pushes an item onto the top of this stack
     * null item is allowed
     */
    public void push(Item item) {
        stack.add(stack.size()-1, item);
    }

    /**
     * Looks at the object at the top of this stack without removing it from the stack
     * @throws EmptyStackException if this stack is empty
     */
    public Item peek() throws EmptyStackException {
        if(stack.isEmpty()) {
            throw new EmptyStackException();
        }
        return stack.get(stack.size()-1);
    }

    /**
     * Removes the object at the top of this stack and returns that object as the value of this function
     * @throws EmptyStackException if this stack is empty
     */
    public Item pop() throws EmptyStackException {
        if(stack.isEmpty()) {
            throw new EmptyStackException();
        }
        Item removed = stack.remove(stack.size()-1);
        return removed;
    }
}