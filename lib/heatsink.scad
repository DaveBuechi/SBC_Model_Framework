/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2019,2020,2021,2022,2023,2024 Edward A. Kisiel hominoid@cablemi.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html


    DESCRIPTION: creates heatsinks
           TODO: replace stl mesh heatsinks, custom dxf positioning

          USAGE: heatsink(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                          type = "hc4_oem", c4_oem", "c2_oem", "c1+_oem", "xu4_oem", xu4q_oem", "n2l_oem", "n2lq_oem",
                                 "n1_oem", "40mm_active", "h3_oem", "m1s_oem", "atomicpi", "n2_oem", "n2+_oem",
                                 "m1_oem", "h2_oem", "khadas_oem", "khadas_fan_oem", "radxa_oem", "rpi5_oem"
                       size[2] = z position
                    enablemask = true produces mask, false produces model
                       mask[0] = true enables component mask
                       mask[1] = mask length
                       mask[2] = mask setback
                       mask[3] = mstyle "open", "fan_open", "fan_1", "fan_2", "fan_hex", "vent, "vent_hex_5mm", "vent_hex_8mm", custom,
                                            "m1", "n2", "n2+"

    DESCRIPTION: creates heatsink masks for openings
           TODO: 

          USAGE: heatsink_mask(size, thick, style)

                          style = "open", "fan_open", "fan_1", "fan_2", "fan_hex", "vent, "vent_hex_5mm", "vent_hex_8mm", custom
                                  "m1", "n2", "n2+"

*/

// heatsink class
module heatsink(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // hardkernel c series heatsink
    if(type=="hc4_oem" || type=="c4_oem" || type=="c2_oem" || type=="c1+_oem") {

        cmask = mask[0];
        mlen = mask[1];
        back = mask[2];
        mstyle = mask[3];

        if(enablemask == true && cmask == true && mstyle == "open") {
            
            size_x = 40;
            size_y = 30;
            size_z = size[2];
            size_xm = 44;
            size_ym = 34;

            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -24.5, 0]) cube([size_xm, size_ym, mlen]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10, -24, 0]) cube([size_xm, size_ym, mlen]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10.5, -23, 0]) cube([size_xm, size_ym, mlen]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -22.5, 0]) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10.5, -24.5, 0]) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10.5, -22.5, 0]) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -22.5, 0]) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -24, 0]) cube([size_xm, size_ym, mlen]);
            }
        }
        if(enablemask == true && cmask == true && (mstyle == "fan_open" || mstyle == "fan_1" || mstyle == "fan_2" || mstyle == "fan_hex")) {
            
            size_x = 40;
            size_y = 30;
            size_z = size[2];
            size_xm = 44;
            size_ym = 34;

            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([5.5, -27.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-8.5, -27.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-8.5, -25.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([5.5, -25.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-8.5, -27.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-8.5, -25.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([5.5, -25.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([5.5, -27.5, 0]) heatsink_mask(40, mlen, mstyle);
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent") {
            
            size_x = 40;
            size_y = 30;
            size_z = size[2];
            size_xm = 44;
            size_ym = 34;

            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2, -24.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-12, -24.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-12, -22.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2, -22.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-12, -24.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-12, -22.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2, -22.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2, -24.5, 0]) vent(2, size_ym, mlen, 1.5, 1, 10, "horizontal");
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent_hex_5mm") {
            
            size_x = 40;
            size_y = 30;
            size_z = size[2];
            size_xm = 44;
            size_ym = 34;

            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -27.5, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10.75, -27.5, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10.75, -25.5, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -25.5, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10.5, -27.5, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-10.5, -25, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -25.5, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([3.5, -27.5, 0]) vent_hex(13, 7, mlen, 5, 1.5, "horizontal");
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent_hex_8mm") {
            
            size_x = 40;
            size_y = 30;
            size_z = size[2];
            size_xm = 44;
            size_ym = 34;

            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2.5, -28.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-11.75, -28.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-11.75, -26.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2.5, -26.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-11.5, -28.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-11.75, -26.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2.5, -26.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([2.5, -28.5, 0]) vent_hex(9, 5, mlen, 8, 1.5, "horizontal");
            }
        }
        if(enablemask == true && cmask == true && mstyle == "custom") {
            
            size_x = 40;
            size_y = 30;
            size_z = size[2];
            size_xm = 44;
            size_ym = 34;

            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([9.5, -23.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-4.5, -23.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-4.5, -21.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([9.5, -21.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-4.5, -23.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([-4.5, -21.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([9.5, -21.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                                translate([9.5, -23.5, 0]) linear_extrude(height = mlen) import(file = "dxf/customfan.dxf");
            }
        }
        if(enablemask == false) {

            size_x = 58;
            size_y = 32;
            size_z = size[2];
            fcolor = "gray";

            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            translate([5.5, -23.5, size_z])
            difference() {
                union() {
                    color(fcolor, .6) cube([40, 32, 10]);
                    if(type=="hc4_oem") {
                        color(fcolor, .6) translate([39.99, 5, 0]) cube([5.5, 7, 2]);
                        color(fcolor, .6) translate([45.75, 8.5, 0]) cylinder(d=7, h=2);
                        color(fcolor, .6) translate([-5.49, 25, 0]) cube([5.5, 7, 2]);
                        color(fcolor, .6) translate([-5.5, 28.5, 0]) cylinder(d=7, h=2);
                        }
                        else {
                            color(fcolor, .6) translate([39.99, 0, 0]) cube([5.5, 7, 2]);
                            color(fcolor, .6) translate([45.75, 3.5, 0]) cylinder(d=7, h=2);
                            color(fcolor, .6) translate([-5.49, 20, 0]) cube([5.5, 7, 2]);
                            color(fcolor, .6) translate([-5.5, 23.5, 0]) cylinder(d=7, h=2);
                        }
                }
                // center channel and fins
                color(fcolor, 1) translate([17.5, -1, 2]) cube([5, 34, 9]);
                color(fcolor, 1) translate([1.5, -1, 2]) cube([1.25, 34, 9]);
                for (i=[3.5:2.25:38]) {
                    color(fcolor, 1) translate([i, -1, 2]) cube([1.5, 34, 9]);
                }
                // fin elevations
                color(fcolor, .6) translate([4, -1, 9]) cube([8, 34, 2]);
                color(fcolor, .6) translate([28, -1, 9]) cube([8, 34, 2]);
                color(fcolor, .6) translate([11, -1, 8]) cube([2, 34, 3]);
                color(fcolor, .6) translate([27, -1, 8]) cube([2, 34, 3]);
                color(fcolor, .6) translate([13, -1, 7]) cube([2, 34, 4]);
                color(fcolor, .6) translate([25, -1, 7]) cube([2, 34, 4]);
                color(fcolor, .6) translate([16, -1, 6]) cube([2, 34, 5]);
                color(fcolor, .6) translate([22, -1, 6]) cube([2, 34, 5]);
                // holes
                if(type=="hc4_oem") {
                    color(fcolor, .6) translate([45.75, 8.5, -1]) cylinder(d=3, h=4);
                    color(fcolor, .6) translate([-5.5, 28.5, -1]) cylinder(d=3, h=4);
                }
                else {
                    color(fcolor, .6) translate([45.75, 3.5, -1]) cylinder(d=3, h=4);
                    color(fcolor, .6) translate([-5.5, 23.5, -1]) cylinder(d=3, h=4);
                }
            }
        }
    }

    // hardkernel xu4 and n2l heatsink
    if((type=="xu4_oem" || type=="n2l_oem" || type == "n1_oem" || type == "40mm_active_10") && enablemask ==  false) {

        $fn=60;
        size_x = 58;
        size_y = 40;
        size_z = size[2];
        fcolor = (type == "n1_oem" || type == "40mm_active_10") ? "white" : "DeepSkyBlue";

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            translate([5.5, -30, size_z])
                difference() {
                    union() {
                        color(fcolor, .6) cube([40, 40, 9.8]);
                        color(fcolor, .6) translate([39.99, 6.5, 0]) cube([5.5, 7, 2]);
                        color(fcolor, .6) translate([45.5, 10, 0]) cylinder(d=7, h=2);
                        color(fcolor, .6) translate([-5.49, 26.5, 0]) cube([5.5, 7, 2]);
                        color(fcolor, .6) translate([-5.5, 30, 0]) cylinder(d=7, h=2);
                    }
                    // fins
                    for (i=[1.5:2.25:38.5]) {
                            color(fcolor, .6) translate([i, -1, 2]) cube ([1.25, 42, 12]);
                    }
                    // cross opening
                    color(fcolor, .6) translate([17.5, -1, 2]) cube([5, 42, 10]);
                    color(fcolor, .6) translate([-1, 17.5, 2]) cube([42, 5, 10]);
                    // fin elevations
                    color(fcolor, .6) translate([4, -1, 9]) cube([8, 42, 2]);
                    color(fcolor, .6) translate([28, -1, 9]) cube([8, 42, 2]);
                    color(fcolor, .6) translate([11, -1, 8]) cube([2, 42, 3]);
                    color(fcolor, .6) translate([27, -1, 8]) cube([2, 42, 3]);
                    color(fcolor, .6) translate([13, -1, 7]) cube([2.5, 42, 4]);
                    color(fcolor, .6) translate([25, -1, 7]) cube([2, 42, 4]);
                    color(fcolor, .6) translate([16, -1, 6]) cube([2, 42, 5]);
                    color(fcolor, .6) translate([22, -1, 6]) cube([2.5, 42, 5]);
                    // fan cut out
                    color(fcolor, .6) translate([20, 20, 2]) cylinder(r=18, h=13.5, $fn=100);
                    // holes
                    color(fcolor, .6) translate([45.5, 10, -1]) cylinder(d=3, h=4);
                    color(fcolor, .6) translate([-5.5, 30, -1]) cylinder(d=3, h=4);
                }
    }

    // hardkernel xu4q and n2lq heatsink
    if((type == "xu4q_oem"  || type =="n2lq_oem" || type == "40mm_passive_25") && enablemask ==  false) {

        $fn=60;
        size_x = 58;
        size_y = 40;
        size_z = size[2];
        fcolor = type == "40mm_passive_25" ? "white" : "DeepSkyBlue";

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        translate([5.5,-30,size_z])
        difference() {
            union() {
                color(fcolor, .6) cube([40, 40, 25]);
                color(fcolor, .6) translate([39.99, 6.5, 0]) cube([5.5, 7, 2]);
                color(fcolor, .6) translate([45.5, 10, 0]) cylinder(d=7, h=2);
                color(fcolor, .6) translate([-5.49, 26.5, 0]) cube([5.5, 7, 2]);
                color(fcolor, .6) translate([-5.5, 30, 0]) cylinder(d=7, h=2);
            }
            // fins
            for (i=[1.25:3.5:38.5]) {
                    color(fcolor, .6) translate([i, -1, 2]) cube ([2.5, 42, 25]);
            }
            for (i=[7.5:8:38.5]) {
                    color(fcolor, .6) translate([-1, i, 2]) cube ([42, 1.5, 25]);
            }
            // holes
            color(fcolor, .6) translate([45.5, 10, -1]) cylinder(d=3, h=4);
            color(fcolor, .6) translate([-5.5, 30, -1]) cylinder(d=3, h=4);
        }

    }

    // h3/h3+ hk heatsink
    if(type == "h3_oem" && enablemask ==  false) {

        size_x = 77;
        size_y = 72;
        size_z = 27;

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        difference() {
            union() {
                color("gray",.6) translate([0, 0, 3]) cube([size_x, size_y, size_z]);
                }
            // center channel and fins
            color("gray", 1) translate([13, -1, 5]) cube([2, size_y+2, size_z]);
            color("gray", 1) translate([47, -1, 5]) cube([2, size_y+2, size_z]);
            for (i=[1:3.75:size_y]) {
                color("gray", 1) translate([-1, i, 5]) cube([size_x+2, 3, size_z]);
            }
            // holes
            color("gray", .6) translate([30, 14,  -1]) cylinder(d=3, h=7);
            color("gray", .6) translate([73, 14, -1]) cylinder(d=3, h=7);
            color("gray", .6) translate([30, 51, -1]) cylinder(d=3, h=7);
            color("gray", .6) translate([73, 51, -1]) cylinder(d=3, h=7);
            color("gray", .6) translate([26, 10, 5]) cube([8, 8, size_z]);
            color("gray", .6) translate([69, 10, 5]) cube([8.2, 8, size_z]);
            color("gray", .6) translate([26, 47, 5]) cube([8, 8, size_z]);
            color("gray", .6) translate([69, 47, 5]) cube([8.2, 8, size_z]);

        }
    }

    if(type == "m1s_oem" && enablemask ==  false) {

        $fn = 60;
        size_x = 40;
        size_y = 40;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,pcbsize_z+size_z)
        difference() {
            union() {
                color("grey", .6) cube([40, 40, 8.35]);
                color("grey", .6) translate([5.15, 39.99, 0]) cube([6.2, 4.16, 2]);
                color("grey", .6) translate([8.25, 44.15, 0]) cylinder(d=6.2, h=2);
                color("grey", .6) translate([29.4, -4.14, 0]) cube([6.2, 4.16, 2]);
                color("grey", .6) translate([32.55, -4.15, 0]) cylinder(d=6.2, h=2);
            }
            // fins
            for (i=[1.35:2.25:38.5]) {
                    color("grey", .6) translate([-1, i, 2]) cube ([42, 1.25, 12]);
            }
            // cross opening
            color("grey", .6) translate([-1, 17.5, 2]) cube([42, 4.8, 10]);
            // fin elevations
            color("grey", .6) translate([-1, 16, 6.11]) cube([42, 8, 3]);
 
            // holes
            color("grey", .6) translate([8.25, 44.15, -1]) cylinder(d=3, h=4);
            color("grey", .6) translate([32.55, -4.15, -1]) cylinder(d=3, h=4);
        }
    }

    // atomicpi heatsink
    if(type == "atomicpi" && enablemask ==  false) {

        $fn=60;
        size_x = 70;
        size_y = 64;
        size_z = size[2];
                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z+size_z)
        difference() {
            color("grey", .8) cube([size_x, size_y, 32]);
            color("grey", .8) translate([-1, -1, -1]) cube([72, 16, 3.5]);
            color("grey", .8) translate([-1, size_y-15, -1]) cube([72, 16, 3.5]);
            // fins
            for (i=[1.5:4.5:size_y]) {
                    color("silver", .6) translate([-1, i, 11]) cube ([72, 2.75, 22]);
            }
        }
    }

    // hardkernel n2 heatsink
    if(type == "n2_oem" && enablemask ==  false) {

        size_x = 90;
        size_y = 90;
        size_z = size[2];
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,-3)
            color("gray") import("./lib/heatsinks/Odroid-N2_Heatsink.stl", convexity=3);
    }
    
    // hardkernel n2+ heatsink
    if(type == "n2+_oem" && enablemask ==  false) {

        size_x = 90;
        size_y = 90;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,-3)
            color("gray") import("./lib/heatsinks/Odroid-N2+_Heatsink.stl", convexity=3);
    }

    // hardkernel m1 heatsink
    if(type == "m1_oem" && enablemask ==  false) {

        size_x = 90;
        size_y = 122;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,-3)
            color("gray") translate([-.5, 0, 3]) import("./lib/heatsinks/Odroid-M1_Heatsink.stl", convexity=3);
    }

    // hardkernel h2 heatsink
    if(type == "h2_oem" && enablemask ==  false) {

        size_x = 90;
        size_y = 90;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z+size_z)
        color("gray") import("./lib/heatsinks/Odroid-H2_Heatsink.stl", convexity=3);
    }

    // khadas heatsink without fan
    if(type == "khadas_oem" && enablemask ==  false) {

        size_x = 82;
        size_y = 48;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("gray", .6) import("./lib/heatsinks/Khadas_Heatsink.stl", convexity=3);
    }
    
    // khadas heatsink with fan
    if(type == "khadas_fan_oem" && enablemask ==  false) {
        size_x = 82;
        size_y = 48;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("gray", .6) import("./lib/heatsinks/Khadas_Heatsink_Fan.stl", convexity=3);
    }

    // radxa heatsink
    if(type == "radxa_oem" && enablemask ==  false) {

        size_x = 82;
        size_y = 56;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,pcbsize_z+size_z)
        color("gray", .6) import("./lib/heatsinks/Radxa_Heatsink.stl", convexity=3);
    }

    // RPi5 heatsink
    if(type == "rpi5_oem" && enablemask ==  false) {

        size_x = 58;
        size_y = 32;
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,pcbsize_z+size_z)
        difference() {
            union() {
                color("lightgray", .6) linear_extrude(height = 2) import("./lib/heatsinks/rpi5_oem.dxf");
                translate([6, 2.5, 2-.01])color("lightgray", .6) cube([20, 40, 8]);
                difference() {
                    union() {
                        translate([27, 11.75, 2-.01])color("black", .6) cube([30, 30, 8]);
                        translate([27, 11.75, 10-.01])color("lightgray", .6) cube([30, 30, .25]);
                    }
                    translate([42, 26.75, 2-.01]) color("black", .6) cylinder(d=21, h=9);
                    translate([31, 39, 2-.01]) color("black", .6) cylinder(d=3, h=9);
                    translate([54, 14, 2-.01]) color("black", .6) cylinder(d=3, h=9);
                    translate([54, 39, 2-.01]) color("black", .6) cylinder(d=3, h=9);
                    }
                }
            // fins
            for (i=[4.75:3.5:25]) {
                color("lightgray", .6) translate([i, -1, 2]) cube([1.75, 44, 8]);
            }
            for (i=[5.35:4.625:40]) {
                color("lightgray", .6) translate([-1, i, 3]) cube([28, 2, 8]);
            }
        }
    }
}


