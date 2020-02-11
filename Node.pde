public class Node <E> { //<>//
  private Node<E> parent;
  private LinkedList<Node <E>> children;
  private E data;

  public Node(E data) {
    this.data = data;
    children = new LinkedList();
    parent = null;
  }

  public Node(E data, Node<E> parent) {
    this.data = data;
    children = new LinkedList();
    this.parent = parent;
  }

  public Node<E> getPar() {
    return parent;
  }

  public Node<E> getCh() {
    return children.get(0);
  }

  public Node<E> getCh(int i) {
    return children.get(i);
  }

  public LinkedList<Node<E>> getChdren() {
    return children;
  }

  public E getData() {
    return data;
  }

  public void setChdren(LinkedList<Node<E>> children) {
    this.children = children;
  }

  public void setPar(Node<E> parent) {
    this.parent = parent;
  }

  public void addCh(Node<E> child) {
    children.push(child);
  }

  public void removeCh(Node<E> node) {
    children.remove(node);
  }

  public Node<E> removeCh(int i) {
    return children.remove(i);
  }

  public void removeParent() {
    this.parent = null;
  }

  public void pop() {
    children.pop();
  }

  public void merge(Node<E> other) {
    for (int i = other.getChdren().size()-1; i > -1; i--) {
      Node temp = other.removeCh(i);
      temp.setPar(this);
      this.addCh(temp);
    }
  }
}
