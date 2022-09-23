load program.asm,
output-file program.out,
compare-to program.cmp,
output-list RAM[16384]%D2.6.2 RAM[17648]%D2.6.2 RAM[18349]%D2.6.2 RAM[19444]%D2.6.2 RAM[20771]%D2.6.2 RAM[21031]%D2.6.2 RAM[22596]%D2.6.2 RAM[23754]%D2.6.2 RAM[24575]%D2.6.2;

set RAM[0] 83,        
set RAM[1] 84,         
set RAM[24576] 0,    // the keyboard is untouched
repeat 1000000 {
  ticktock;
}
output;              // test that the screen is white

set RAM[24576] 65,    // key 'A' is pressed
repeat 1000000 {
  ticktock;
}
output;              // test that the screen is white

set RAM[24576] 83,    // key RAM[0] is pressed
repeat 1000000 {
  ticktock;
}
output;              // test that the screen is black

set RAM[24576] 0,    // they keyboard in untouched
repeat 1000000 {
  ticktock;
}
output;              // test that the screen is black

set RAM[24576] 84,    // key RAM[1] is pressed
repeat 1000000 {
  ticktock;
}
output;              // test that the screen is white

set RAM[24576] 0,    // they keyboard in untouched
repeat 1000000 {
  ticktock;
}
output;              // test that the screen is white

set RAM[24576] 65,    // a keyboard key is pressed
repeat 1000000 {
  ticktock;
}
output;              // test that the screen is black
