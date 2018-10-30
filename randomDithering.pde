PImage picture;
int[][] rndNumbers;
int amountOfValues;


void setup() {
  //double width of image and height
  size(1200, 600);
  picture = loadImage("me.jpg");
  //picture.filter(GRAY);
  image(picture, 0, 0);//will be on left side of the image
  initArrayWithRandomValues();
  displayDitheredImage();
}

void displayDitheredImage() {
    picture.loadPixels();
  for (int x = 0; x < picture.width; x++) {
    for (int y = 0; y < picture.height; y++) {
      color pix = picture.pixels[index(x, y)];
      int greyValue = (int) (red(pix) + green(pix) + blue(pix)) / 3;
      if (rndNumbers[x][y] < greyValue) {
        picture.pixels[index(x, y)] = color(255, 255, 255);
      } else {
        picture.pixels[index(x, y)] = color(0, 0, 0);
      }
    }
  }

  picture.updatePixels();
  image(picture, width/2, 0);
}

void initArrayWithRandomValues() {
  rndNumbers = new int[picture.width][picture.height];
  for (int i = 0; i < rndNumbers.length; i++) {
    for (int j = 0; j < rndNumbers[i].length; j++) {
      rndNumbers[i][j] = (int)random(1, 255);
      //println(rndNumbers[i][j]);
    }
  }
}

int index(int x, int y) {
  return x + y * picture.width;
}
