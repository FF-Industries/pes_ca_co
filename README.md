# SEQUENTIAL MULTIPLIER DESIGN
## AISC PHYSICAL DESIGN Mentor- Kunal Ghosh

### Main design :
* The code is is part of multiple modules.
* The main code(pes_se_M) calls the half_adder and full_adder modules.
* full_adder module inturn calls half-adder module.\
* Codes can be found in the file section.
* Using this code we are doing GLS Process to verify Sequential multiplier.

### Simulation :
First we simulate and look at the waveform by normal iverilog way :
#### Commnads :
```
iverilog half_adder.v full_adder.v pes_se_M.v tb_pes_se_M.v
./a.out
gtkwave tb_pes_se_M.vcd
```
#### Output :

<img width="808" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/ed2e5fe6-f47a-44c3-8fd3-66040a0afb73">

<img width="762" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/10d80ab4-44c0-4070-87d2-03f5d89f3721">

Now we use yosys tool to generate the design :

#### Commands :
```
read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog half_adder.v full_adder.v pes_se_M.v tb_pes_se_M.v
synth -top pes_se_M
dfflibmap -liberty ../my_lb/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../my_lib//lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show pes_se_M
```
#### Output :

<img width="381" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/86b8b581-09ed-4a3c-9921-73ca0023cbb2">&nbsp;

<img width="372" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/87b86504-aee3-4d40-b562-b790908e7768">&nbsp;

<img width="230" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/3f257ce2-647f-4696-af58-68b116989e00">&nbsp;

<img width="911" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/c21326e0-e2be-449f-881d-f2a30d00f83c">&nbsp;

Now using synthesis we will check the waveform if it matches th inital waveform :

#### Commands :
```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v half_adder.v full_adder.v pes_se_M.v tb_pes_se_M.v
./a.out
gtkwave tb_pes_se_M.vcd
```
#### Output :

<img width="923" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/fe5cf818-6807-484c-b62d-6ddee7f00de7">

<img width="870" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/909ce7eb-c3b7-4c8a-be7b-d03ebee01306">





 

