from numpy import *
from scipy import *
from pyfmi import load_fmu
from pymodelica import compile_fmu
from pylab import *

# Simulate simple cell example
fmu = compile_fmu("PhotoVoltaics_TGM.TGM_Comax_Analytical_OneYear","PhotoVoltaics_TGM.mo")
model = load_fmu(fmu)
opts = model.simulate_options()
opts["ncp"] = 3153600
opts["solver"] = "Radau5ODE"
res= model.simulate(final_time=31536000,options=opts)

power=res['powerSensor.power']
time=res['time']
figure(1,figsize=(4,3))
rc('text', usetex=True)
rc('font', family='serif')
plot(time,powre)
xlabel('$t$\,(s)')
ylabel('$p$\,(W)')
subplots_adjust(left=0.2, right=0.95, top=0.95, bottom=0.15)
grid(True)

# 
