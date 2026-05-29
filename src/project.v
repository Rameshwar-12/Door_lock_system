`default_nettype none

module tt_um_rameshwar_door_lock (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,

    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,

    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

wire match;
wire unlock;
wire error;

// Password Checker
assign match = (ui_in[3:0] == 4'b1010);

// Lock Controller
assign unlock = match;
assign error  = ~match;

// Outputs
assign uo_out[0] = unlock;
assign uo_out[1] = error;
assign uo_out[7:2] = 6'b000000;

// Unused bidirectional pins
assign uio_out = 8'b00000000;
assign uio_oe  = 8'b00000000;

// Prevent warnings
wire _unused = &{ena, clk, rst_n, uio_in, 1'b0};

endmodule
