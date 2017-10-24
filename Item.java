public class Item {

    //valeur de l'Item
    protected int value;

    /**
     * Constructeur de Item
     * @param value valeur de l'Item
     */
    public Item(int value) {
        this.value = value;
    }

    /**
     * Getter de l'Item
     * @return l'Item
     */
    public Item getItem() {
        return this;
    }

    /**
     * Getter de la value de l'Item
     * @return la valeur de l'Item
     */
    public int getValue() {
        return this.value;
    }

    /**
     * Setter de l'Item
     * @param item l'Item à modifier
     */
    public void setItem(Item item) {
        this.value = item.value;
    }
}