/* heatsink mask to create opening */
module heatsink_mask(size, thick, style) {

    $fn=90;
    
    if(style == "fan_open") {
        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
        if(size == 40) {
            // mount holes
            translate([size-4, size-4, -1]) cylinder(h=thick+2, d=3);
            translate([size-4, 4, -1]) cylinder(h=thick+2, d=3);
            translate([4, size-4, -1]) cylinder(h=thick+2, d=3);
            translate([4, 4, -1]) cylinder(h=thick+2, d=3);
        }
        if(size == 60) {
            // mount holes
            translate([size-5, size-5, -1]) cylinder(h=thick+2, d=3);
            translate([size-5, 5, -1]) cylinder(h=thick+2, d=3);
            translate([5, size-5, -1]) cylinder(h=thick+2, d=3);
            translate([5, 5, -1]) cylinder(h=thick+2, d=3);
        }
        if(size >= 80) {
            // mount holes
            translate([size-3.75, size-3.75, -1]) cylinder(h=thick+2, d=3);
            translate([size-3.75, 3.75, -1]) cylinder(h=thick+2, d=3);
            translate([3.75, size-3.75, -1]) cylinder(h=thick+2, d=3);
            translate([3.75, 3.75, -1]) cylinder(h=thick+2, d=3);
        }
    }
    if(style == "fan_1" && size == 40) {
        difference() {
            union () {
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-8);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-11);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-17);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-20);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-25);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-28);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-35);
                }
                // mount holes
                translate([size-4, size-4, -1]) cylinder(h=thick+2, d=3);
                translate([size-4, 4, -1]) cylinder(h=thick+2, d=3);
                translate([4, size-4, -1]) cylinder(h=thick+2, d=3);
                translate([4, 4, -1]) cylinder(h=thick+2, d=3);
            }
            translate([6.5, 5.5, -2]) rotate([0, 0, 45]) cube([size, 1.5, thick+4]);
            translate([5, size-6, -2]) rotate([0, 0, -45]) cube([size, 1.5, thick+4]);
        } 
    }
    if(style == "fan_1" && size == 60) {
        difference() {
            union () {
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-14);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-18);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-30);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-34);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-46);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-50);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-59);
                }
                // mount holes
                translate([size-5, size-5, -1]) cylinder(h=thick+2, d=3);
                translate([size-5, 5, -1]) cylinder(h=thick+2, d=3);
                translate([5, size-5, -1]) cylinder(h=thick+2, d=3);
                translate([5, 5, -1]) cylinder(h=thick+2, d=3);
            }
            translate([9.5, 8, -2]) rotate([0, 0, 45]) cube([size, 2, thick+4]);
            translate([8.5, size-10, -2]) rotate([0, 0, -45]) cube([size, 2, thick+4]);
        } 
    }
    if(style == "fan_1" && size >= 80) {
        difference() {
            union () {
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-9);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-14);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-21);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-26);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-33);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-38);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-45);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-50);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-57);
                }
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-62);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-68);
                }
                if(size == 92) {
                difference() {
                    translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-74);
                    translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-80);
                }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-85);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-91);
                    }
                }
                // mount holes
                translate([size-3.75, size-3.75, -1]) cylinder(h=thick+2, d=3);
                translate([size-3.75, 3.75, -1]) cylinder(h=thick+2, d=3);
                translate([3.75, size-3.75, -1]) cylinder(h=thick+2, d=3);
                translate([3.75, 3.75, -1]) cylinder(h=thick+2, d=3);
            }
            translate([6.5, 4.25, -2]) rotate([0, 0, 45]) cube([size*1.2, 3, thick+4]);
            translate([4.25, size-6.5, -2]) rotate([0, 0, -45]) cube([size*1.2, 3, thick+4]);
        }
    }
    if(style == "fan_2") {
        inner = size == 30 ? 24 :
            size == 40 ? 32 :
            size == 50 ? 40 :
                size == 60 ? 50 :
                size == 70 ? 61.9 :
                    size == 80 ? 71.5 :
                    size * 0.8; // Use 80% as default

        rings = size <= 40 ? 4 : 6;
        bar_size = size <= 40 ? 2 : 3;

        screw_offset = inner / 2;
        center_point = size * 0.5;
        base_ring_size = size * 0.95;
        rings_spacing = size / rings;

        translate([size/2, size/2, -1])
        union() {
            translate([screw_offset, screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);
            translate([-screw_offset, screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);
            translate([screw_offset, -screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);
            translate([-screw_offset, -screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);

            difference() {
            union() {
                for(i=[inner:-rings_spacing:0]) {
                    difference() {
                        cylinder(d=base_ring_size - i, h=thick+2);
                        translate([0, 0, -1]) cylinder(d=base_ring_size - i - (rings_spacing/2), h=thick+4);
                    }
                }
            }

            translate([0, 0, 6]) 
                union() {
                    cylinder(d=bar_size*2+0.1, thick+6); // Add a circle to prevent any tiny holes around cross bar
                    rotate([0, 0, 45]) cube([size, bar_size, thick+4], center=true);
                    rotate([0, 0, 45]) cube([bar_size, size, thick+4], center=true);
                }
            }
        }
    }
    if(style == "fan_hex") {
        union() {
            difference () {
                translate([1+(size-2)/2, 1+(size-2)/2, -1]) cylinder(h=thick+2, d=size-2);
                union() {
                    difference() {
                        translate([1+(size-2)/2, 1+(size-2)/2, -1-adj]) cylinder(h=thick+3, d=size-2);
                        if(size == 40) {
                            translate([-14, -11.25, 0]) vent_hex(12, 5, thick+4, 12, 2, "horizontal");
                        }
                        if(size == 60) {
                            translate([-11, -1.5, 0]) vent_hex(12, 5, thick+4, 12, 2, "horizontal");
                        }
                        if(size == 80) {
                            translate([-8.25, -3.5, 0]) vent_hex(14, 8, thick+4, 12, 2, "horizontal");
                        }
                        if(size == 92) {
                            translate([-9, -4, 0]) vent_hex(15, 8, thick+4, 12, 2, "horizontal");
                        }
                    
                    }
                }
            }
            if(size == 40) {
                // mount holes
                translate([size-4, size-4, -1]) cylinder(h=thick+2, d=3);
                translate([size-4, 4, -1]) cylinder(h=thick+2, d=3);
                translate([4, size-4, -1]) cylinder(h=thick+2, d=3);
                translate([4, 4, -1]) cylinder(h=thick+2, d=3);
            }
            if(size == 60) {
                // mount holes
                translate([size-5, size-5, -1]) cylinder(h=thick+2, d=3);
                translate([size-5, 5, -1]) cylinder(h=thick+2, d=3);
                translate([5, size-5, -1]) cylinder(h=thick+2, d=3);
                translate([5, 5, -1]) cylinder(h=thick+2, d=3);
            }
            if(size >= 80) {
                // mount holes
                translate([size-3.75, size-3.75, -1]) cylinder(h=thick+2, d=3);
                translate([size-3.75, 3.75, -1]) cylinder(h=thick+2, d=3);
                translate([3.75, size-3.75, -1]) cylinder(h=thick+2, d=3);
                translate([3.75, 3.75, -1]) cylinder(h=thick+2, d=3);
            }
        }
    }
}
