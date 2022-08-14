min_h = 2;
max_h = 5;

seed = 1;

tiles_x = 2;
tiles_y = 2;
pol_x = 4;
pol_y = 4;

tile_w = 200;
tile_h = 200;

pol_w = tile_w/pol_x;
pol_h = tile_h/pol_y;

nvx = tiles_x*(pol_x+1);
nvy = tiles_y*(pol_y+1);


edges = rands(min_h,max_h,tiles_x*tiles_y*(pol_x+1)*(pol_y+1), seed);

function edge_h(ptx,pty,ppx,ppy) = let(
ix = ptx*pol_x+ppx,
iy = pol_x*tiles_x*pty+ppy) edges[iy+ix]; 

for(tx=[0:tiles_x-1]) {
        for(ty=[0:tiles_y-1]) {
            
            for(px=[0:pol_x-1]){
                for(py=[0:pol_y-1]){
                    
                    
                    
                    
                }

                
            }
            
            
        }
    
}