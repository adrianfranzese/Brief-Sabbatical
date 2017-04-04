import fontastic.*; //Import Fontastic library

Fontastic f;

void setup() {
  size(400,400);
  background(255);
  createFont();
}

//Display the font when finished
void draw() {
  //background(255);
  PFont myFont = createFont(f.getTTFfilename(), 84);
  textFont(myFont);
  fill(0);
  text("Font Complete", 20, 380);
  
}

//Create the font
void createFont() {
  f = new Fontastic(this, "Punch Card");
  f.setAdvanceWidth(0);
  
  int i = 0;
  int cStroke = 40; //Width of stroke
  int cWidth = 200; //Width of letters
  //char[] allChars = concat(Fontastic.alphabet, Fontastic.alphabetLc);
  
  for (char c : Fontastic.alphabet) {
      f.addGlyph(c);
      f.addGlyph(Character.toLowerCase(c));
      
      PVector[] points = new PVector[4];
      points[0] = new PVector(0,i);
      points[1] = new PVector(cWidth, i);
      points[2] = new PVector(cWidth, i + cStroke);
      points[3] = new PVector(0, i + cStroke);
      
      f.getGlyph(c).addContour(points);
      f.getGlyph(Character.toLowerCase(c)).addContour(points);
      
      i = i + cStroke;
  }
  f.addGlyph(' ').setAdvanceWidth(int(cWidth * 1.5));
  f.buildFont();
  f.cleanup();
}
