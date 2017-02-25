from numpy import *
from scipy import *
from pyfmi import load_fmu
from pymodelica import compile_fmu
from pylab import *

# Simulate simple cell example
fmu = compile_fmu("PhotoVoltaics.Examples.SimpleModuleShadow","PhotoVoltaics.mo")
model = load_fmu(fmu)
opts = model.simulate_options()
opts["ncp"] = 1000
res = model.simulate(final_time=1.0,options=opts)

v=res['module.v']
iGenerating=res['module.iGenerating']
figure(1,figsize=(4,3))
rc('text', usetex=True)
rc('font', family='serif')
plot(v,iGenerating)
xlabel('$v$\,(V)')
ylabel('$i$\,(A)')
subplots_adjust(left=0.2, right=0.95, top=0.95, bottom=0.15)
grid(True)

