int [] [] arr = new int [100][160];
int [] mainIndex = new int [100];
int [] searchIndex = new int [100];
boolean [] rowsSorted = new boolean [100];
boolean toggle = true;

void setup () {
  size (800, 500);
  frameRate (120);
  colorMode (HSB, 255, 255, 255);
  noStroke();
  reset();
  drawArray();
}

void draw () {
  for (int x = 0; x < 100; x++) {
    if (mainIndex[x] < 160) {
      if (insertionSort (arr[x], searchIndex[x])) {
        mainIndex[x]++;
        searchIndex[x] = mainIndex[x];
      } else 
      searchIndex[x]--;
    } else {
      rowsSorted[x] = true;
      boolean reset = true;
      for (int y = 0; y < 100; y++) {
        if (rowsSorted[y] == false) {
          reset = false;
          break;
        }
      } 
      if (reset)
        reset();
    }
  }
  drawArray();
}

void mouseReleased() {
  if (toggle)
    noLoop();
  else 
    loop();
  toggle = !toggle;
}

void keyReleased() {
  if (toggle)
    noLoop();
  else 
    loop();
  toggle = !toggle;
}

public boolean insertionSort (int [] arr, int index) {
  int temp = arr[index];
  if (index-1 >= 0 && arr[index-1] > temp) {
    arr [index] = arr [index-1];
    arr [index-1] = temp;
    return false;
  } else 
  return true;
}

public int [] randomArr (int arrLen) {
  int [] returnArr = new int [arrLen];
  for (int x = 0; x < arrLen; x++)
    returnArr [x] = (int) random (0.0, 256.0);
  return returnArr;
}

public void reset () {
  for (int y = 0; y < 100; y++)
    mainIndex[y] = 1;
  for (int y = 0; y < 100; y++)
    searchIndex[y] = mainIndex[y];
  for (int y = 0; y < 100; y++)
    arr [y] = randomArr(160);
}

public void drawArray () {
  background(0);
  for (int x = 0; x < 100; x++) {
    for (int y = 0; y < 160; y++)
    {
      fill (arr[x][y], 159, 232);
      rect (y*5, x*5, 5, 5);
    }
  }
}
