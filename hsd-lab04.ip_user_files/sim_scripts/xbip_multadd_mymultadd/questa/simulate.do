onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xbip_multadd_mymultadd_opt

do {wave.do}

view wave
view structure
view signals

do {xbip_multadd_mymultadd.udo}

run -all

quit -force
