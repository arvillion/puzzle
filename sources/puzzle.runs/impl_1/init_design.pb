
p
Command: %s
53*	vivadotcl2?
+link_design -top top -part xc7a100tfgg484-12default:defaultZ4-113h px? 
g
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_12default:defaultZ12-437h px? 
j
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_12default:defaultZ12-434h px? 
?
-Reading design checkpoint '%s' for cell '%s'
275*project2T
@c:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/clk_25m/clk_25m.dcp2default:default2
clk_25m2default:defaultZ1-454h px? 
?
-Reading design checkpoint '%s' for cell '%s'
275*project2T
@c:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/img_mem/img_mem.dcp2default:default2$
imc_inst/img_mem2default:defaultZ1-454h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
2812default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2017.42default:defaultZ1-479h px? 
W
Loading part %s157*device2$
xc7a100tfgg484-12default:defaultZ21-403h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
?
LRemoving redundant IBUF, %s, from the path connected to top-level port: %s 
35*opt2-
clk_25m/inst/clkin1_ibufg2default:default2

I_clk_100M2default:defaultZ31-35h px? 
?
?Could not create '%s' constraint because net '%s' is not directly connected to top level port. '%s' is ignored by %s but preserved for implementation tool.
528*constraints2 
IBUF_LOW_PWR2default:default2%
clk_25m/clk_in12default:default2 
IBUF_LOW_PWR2default:default2
Vivado2default:default2o
YC:/Users/Arv/puzzle/puzzle.runs/impl_1/.Xil/Vivado-10108-DESKTOP-VV69JL5/dcp3/clk_25m.edf2default:default2
3022default:default8@Z18-550h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2\
Fc:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/clk_25m/clk_25m_board.xdc2default:default2"
clk_25m/inst	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2\
Fc:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/clk_25m/clk_25m_board.xdc2default:default2"
clk_25m/inst	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2V
@c:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/clk_25m/clk_25m.xdc2default:default2"
clk_25m/inst	2default:default8Z20-848h px? 
?
%Done setting XDC timing constraints.
35*timing2V
@c:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/clk_25m/clk_25m.xdc2default:default2
572default:default8@Z38-35h px? 
?
Deriving generated clocks
2*timing2V
@c:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/clk_25m/clk_25m.xdc2default:default2
572default:default8@Z38-2h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
get_clocks: 2default:default2
00:00:102default:default2
00:00:112default:default2
1144.8952default:default2
552.8872default:defaultZ17-268h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2V
@c:/Users/Arv/puzzle/puzzle.srcs/sources_1/ip/clk_25m/clk_25m.xdc2default:default2"
clk_25m/inst	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2N
8C:/Users/Arv/puzzle/puzzle.srcs/constrs_1/new/puzzle.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2N
8C:/Users/Arv/puzzle/puzzle.srcs/constrs_1/new/puzzle.xdc2default:default8Z20-178h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
112default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px? 
]
%s completed successfully
29*	vivadotcl2
link_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2!
link_design: 2default:default2
00:00:182default:default2
00:00:192default:default2
1145.0232default:default2
913.0202default:defaultZ17-268h px? 


End Record