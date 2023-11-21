Student: Jose Manuel García Bello. 
Email: jose.manuel.garcia.bello@udc.es

The solution to binairo problem is coded in binairo.lp file which tries to solve binairo puzzle on a n x n binairo board.
I have structured the code and python scripts required:
- ./examples folder contains the examples and solutions provided.
- ./utils folder contains the encode and decode python scripts.
Therefore in order to execute the binairo.lp solution the command to execute will be:
 python3 ./utils/encode.py < ./examples/dom06.txt > domain.lp
 clingo 0 binairo.lp domain.lp
 python3 ./utils/decode.py binairo.lp domain.lp

In order to run test examples I have developed two shell scripts:
- runBinario.sh executes a binario example, for instance command: 
  ./runBinairo.sh -e 06 -n compare06.txt executes the example 06 and the diff between the result obtained and the 
  file solXX.txt required is stored in compare06.txt file. Each runBinairo process generates two files:
  + resultXX.txt with the result of the clingo execution.
  + compareXX.txt with the final diff between clingo execution and solutions provided.
- runBinairoComplete.sh: executes all examples in ./examples folder.
