# Input_Taker
The input_taker module collects small chunks of plaintext and key data and assembles them into complete 32-bit and 64-bit words.

A 4-bit input pin is used to capture the plaintext sequentially.

8 input pins are assigned to capture the key sequentially.

Inputs are provided over 8 clock cycles, resulting in a total of 32-bit plaintext and 64-bit key being captured. The module then outputs the 32-bit plaintext and 64-bit key in parallel.

This repository compares the reports of four different design methods used to implement this operation.





Designer’s Note:
This module started as part of a larger project where inputs had to be taken in small chunks and stitched together into bigger words. While designing it, I wasn’t completely happy with the first version, so I kept tweaking, redesigning, and making new variants (because why stop at one, right?). Eventually, one of these improved versions went into the main project, but I thought it would be fun to share all the variants here. Explore, compare, and enjoy the results. 
After all, something I saw as a drawback might be a feature for you and what I considered a feature might just feel like a drawback in your design.
Have a nice day :))
