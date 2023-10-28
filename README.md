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

<img width="924" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/df6f1ea9-5cb1-4564-8461-1672f659f52b">

#### To view nelist :
```
cd /OpenLane/designs/pes_se_M/runs/RUN_2023.10.25_03.10.42/results/synthesis
gedit pes_se_M.v
```

<img width="924" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/320061bc-17f0-4e7a-8d47-f096b3d20a2d">

#### To view the report :
```
cd /OpenLane/designs/pes_se_M/runs/RUN_2023.10.25_03.10.42/results/reports/synthesis
gedit 1-synthesis.AREA_0.stat.rpt
```

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/6164b7eb-6da3-4ded-8803-a3a82bc7ceda)

#### Steps to perform Floorplanning and Placement :

```
run_floorplan
```

<img width="925" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/e1115cf6-f26c-4314-9a0f-126153006fdf">

#### To view the floor planning in magic :

```
cd /OpenLane/designs/pes_se_M/runs/RUN_2023.10.25_03.10.42/results/floorplan
magic -T /OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_se_M.def &
```

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/b61838ea-bd29-4393-b539-1d68129d7185)

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/34fc1185-3138-4d0a-b460-07fb41c456c6)

#### Steps To perform placement :

```
run_placement
```

<img width="927" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/8f46bc12-4bf6-4c97-87d1-fdfa73ca3d45">

#### To View the Placement In Magic :

```
cd /OpenLane/designs/pes_se_M/runs/RUN_2023.10.25_03.10.42/results/placement
magic -T /OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_se_M.def &
```

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/00b53fea-2fc2-43f8-af78-7fc9d4b638f8)

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/2590a6c0-0930-4eea-a123-ad30cbf3c2b0)

#### Steps To Perform Clock Tree Synthesis :

```
run_cts
```

<img width="959" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/29fc91da-3211-4aa5-8210-54a0c6c6acb3">

#### Steps To Perform Routing :

```
run_placement
```

<img width="955" alt="image" src="https://github.com/FF-Industries/pes_se_M/assets/136846161/a462e95e-5cba-4039-80b1-2ed3f46e5323">

#### To View the Routing In Magic :

```
cd /OpenLane/designs/pes_se_M/runs/RUN_2023.10.25_03.10.42/results/routing
magic -T /OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def pes_se_M.def &
```

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/6235f21c-8d41-4b26-94c1-025281a97f2a)

![image](https://github.com/FF-Industries/pes_se_M/assets/136846161/340979c0-f5b0-4ee0-91cd-2b094728643c)
