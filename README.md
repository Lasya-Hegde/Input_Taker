# Input_Taker
The input_taker module assembles small chunks of plaintext and key data into full 32-bit and 64-bit words. It buffers inputs, places them into the right register slices using a counter, and signals done when assembly is complete, enabling efficient handling of fragmented inputs.








Designer’s Note:
This module started as part of a larger project where inputs had to be taken in small chunks and stitched together into bigger words. While designing it, I wasn’t completely happy with the first version, so I kept tweaking, redesigning, and making new variants (because why stop at one, right?). Eventually, one of these improved versions went into the main project, but I thought it would be fun to share all the variants here. Explore, compare, and enjoy the results. 
After all, something I saw as a drawback might be a feature for you and what I considered a feature might just feel like a drawback in your design.
Have a nice day :))
