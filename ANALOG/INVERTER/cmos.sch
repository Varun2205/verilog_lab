v {xschem version=3.1.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
B 2 910 -440 1710 -40 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10e-6
divx=5
subdivx=1
node=vin
color=7
dataset=0
unitx=u
}
B 2 910 -860 1710 -460 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10e-6
divx=5
subdivx=1
node=vout
color=8
dataset=0
unitx=u
}
N 210 -220 210 -120 {
lab=Vin}
N 250 -190 250 -150 {
lab=Vout}
N 140 -170 210 -170 {
lab=Vin}
N 250 -170 310 -170 {
lab=Vout}
N 250 -90 250 -60 {
lab=GND}
N 250 -300 250 -250 {
lab=#net1}
N 250 -220 290 -220 {
lab=#net1}
N 290 -270 290 -220 {
lab=#net1}
N 250 -270 290 -270 {
lab=#net1}
N 250 -120 290 -120 {
lab=GND}
N 290 -120 290 -80 {
lab=GND}
N 250 -80 290 -80 {
lab=GND}
N 250 -390 320 -390 {
lab=#net1}
N 250 -390 250 -300 {
lab=#net1}
N 320 -330 320 -310 {
lab=GND}
N 130 -110 130 -90 {
lab=GND}
N 130 -170 140 -170 {
lab=Vin}
N 80 -170 130 -170 {
lab=Vin}
N 310 -170 400 -170 {
lab=Vout}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 230 -220 0 0 {name=M1
W=1
L=0.15
nf=1
mult=1
ad=\{int((nf+1)/2)*W/nf*0.29\}
pd=\{2*int((nf+1)/2)*(W/nf+0.29)\}
as=\{int((nf+2)/2)*W/nf*0.29\}
ps=\{2*int((nf+2)/2)*(W/nf+0.29)\}
nrd=\{0.29/W\}
nrs=\{0.29/W\}
model=pfet_01v8
spiceprefix=X
}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 230 -120 0 0 {name=M2
W=1
L=0.15
nf=1 
mult=1
ad=\{int((nf+1)/2)*W/nf*0.29\}
pd=\{2*int((nf+1)/2)*(W/nf+0.29)\}
as=\{int((nf+2)/2)*W/nf*0.29\}
ps=\{2*int((nf+2)/2)*(W/nf+0.29)\}
nrd=\{0.29/W\}
nrs=\{0.29/W\}
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} 130 -140 0 0 {name=Vin value="PULSE(0 1.8 0 1n 1n 1u 2u)"}
C {vsource.sym} 320 -360 0 0 {name=VDD value=1.8}
C {gnd.sym} 320 -310 0 0 {name=l1 lab=GND}
C {gnd.sym} 130 -90 0 0 {name=l2 lab=GND}
C {gnd.sym} 250 -60 0 0 {name=l3 lab=GND}
C {ipin.sym} 80 -170 0 0 {name=p1 lab=Vin}
C {opin.sym} 400 -170 0 0 {name=p2 lab=Vout}
C {code_shown.sym} 65 -595 0 0 {name=s1 only_toplevel=false 
value="
.option numparam
.lib $PDK_ROOT/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 10u
.save all
.control
run
plot vin 
plot vout
write cmos.raw
.endc
.end

"}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/corner.sym} 550 -140 0 0 {name=CORNER only_toplevel=false corner=tt}
C {capa.sym} 370 -140 0 0 {name=C1
m=1
value=25p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 370 -110 0 0 {name=l4 lab=GND}
