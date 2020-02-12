N0 %
N1 GenericDrill
N2 G40 G69 G80 G20 (Various Modal Cancels / inches mode active)
N3 #100 = 1 (Spot Drill Tool Number w/o decimal)
N4 #101 = 2 (Drill Tool Number w/o decimal)
N5 #102 = 0.578 (Drill Diameter with decimal)
N6 #103 = 54 (Pick Off Offset Number 54,55,56,etc. No Decimals)
N7 #104 = 0. (Z Level of start of hole with decimal)
N8 #105 = 1. (First Hole X Position)
N9 #106 = 1. (First Hole Y Position)
N10 (IF NO FURTHER HOLES, input "50" into Further Position Fields)
N11 #107 = 2. (Second Hole X Position)
N12 #108 = 2. (Second Hole Y Position)
N13 #109 = 3. (Third Hole X Position)
N14 #110 = 3. (Third Hole Y Position)
N15 #111 = 4. (Fourth Hole X Position)
N16 #112 = 4. (Fourth Hole Y Position)
N17 #113 = 5. (Fifth Hole X Position)
N18 #114 = 5. (Fifth Hole Y Position)
N19 #116 = 1. (First Hole Depth)
N20 #117 = 2. (Second Hole Depth)
N21 #118 = 3. (Third Hole Depth)
N22 #119 = 4. (Fourth Hole Depth)
N23 #120 = 5. (Fifth Hole Depth)
N24 (Do Not Edit Past This Line)
N25 (==================================)
N26 IF [#102 GT 0.75] THEN #3000 = 6. (Tool Too Wide, Consider Bore Milling)
N27 IF [#116 GT 7.0] THEN #3000 = 1. (First Hole Too Deep)
N28 IF [#117 GT 7.0] THEN #3000 = 2. (Second Hole Too Deep)
N29 IF [#116 GT 7.0] THEN #3000 = 3. (Third Hole Too Deep)
N30 IF [#116 GT 7.0] THEN #3000 = 4. (Fourth Hole Too Deep)
N31 IF [#116 GT 7.0] THEN #3000 = 5. (Fifth Hole Too Deep)
N32 IF [#102 LE 0.25] THEN #121 = 0.025 (Sets Q Value For Drilling)
N33 IF [0.5 GE #102 GT 0.25] THEN #121 = 0.05 (Sets Q Value For Drilling)
N34 IF [#102 GT 0.5] THEN #121 = 0.075 (Sets Q Value For Drilling)
N35 IF [#102 LE 0.25] THEN #122 = 0.2 (Sets Feed Rate For Drilling)
N36 IF [0.5 GE #102 GT 0.25] THEN #122 = 0.4 (Sets Feed Rate For Drilling)
N37 IF [#102 GT 0.5] THEN #122 = 0.6 (Sets Feed Rate For Drilling)
N38 IF [#102 LE 0.25] THEN #123 = 500 (Sets Spindle Speed For Drilling)
N39 IF [0.5 GE #102 GT 0.25] THEN #123 = 300 (Sets Spindle Speed For Drilling)
N40 IF [#102 GT 0.5] THEN #123 = 200 (Sets Spindle Speed For Drilling)
N41 (Is the part Picked off?)
N42 M00
N43 (Is the part Picked off, Press Cycle Start To Continue?)
N44 M00
N45 (Is the Tool Length Set, Press Cycle Start To Continue?)
N46 M00
N47 (Is the Tool Numbers Correct, Press Cycle Start To Continue?)
N48 M00
N49 (Safety Goggles?, Press Cycle Start To Continue?)
N50 M00
N51 G0 G53 Z0.
N52 G0 G53 X0.
N53 G0 G53 Y0.
N54 T#100 M6
N55 G0 G#103 X#105 Y#106 S2000 M3
N56 G43 H#100 Z[#104 + 2]
N57 (Tip of Tool Should Be 2in Above Part)
N58 M00
N59 G81 X#105 Y#106 Z[#104 - 0.075] R[#104 + 0.2] F2.
N60 G0 G90 Z[#104 + 2]
N61 IF [#107 NE 50] GOTO85
N62 IF [#109 NE 50] GOTO88
N63 IF [#111 NE 50] GOTO91
N64 IF [#113 NE 50] GOTO94
N65 G0 G90 G53 Z0.
N66 G0 X0.
N67 G0 Y0.
N68 M5
N69 T#101 M6
N70 G0 G#103 X#105 Y#106 S#123 M3
N71 G43 H#101 Z[#104 + 2]
N72 (Tip of Tool Should Be 2in Above Part)
N73 M00
N74 G83 X#105 Y#106 Z[#104 - #116] R[#104 + 0.2] F#122 Q#121
N75 G0 G90 Z[#104 + 2]
N76 IF [#107 NE 50] GOTO97
N77 IF [#109 NE 50] GOTO100
N78 IF [#111 NE 50] GOTO103
N79 IF [#113 NE 50] GOTO106
N80 G0 G90 G53 Z0.
N81 G0 X0.
N82 G0 Y0.
N83 M5
N84 M30
N85 G81 X#107 Y#108 Z[-0.075] R[#104 + 0.2] F2.
N86 G0 G90 Z[#104 + 2]
N87 GOTO62
N88 G81 X#109 Y#110 Z[-0.075] R[#104 + 0.2] F2.
N89 G0 G90 Z[#104 + 2]
N90 GOTO63
N91 G81 X#111 Y#112 Z[-0.075] R[#104 + 0.2] F2.
N92 G0 G90 Z[#104 + 2]
N93 GOTO64
N94 G81 X#113 Y#114 Z[-0.075] R[#104 + 0.2] F2.
N95 G0 G90 Z[#104 + 2]
N96 GOTO65
N97 G83 X#107 Y#108 Z[-#117] R[#104 + 0.2] F#122 Q#121
N98 G0 G90 Z[#104 + 2]
N99 GOTO77
N100 G83 X#109 Y#110 Z[-#118] R[#104 + 0.2] F#122 Q#121
N101 G0 G90 Z[#104 + 2]
N102 GOTO78
N103 G83 X#111 Y#112 Z[-#119] R[#104 + 0.2] F#122 Q#121
N104 G0 G90 Z[#104 + 2]
N105 GOTO79
N106 G83 X#113 Y#114 Z[-#120] R[#104 + 0.2] F#122 Q#121
N107 G0 G90 Z[#104 + 2]
N108 GOTO80
%
