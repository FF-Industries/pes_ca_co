# SEQUENTIAL MULTIPLIER DESIGN
## AISC PHYSICAL DESIGN Mentor- Kunal Ghosh

### Main design :
* The code is is part of multiple modules.
* The main code(pes_se_M) calls the half_adder and full_adder modules.
* full_adder module inturn calls half-adder module.\
* Codes can be found in the file section.
* Using this code we are doing GLS Process to verify Sequential multiplier.

<img width="633" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/5e576c0d-4100-4439-b4f7-23badf641ed9">

<img width="399" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/9458d1b7-aa7c-49f4-b445-6317335fb22c">


### Simulation :
First we simulate and look at the waveform by normal iverilog way :
#### Commnads :
```
iverilog pes_se_M_half_adder.v pes_se_M_full_adder.v pes_se_M.v tb_pes_se_M.v
./a.out
gtkwave tb_pes_se_M.vcd
```
#### Output :

<img width="921" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/85ae8fd0-d376-41d1-b9be-3a1e97eea19a">

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/163a2dd8-f5ac-4af8-a04b-c43647c0c92d)


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

Now on observing both the waveforms we get the same result hence the synthesis and simulation are matching.



 

