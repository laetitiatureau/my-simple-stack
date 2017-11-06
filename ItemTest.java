import org.junit.Test;
import static org.junit.Assert.*;

/**
 * Test Unitaire de la classe Item
 * Test unitaire à terminer #2
 */
public class ItemTest {
    Item item = new Item(4);

    @Test
    public void getItem() throws Exception {
        assertThat(item, item.getItem());
    }

    @Test
    public void getValue() throws Exception {
        assertThat(4, item.getValue());
    }

    @Test
    public void setItem() throws Exception {
        Item it = new Item(5);
        assertThat(it, sameInstance(item.setItem(it)));
        assertThat(it.getItem(), item.getItem());
        assertThat(it.getValue(), item.getValue());
    }
    //tester les erreurs TODO
}