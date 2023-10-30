# SEQUENTIAL MULTIPLIER DESIGN
## AISC PHYSICAL DESIGN Mentor- Kunal Ghosh

### Main design :
* The code is is part of multiple modules.
* The main code(pes_se_M) calls the half_adder and full_adder modules.
* full_adder module inturn calls half-adder module.\
* Codes can be found in the file section.
* Using this code we are doing GLS Process to verify Sequential multiplier.

<img width="633" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/5e576c0d-4100-4439-b4f7-23badf641ed9">&nbsp;

<img width="399" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/9458d1b7-aa7c-49f4-b445-6317335fb22c">&nbsp;


### Simulation :
First we simulate and look at the waveform by normal iverilog way :
#### Commnads :
```
iverilog pes_se_M_half_adder.v pes_se_M_full_adder.v pes_se_M.v tb_pes_se_M.v
./a.out
gtkwave tb_pes_se_M.vcd
```
#### Output :

<img width="921" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/85ae8fd0-d376-41d1-b9be-3a1e97eea19a">&nbsp;

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/163a2dd8-f5ac-4af8-a04b-c43647c0c92d)


Now we use yosys tool to generate the design :

#### Commands :
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog half_adder.v full_adder.v pes_se_M.v tb_pes_se_M.v
synth -top pes_se_M
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
write_verilog pes_se_M_net.v
show pes_se_M
```
#### Output :

<img width="911" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/e25a70a0-3983-4bd3-8a6d-1002cc9d6534">&nbsp;

<img width="918" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/d409ba69-1dda-41c6-9b59-f02233a3d579">&nbsp;

<img width="919" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/0e5221c8-4d52-43d8-bfdf-eba73fd79a43">&nbsp;

<img width="921" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/7e38e8a0-8426-44cd-bcb7-ed866b7a2c0d">&nbsp;

Now using synthesis we will check the waveform if it matches th inital waveform :

#### Commands :
```
iverilog ../verilog_model/primitives.v ../verilog_model/sky130_fd_sc_hd.v pes_se_M_half_adder.v pes_se_M_full_adder.v pes_se_M.v tb_pes_se_M.v
./a.out
gtkwave tb_pes_se_M.vcd
```
#### Output :

<img width="918" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/950fc08b-3fd8-4938-b2c9-0dc154cb57af">&nbsp;

<img width="870" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/909ce7eb-c3b7-4c8a-be7b-d03ebee01306">&nbsp;

Now on observing both the waveforms we get the same result hence the synthesis and simulation are matching.

### OpenLANE Flow :

#### config.json file :

```
{
    "DESIGN_NAME": "pes_se_M",
    "VERILOG_FILES": [
        "dir::src/pes_se_M.v",
        "dir::src/pes_se_M_half_adder.v",
        "dir::src/pes_se_M_full_adder.v"
    ],
    "CLOCK_PORT": "clk",
    "CLOCK_NET": "clk",
    "GLB_RESIZER_TIMING_OPTIMIZATIONS": true,
    "RUN_HEURISTIC_DIODE_INSERTION": true,
    "DIODE_ON_PORTS": "in",
    "GPL_CELL_PADDING": 2,
    "DPL_CELL_PADDING": 2,
    "CLOCK_PERIOD": 24,
    "FP_CORE_UTIL": 35,
    "pdk::sky130*": {
        "MAX_FANOUT_CONSTRAINT": 6,
        "scl::sky130_fd_sc_ms": {
            "FP_CORE_UTIL": 30
        }
    }
}

```

#### Steps to run synthesis in OpenLane :

```
cd ~/OpenLane
make mount
./flow.tcl -interactive
package require openlane 0.9
prep -design pes_se_M
run_synthesis
```

<img width="923" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/d3e04ba7-c24c-496e-a003-e57e7113e096">&nbsp;

#### To view nelist :
```
cd /home/aryankumar/OpenLane/designs/pes_se_M/runs/RUN_2023.10.30_21.51.12/results/synthesis
gedit pes_se_M.v
```

<img width="922" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/4a28134b-b554-4205-ae9a-deb681272316">&nbsp;

#### To view the report :
```
cd /home/aryankumar/OpenLane/designs/pes_se_M/runs/RUN_2023.10.30_21.51.12/reports/synthesis
gedit 1-synthesis.AREA_0.stat.rpt
```

<img width="925" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/af7ecf1d-ae83-44fa-ad70-13b015cbcc19">&nbsp;

#### Steps to perform Floorplanning and Placement :

```
run_floorplan
```

<img width="923" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/21641473-aa94-42a9-8666-73af726bb82b">&nbsp;

#### To view the floor planning in magic :

```
cd /home/aryankumar/OpenLane/designs/pes_se_M/runs/RUN_2023.10.30_21.51.12/results/floorplan
magic -T /home/aryankumar/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_se_M.def &
```

<img width="924" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/59af4a20-4386-4a4d-9d0a-02b5577a9674">&nbsp;

<img width="924" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/dddd1161-6b9f-4092-9b38-b9d11472e31c">&nbsp;

#### Steps To perform placement :

```
run_placement
```

<img width="924" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/b3cb2bdc-7329-4755-83f0-e093c10318ed">&nbsp;

#### To View the Placement In Magic :

```
cd /home/aryankumar/OpenLane/designs/pes_se_M/runs/RUN_2023.10.30_21.51.12/results/placements
magic -T /home/aryankumar/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_se_M.def &
```

<img width="924" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/38901eea-576f-4bb3-aac8-95a1176b7649">&nbsp;

<img width="924" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/687e8c2e-d185-4bae-adaa-07e0783fe84d">&nbsp;

#### Steps To Perform Clock Tree Synthesis :

```
run_cts
```

<img width="921" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/1bd9d742-cce3-4517-9676-7b7974608c19">&nbsp;

#### To View the cts Reports :

```
cd /home/aryankumar/OpenLane/designs/pes_se_M/runs/RUN_2023.10.30_21.51.12/logs/cts
gedit 18-cts_sta.log
```

<img width="401" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/61160637-c55c-4386-92fe-114c34c23824">&nbsp;

<img width="393" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/c7274beb-bb11-4b25-953a-d17048d38cd6">&nbsp;

<img width="925" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/92349d34-7225-420e-b1f1-95ed0f07dc4b">&nbsp;

#### Steps To Perform Routing :

```
run_routing
```

<img width="923" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/311cb24a-c5d1-41e5-8548-0770bdef876e">&nbsp;

#### To View the Routing In Magic :

```
cd /home/aryankumar/OpenLane/designs/pes_se_M/runs/RUN_2023.10.30_21.51.12/results/routing
magic -T /home/aryankumar/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_se_M.def &
```

<img width="925" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/693f23e9-c311-4720-b326-4774c1b005e7">&nbsp;

<img width="925" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/d9332494-a96d-425c-9f1b-e8b9450b081f">&nbsp;

#### Final congestion report :

<img width="457" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/50f25e77-1def-4480-9e97-1ea5edb15e9d">&nbsp;

<img width="499" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/5019c545-cab6-4caa-a3e1-280e911b84ea">&nbsp;

<img width="428" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/2ebf8d91-3c7a-4816-9e9a-c7b2377312b6">&nbsp;







