# PhotoVoltaics

A paper about this library was published at the [Modelica Conference 2019](http://www.ep.liu.se/ecp/157/004/ecp19157004.pdf).

Modelica library for the simulation of photo voltaic cells, modules and plants. The library provides:
 - Simple cell models based on one diode and a irradiance dependent current source including temperature dependence of the open circuit voltage and the short circuit current
 - Simple symmetric modules and non-symmetric module including shading of cells
 - Simple symmetric plant
 - Solar pyramid model
 - Cell, module and plant parameters can be taken directly from manufacturer data sheets
 - Data of commercial modules stored in Modelica Records for convenient investigations
 - Analytical irradiance model without weather conditions
 - Single and three phase quasi static converters
 - Three phase transient converter
 - Maximum power tracker based on continuous voltage regulation
 - Linear, symmetric and chargable battery model, parameterized by cut off voltage, charge voltage, energy

![PhotoVoltaics library](https://github.com/christiankral/PhotoVoltaics/blob/master/PhotoVoltaics/Resources/Images/SimpleModuleMPDC.png?raw=true)

# Application Examples

## Phileas Rover

The maximum power harvest of a solar pyramid, which may be applicable to the [Phileas Rover](http://oewf.org/en/polares-science/phileas-rover/) of the [Austrian Space Forum, OEWF](http://oewf.org/en/), can be investigated by the PhotoVoltaics library.

![Phileas Rover](http://oewf.org/wp-content/uploads/2014/08/aouda-phileas-santek_medium-225x300.jpg "Phileas Rover")
Image source: [OEWF](http://oewf.org/wp-content/uploads/2014/08/aouda-phileas-santek_medium-225x300.jpg)

## TGM Photovoltaic Power Plants

Actual irradiance and electric power measurement data of the TGM power plants in [Vienna](http://www.openstreetmap.org/way/233509248) are provided in the PhotoVoltaics_TGM library. Measurements and simulation results can be compared by the provided example models. The PhotoVoltaics_TGM library relies on the [Buildings library](https://github.com/lbl-srg/modelica-buildings).

![TGM](https://github.com/christiankral/PhotoVoltaics/blob/master/PhotoVoltaics/Resources/Images/TGM_Comax_Trina.jpg?raw=true)

# License

The Modelica code of the PhotoVoltaics library, the images and the measurement data of the TGM are released under the [BSD 3-clause license](LICENSE.md). 

The package also contains weather data of Vienna retrieved from [EnergyPlus](https://energyplus.net/weather-location/europe_wmo_region_6/AUT//AUT_Vienna.Schwechat.110360_IWEC). The data of EnergyPlus are distributed under the [EnergyPlus Licensing](https://energyplus.net/licensing) conditions.

# Development and contribution

The library was developed during a Diploma project at the Technical Engineering College, [TGM](http://www.tgm.ac.at), Wexstraße 19-23, 1200 Vienna, Austria. Library authors are  Jovan Brkic, Muaz Ceran, Mohamed Elmoghazy, Ramazan Kavlak, and [Christian Kral](http://christiankral.net).

The three phase transient multi phase converter was contributed by Luiz Bueno, RWTH Aachen, Germany.

# Contact

e-mail: dr.christian.kral(at)gmail.com
