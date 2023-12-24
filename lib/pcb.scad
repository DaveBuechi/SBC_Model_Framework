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
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html


    DESCRIPTION: creates pcb and features
           TODO: 
           
          USAGE: pcb(size[], radius)
          
                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                     radius = corner radius

          USAGE: pcbhole(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])
          
                         type = "led"
                         size[0] = hole diameter
                         size[1] = size_y
                         size[2] = size_z
                         data[1] = hole color


*/

// pcb board
module pcb(size, radius) {
    x = size[0];
    y = size[1];
    z = size[2];   
    linear_extrude(height = z)
    hull() {
        translate([0+radius ,0+radius, 0]) circle(r = radius);
        translate([0+radius, y-radius, 0]) circle(r = radius);
        translate([x-radius, y-radius, 0]) circle(r = radius);
        translate([x-radius, 0+radius, 0]) circle(r = radius);
    }  
}

// pcb hole additions
module pcbhole(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // pcbhole class
    if(type == "round") {
    
        trace = data[3];
        size_x = size[0];
        size_y = size[0];
        style = data[0];
        hcolor = data[1];
        shape = data[2];
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        difference() {
            color(hcolor) translate([0, 0, -.0625-pcbsize_z]) cylinder(d=trace, pcbsize_z+.125);
            color(hcolor) translate([0, 0, -1.125-pcbsize_z]) cylinder(d=size_x-.125, pcbsize_z+2);
        }
    }
}