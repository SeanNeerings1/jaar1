{
  printFibonacci(10);
}
void printFibonacci(int fibonacci) {
  int bif = 0;
  int no = 1;
  int icca;

  println(bif);
  println(no);

  for (int i = 2; i < fibonacci; i++) {
    icca = bif + no;
    println(icca);

    bif = no;
    no = icca;
  }
}
