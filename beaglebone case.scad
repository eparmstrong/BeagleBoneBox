module box(thickness)
{
	width = 55;
	boardlength = 87;
	length = boardlength +ceil( 2/thickness) * thickness;
								      // board + uSD card. This should be and integer
								      // number of thicknesses greater then boardlength
								      // and be >= then 2 + boardlength
	height = 25;
	toplength = length + 2 * thickness;

	difference() {
	cube([width + 2 * thickness,
		length + 2* thickness,
		height +  thickness]);
	translate([thickness, thickness, thickness])
		cube([width,length,height + 3 * thickness]);
	
	translate([31 + thickness, length  ,thickness+4]) cube([14,3 * thickness,8]);//usb host
	
	translate([6+thickness, -1* thickness, .05 +thickness]) cube([8.5, thickness * 3,5]);//usb serial
	translate([17 + thickness, -thickness, 6 +thickness]) cube ([16,3 * thickness, 14]); //eathernet
	translate([41 +thickness,-thickness,6 +thickness]) cube([9,3 * thickness,11]); // power
	}
	translate([10+thickness,thickness+boardlength,thickness]) cube([4, 2, height]);// uSD card stand off
	translate([ 28+thickness, thickness + boardlength, thickness]) cube([3,length - boardlength,height]);
	translate([0,1*toplength,height+thickness])
		rotate(a=-45, v=[1,0,0])
			translate([0,-toplength,0]){
				cube([width + 2* thickness,toplength,  thickness]); //Lid
				translate([17+thickness+4,thickness+4,-(height - 14 - 6 - thickness)]) cube([8,8,height - 14 - 6 - thickness]);// magnetic latch
			}
}

box(.9);

