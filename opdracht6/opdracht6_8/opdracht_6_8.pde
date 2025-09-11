// als cijver hoger of gelijk aan 8 is dan moet cumlaude true aangeven

float cijfer = random(10);
boolean cumlaude = false;


if(cijfer >= 8){
  cumlaude = true; 
  println("met cumlaude geslaagd!");
  println(round(cijfer));
}else{
 println("helaas"); 
}
