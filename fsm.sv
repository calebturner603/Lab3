module FSM (clk, reset, L, R, H, La, Lb, Lc, Ra, Rb, Rc);

   input logic  clk;
   input logic  reset;
   input logic 	L;
   input logic  R;
   input logic  H;
   
   output logic  La;
   output logic  Lb;
   output logic  Lc;
   output logic  Ra;
   output logic  Rb;
   output logic  Rc;

   typedef enum 	logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
     La <= 1'b0;
	 	 Lb <= 1'b0;
     Lc <= 1'b0;
     Ra <= 1'b0;
     Rb <= 1'b0;
     Rc <= 1'b0;
	  if (L) nextstate <= S1;
    else if (R) nextstate <= S4;
    else if (H) nextstate <= S7;
	  else   nextstate <= S0;
       end
       S1: begin
     La <= 1'b1;
	 	 Lb <= 1'b0;
     Lc <= 1'b0;
     Ra <= 1'b0;
     Rb <= 1'b0;
     Rc <= 1'b0;	  	  
	    nextstate <= S2;
       end
       S2: begin
     La <= 1'b1;
	 	 Lb <= 1'b1;
     Lc <= 1'b0;
     Ra <= 1'b0;
     Rb <= 1'b0;
     Rc <= 1'b0;	  	  
	    nextstate <= S3;
       end
       S3: begin
     La <= 1'b1;
	 	 Lb <= 1'b1;
     Lc <= 1'b1;
     Ra <= 1'b0;
     Rb <= 1'b0;
     Rc <= 1'b0;	  	  
	    nextstate <= S0;
       end
      S4: begin
     La <= 1'b0;
	 	 Lb <= 1'b0;
     Lc <= 1'b0;
     Ra <= 1'b1;
     Rb <= 1'b0;
     Rc <= 1'b0;	  	  
	    nextstate <= S5;
       end
       S5: begin
     La <= 1'b0;
	 	 Lb <= 1'b0;
     Lc <= 1'b0;
     Ra <= 1'b1;
     Rb <= 1'b1;
     Rc <= 1'b0;	  	  
	    nextstate <= S6;
       end
      S6: begin
     La <= 1'b0;
	 	 Lb <= 1'b0;
     Lc <= 1'b0;
     Ra <= 1'b1;
     Rb <= 1'b1;
     Rc <= 1'b1;	  	  
	    nextstate <= S0;
       end
      S7: begin
     La <= 1'b1;
	 	 Lb <= 1'b0;
     Lc <= 1'b0;
     Ra <= 1'b1;
     Rb <= 1'b0;
     Rc <= 1'b0;
	    nextstate <= S8;
       end
       S8: begin
     La <= 1'b1;
	 	 Lb <= 1'b1;
     Lc <= 1'b0;
     Ra <= 1'b1;
     Rb <= 1'b1;
     Rc <= 1'b0;	  	  
	    nextstate <= S9;
       end
       S9: begin
     La <= 1'b1;
	 	 Lb <= 1'b1;
     Lc <= 1'b1;
     Ra <= 1'b1;
     Rb <= 1'b1;
     Rc <= 1'b1;	  	  
	    nextstate <= S0;
       end
     endcase
   
endmodule
