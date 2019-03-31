module tb;
  
  reg btn;
  reg clk_debouncer;
  wire button_out;
  
  debouncer UUT(.btn(btn),.clk_debouncer(clk_debouncer),.button_out(button_out));
  
  initial begin
    btn = 0;
    clk_debouncer = 0;
    
    #100;
    #1 btn = 1;
    #1 btn = 0;
    #10 btn = 1;
    #20 btn = 0;
    #20 btn = 1;
    #40 btn = 0;
    #20 $finish;
  end
  
  always #1 clk_debouncer = ~clk_debouncer;
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule