
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	      clk;
input   	      reset;
output reg [13:0] gray_addr;
output reg        gray_req;
input   	      gray_ready;
input   [7:0] 	  gray_data;
output reg [13:0] lbp_addr;
output reg 	      lbp_valid;
output reg [7:0]  lbp_data;
output reg 	      finish;
//====================================================================

reg [2:0] n_state,c_state;

reg [2:0] cnt;
wire [6:0] cx , cy;

reg [7:0] center_pixel;
assign cx = gray_addr[6:0];
assign cy = gray_addr[13:7];

parameter IDLE     = 3'd0,
          GET_GC   = 3'd1,
          GET_GP   = 3'd2,
          WRITE    = 3'd3,
          FIN      = 3'd4
;

//c_state
always @(posedge clk or posedge reset) begin
    if (reset) c_state <= IDLE;
    else c_state <= n_state;
end

//n_state
always @(*) begin
    case (c_state)
        IDLE   : n_state = (gray_ready == 1'b1) ? GET_GC : c_state;
        GET_GC : n_state = GET_GP;
        GET_GP : n_state = (cnt == 3'd7) ? WRITE : c_state;
        WRITE  : n_state = (cy == 7'd127 && cx == 7'd127) ? FIN : GET_GC;
        default: n_state = c_state;
    endcase
end

//cnt
always @(posedge clk or posedge reset) begin
    if(reset)cnt <= 3'd0;
    else if(c_state == GET_GC || c_state == GET_GP) cnt <= cnt + 3'd1;
    else cnt <= 3'd0;
end

//gray_req
always @(posedge clk or posedge reset) begin
    if(reset) gray_req <= 1'b0;
    else if(gray_ready == 1'b1) gray_req <= 1'b1;
    else if(c_state == FIN)   gray_req <= 1'b0;
end
//gray_addr
always @(posedge clk or posedge reset) begin
    if(reset) gray_addr <= 14'd129;
    else if(c_state == GET_GC || c_state == GET_GP)begin
        if(cnt == 3'd0) gray_addr <= gray_addr - 14'd129;
        else if(cnt == 3'd1 || cnt == 3'd2) gray_addr <= gray_addr + 14'd1;
        else if(cnt == 3'd3) gray_addr <= gray_addr + 14'd126;
        else if(cnt == 3'd4) gray_addr <= gray_addr + 14'd2;
        else if(cnt == 3'd5) gray_addr <= gray_addr + 14'd126;
        else if(cnt == 3'd6 || cnt == 3'd7) gray_addr <= gray_addr + 14'd1;
    end
    else if(c_state == WRITE)begin
        if(cx < 7'd127) gray_addr <= gray_addr - 14'd128;
        else if(cx == 7'd127) gray_addr <= gray_addr - 14'd126;
        else gray_addr <= gray_addr + 14'd3;
    end
end

//center_pixel
always @(posedge clk or posedge reset) begin
    if(reset) center_pixel <= 8'd0;
    else if(c_state == GET_GC) center_pixel <= gray_data;
end

//lbp_valid
always @(posedge clk or posedge reset) begin
    if(reset) lbp_valid <= 1'b0;
    else if(c_state == WRITE) lbp_valid <= 1'b1;
    else lbp_valid <= 1'b0;
end
//lbp_addr
always @(posedge clk or posedge reset) begin
    if(reset) lbp_addr <= 14'd0;
    else if(c_state == WRITE) lbp_addr <= gray_addr - 14'd129;
end
//lbp_data
always @(posedge clk or posedge reset) begin
    if(reset) lbp_data <= 14'd0;
    else if(c_state == GET_GP || c_state == WRITE)begin
        if(gray_data >= center_pixel) begin
            if(cnt > 3'd0) lbp_data <= lbp_data + (1 << (cnt - 3'd1));
            else lbp_data <= lbp_data + (1 << 3'd7);
        end
    end
    else if(c_state == GET_GC) lbp_data <= 14'd0;
end
//finish
always @(posedge clk or posedge reset) begin
    if(reset) finish <= 1'b0;
    else if(c_state == FIN) finish <= 1'b1;
end

//====================================================================
endmodule
