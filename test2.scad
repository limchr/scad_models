
function get_i_smooth(arr, perc) = let(ifloat = perc * (len(arr)-1), iint = floor(ifloat), m1 = ifloat - iint, m2 = 1-m1) iint < len(arr)-1 ? m2*arr[iint] + m1*arr[iint+1] : arr[len(arr)-1];
    
    
echo(get_i_smooth([1,2,3,4,5], 1.32));