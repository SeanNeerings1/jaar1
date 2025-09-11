float leeftijd = random(35);


if(leeftijd < 2){
  println("dan is het een baby");
}else if (leeftijd < 4 && leeftijd > 2){
  println("dan is het een kleuter");
}else if (leeftijd < 12 && leeftijd > 4){
  println("dan is het een kind");
}else if (leeftijd < 20 && leeftijd > 12){
  println("dan is het een tiener");
}else if (leeftijd < 25 && leeftijd > 20){
  println("dan is het een adolescent");
}else if (leeftijd >= 25){
    println("dan is het een volwassene");
}
