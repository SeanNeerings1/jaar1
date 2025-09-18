size(500,500);
background(255);

int groote = 400;

for(int i = 0; i < 5; i ++){
  ellipse(490 - groote/2, 250 - groote/50, groote,groote);
  groote = groote - 40;
}
