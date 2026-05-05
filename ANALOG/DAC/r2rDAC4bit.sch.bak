v {xschem version=3.1.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 160 60 160 70 {
lab=GND}
N 280 60 280 70 {
lab=GND}
N 400 60 400 70 {
lab=GND}
N 520 60 520 70 {
lab=GND}
N 490 0 520 -0 {
lab=Vout}
N 400 -0 430 -0 {
lab=#net1}
N 370 0 400 -0 {
lab=#net1}
N 280 0 310 0 {
lab=#net2}
N 240 0 280 0 {
lab=#net2}
N 160 -0 180 0 {
lab=#net3}
N 160 -50 160 -0 {
lab=#net3}
N 280 -50 280 -0 {
lab=#net2}
N 400 -50 400 0 {
lab=#net1}
N 520 -50 520 -0 {
lab=Vout}
N 520 0 570 -0 {
lab=Vout}
N 400 -110 520 -110 {
lab=GND}
N 280 -110 400 -110 {
lab=GND}
N 160 -110 280 -110 {
lab=GND}
N 120 -110 160 -110 {
lab=GND}
N 100 -110 120 -110 {
lab=GND}
N 100 -110 100 -90 {
lab=GND}
C {res.sym} 160 30 0 0 {name=R1
value=20k
footprint=1206
device=resistor
m=1}
C {res.sym} 280 30 0 0 {name=R2
value=20k
footprint=1206
device=resistor
m=1}
C {res.sym} 400 30 0 0 {name=R3
value=20k
footprint=1206
device=resistor
m=1}
C {res.sym} 520 30 0 0 {name=R4
value=20k
footprint=1206
device=resistor
m=1}
C {res.sym} 210 0 1 0 {name=R5
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} 340 0 1 0 {name=R6
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} 460 0 1 0 {name=R7
value=10k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 160 70 0 0 {name=l1 lab=GND}
C {gnd.sym} 280 70 0 0 {name=l2 lab=GND}
C {gnd.sym} 400 70 0 0 {name=l3 lab=GND}
C {gnd.sym} 520 70 0 0 {name=l4 lab=GND}
C {isource.sym} 160 -80 0 0 {name=B0 value=I=\{Iref*V(b0)\}}
C {isource.sym} 280 -80 0 0 {name=B1 value=I=\{Iref*V(b1)\}}
C {isource.sym} 400 -80 0 0 {name=B2 value=I=\{Iref*V(b2)\}}
C {isource.sym} 520 -80 0 0 {name=B3 value=I=\{Iref*V(b3)\}}
C {gnd.sym} 100 -90 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 570 0 0 0 {name=l6 sig_type=std_logic lab=Vout}
C {code.sym} 740 -70 0 0 {name=s1 only_toplevel=true value="
.param Iref=100u

* Bit Sources 
* Format: PULSE(Vhigh Vlow Delay Rise Fall Width Period)
V0 b0 0 PULSE(1 0 0 1n 1n 5u 10u)
V1 b1 0 PULSE(1 0 0 1n 1n 10u 20u)
V2 b2 0 PULSE(1 0 0 1n 1n 20u 40u)
V3 b3 0 PULSE(1 0 0 1n 1n 40u 80u)

.control
  tran 10n 80u
  run
  plot v(Vout) title '4-bit DAC Success'
  plot v(b3)+4 v(b2)+3 v(b1)+2 v(b0)+1 title 'Input Bit Timing'
.endc
"}
C {lab_pin.sym} 150 170 0 0 {name=l7 sig_type=std_logic lab=b0
}
C {lab_pin.sym} 270 170 0 0 {name=l8 sig_type=std_logic lab=b1
}
C {lab_pin.sym} 410 170 0 0 {name=l9 sig_type=std_logic lab=b2
}
C {lab_pin.sym} 530 170 0 0 {name=l10 sig_type=std_logic lab=b3
}
