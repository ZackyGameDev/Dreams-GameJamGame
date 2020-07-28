scrollx = argument0;
scroll_amount = argument1;

x   = view_xview[0];
y   = view_yview[0];

draw_background (bg_clouds1, x+scrollx/10, y);
draw_background (bg_clouds2, x +scrollx/8, y);
draw_background (bg_clouds3, x +scrollx/6, y);
draw_background (bg_clouds4, x +scrollx/4, y);
draw_background (bg_clouds5, x +scrollx/2, y);
draw_background (bg_clouds6, x +scrollx/1, y);

var i;
for (i = 0; i < 6; i += 1) {
   scrollx[i] += scroll_amount[i];
}

scrollx -= 1;

return scrollx;
