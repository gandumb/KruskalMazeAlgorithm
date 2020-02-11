public class Edge {
  private PVector start, end;
  private String o;

  public Edge(PVector end, String o) {
    this.end = end;
    this.o = o;
    switch(o) {
    case "N": 
      start = new  PVector(end.x, end.y-1);
      break;
    case "W":
      start = new  PVector(end.x-1, end.y);
      break;
    default: 
      break;
    }
  }

  public PVector getEnd() {
    return end;
  }
  
  public  PVector getStart(){
    return start;
  }

  public void setStart(PVector start) {
    this.start = start;
  }

  public void setEnd(PVector end) {
    this.end = end;
  }

  public String getOrient() {
    return o;
  }
  
  public String toString(){
    return "Start " + start.x + ":"+ start.y + "\tEnd " + end.x + ":" + end.y;
  }
}
