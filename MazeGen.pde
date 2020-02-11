import java.util.*; //<>// //<>//

public class MazeGen {
  private int scaleFactor;
  private LinkedList<Edge>stack;
  private Node<Integer>[][] grid;
  private ArrayList<Edge> edges;
  private LinkedList<Edge>vectorMap;

  public MazeGen(int x, int y, int scaleFactor) {
    this.scaleFactor = scaleFactor;
    edges = new ArrayList();

    stack = new LinkedList();

    for (int i = 1; i < y; i++) {
      for (int j = 1; j < x; j++) {
        stack.add(new Edge(new PVector(j, i), "N"));
        stack.add(new Edge(new PVector(j, i), "W"));
      }
    }

    Collections.shuffle(stack);

    grid = new Node[y][x];

    for (int i = 0; i < y; i++)
      for (int j = 0; j < x; j++) {
        Node<Integer> parent = new Node(1000-(i*20+j));
        parent.addCh(new Node(new PVector(i, j), parent));
        grid[i][j] = parent.getCh();
      }
    while (!stack.isEmpty())
      buildMaze();

    vectorMap = new LinkedList<Edge>();
  }

  public LinkedList getStack() {
    return stack;
  }

  public void buildMaze() {
    Edge edge = stack.pop();
    Node <Integer> parentA = grid[(int)edge.getEnd().y][(int)edge.getEnd().x].getPar();
    Node <Integer> parentB;

    try {
      parentB = edge.getOrient().equals("N") ? grid[(int)edge.getEnd().y][(int)edge.getEnd().x+1].getPar() : grid[(int)edge.getEnd().y+1][(int)edge.getEnd().x].getPar();
      if (parentA.getData() != parentB.getData()) 
        parentA.merge(parentB);
      else
        edges.add(edge);
    }
    catch(ArrayIndexOutOfBoundsException Exception) {
      edges.add(edge);
      return;
    }
  }

  public void process(Edge curr) {
    for (int i = edges.size()-1; i > -1; i--) {
      if (curr.getEnd().equals(edges.get(i).getStart()) && curr.getOrient().equals(edges.get(i).getOrient())) {
        curr.setEnd(edges.get(i).getEnd());
        edges.remove(i);
        i = edges.size()-1;
        continue;
      }
      if (curr.getStart().equals(edges.get(i).getEnd()) && curr.getOrient().equals(edges.get(i).getOrient())) {
        curr.setStart(edges.get(i).getStart());
        edges.remove(i);
        i = edges.size()-1;
        continue;
      }
    }
    vectorMap.add(curr);
  }

  public ArrayList<Edge> getEdges() {
    return edges;
  }

  public void drawMaze() {
    strokeWeight(4);
    fill(0);
      for (int i = 0; i < vectorMap.size(); i++)
        switch(vectorMap.get(i).getOrient()) {
        case "N" : 
          line((vectorMap.get(i).getStart().x)*scaleFactor, (vectorMap.get(i).getStart().y)*scaleFactor, (vectorMap.get(i).getEnd().x)*scaleFactor, (vectorMap.get(i).getEnd().y)*scaleFactor); 
          break; 
        case "W" : 
          line((vectorMap.get(i).getStart().x)*scaleFactor, (vectorMap.get(i).getStart().y)*scaleFactor, (vectorMap.get(i).getEnd().x)*scaleFactor, (vectorMap.get(i).getEnd().y)*scaleFactor); 
          break; 
        default : 
          break;
        }
    line(0, 0, width, 0);
    line(0, 0, 0, height);
  }
}
