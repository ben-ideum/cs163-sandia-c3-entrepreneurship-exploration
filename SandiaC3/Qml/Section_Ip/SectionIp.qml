import QtQuick 2.0

import "../General"
import ".."

Item {

    readonly property var fields: [landing, lt1, lt2, lt3, lt4, lt5, lt6, lt7, lt8]

    id: root

    anchors.fill: parent

    IpLanding
    {
        id: landing
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onGo: root.goTo(num)
    }

    IpPatentsPage
    {
        id: lt1
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        bodyText: "1.	 Bacteriophage Host-Range Expansion
2.	 Large Field of View, 3D X-ray Phase Contrast Imaging System
3.	 Automated Gloving System
4.	 Microfluidic Devices
5.	 Fabrication of Neural Interfaces using 3D Projection Micro-Stereolithography
6.	 Microscale Immune and Cell Analysis (MICA)
7.	 Rapid Automated Point-of-Care System (RapiDx)
8.	 Miniaturized Chemical Detectors for Point-of-Care Diagnosis
9.	 Sandia Decon Formulation for Mitigation and Decontamination of CBW Agents
10.	SpinDx™: Point-of-Care Diagnostics Using Centrifugal Microfluidics
11.	Automated Molecular Biology Platform
12.	Hyperspectral Imaging and Multivariate Curve Resolution
13.	Insulating Dielectrophoresis (iDEP)
14.	Miniature High-Voltage Power Supply and Miniature High-Voltage Controller
15.	Microfluidic Polymer Valves
16.	The µChemLab™: Bio Detector"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt2
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-2"

        bodyText: "1.	 HADES: High-Fidelity Adaptive Deception & Emulation System
2.	 Configuration Self-Scrubber for Xilinx Virtex-5QV FPGAs
3.	 Right-Size Dimple Evaluator v. 2.0
4.	 The Microgrid Design Toolkit
5.	 GCMS Data Wrangler
6.	 Automated Transfer Function Generator
7.	JavaCleaner
8.	 Encryption Engine"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt3
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-3"

        bodyText: "1.	Synthesis of Nanocrystalline Iron Nitrides Using Two-Step Reactive Milling Process
2.	 Configuration Self-Scrubber for Xilinx Virtex-5QV FPGAs
3.	 Silicon-Based Neutron Detector
4.	 Time-Encoded Imaging
5.	 Self-Shielding Flex-Circuit Drift Tube
6.	 Rapid Adaptive Zoom
7.	 Tunable Surface Plasmon Infrared Modulator
"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }


    IpPatentsPage
    {
        id: lt4
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-4"

        col1Text: "1.	  Synthesis of Nanocrystalline Iron Nitrides Using Two-Step Reactive Milling Process
2.	Microsystems Enabled Photovoltaics (MEPV)
3.	Ducted Fuel Injection for Soot Reduction
4.	Fluorescent Thallium Tracers
5.	Deployable Centralizers for Directional Drilling
6.	One-Pot Bioconversion of Distillers Grains to Advanced Biofuels
7.	  Control System for Active Damping of Inter-Area Oscillations
8.	Right-Size Dimple Evaluator v. 2.0
9.	Improved Method to Measure Glare and Reflected Solar Irradiance
10.	Enhanced Thin Film Solar
11.	SolidSense: Gas Analyzer on a Chip
12.	Ultra-Wide Bandgap Power Electronics
13.	The Microgrid Design Toolkit
14.	Solar Tracing Sensors for Maximum Solar Concentrator Efficiency
15.	Inherently Safe In-Situ Uranium Recovery
16.	TOPHAT™ for the Alignment & Focus of Heliostat Mirror Facets
17.	Nanoporous Al2O3 as a “Getter” for Volatile Radionuclides into Nanostructued Glass-Ceramic Waste Forms
18.	Microsphere Templated Gallium Nitride Growth and Liftoff
19.	Trojan Horse Project: Biorefinery in a Plant
20.	The Sandia Cooler
21.	pH Adjustment of Power Plant Cooling Water with Flue Gas/ Fly Ash
"
        col2Text: "22.	High Temperature Downhole Motor
23.	Solar Glare Hazard Analysis Tool (SGHAT)
24.	Efficient Hydrogen Sulfur Cycle Precursor for H2 Production
25.	Metal-Organic Frameworks for the Separation of O2 from Air
26.	Alternating Current Photovoltaic Building Block
27.	Diffraction: Enhanced Light Absorption of Solar Cells and Photodetectors
28.	SOFAST: Sandia Optical Fringe Analysis Slope Tool for Solar Mirror Characterization
29.	Packed Particle Bed Reactor
30.	Non-Invasive Energy Meter
31.	Molten Salt Heat Transfer Fluid (HTF)
32.	Advanced Forms of Activated Carbon
33.	Optimized Alumina Coagulants for Water Purification
34.	Startup Design Features for Supercritical Power Conversion Systems
35.	Fluorescent Optical Position Sensor
36.	TOPCAT Solar Cell Alignment & Energy Concentration Technology
37.	Intelligent Grid Technologies
38.	Polymer Membrane Separators for the Next-Generation of Energy-Water Systems
39.	Designer Catalysts for Next Generation Fuel Synthesis
40.	Gas Diffusion Electrodes for Fuel Cells
41.	Fluid Interface Position Optical Sensor
42.	Vibrational Energy Converters
"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt5
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-5"

        col1Text: "1.	Synthesis of Nanocrystalline Iron Nitrides Using Two-Step Reactive Milling Process
2.	Ducted Fuel Injection for Soot Reduction
3.	Configuration Self-Scrubber for Xilinx Virtex-5QV FPGAs
4.	Right-Size Dimple Evaluator v. 2.0
5.	Automated Gloving System
6.	Miniature Spring Performance Tester
7.	Non-Destructive Additive Manufacturing Characterization Coupon
8.	Dropkinson Bar
9.	Rotary-Cooled Solid-State Lighting
10.	High Speed, High Current Pulsed LED Driver
11.	SolidSense: Gas Analyzer on a Chip
12.	Silicon-Based Neutron Detector
13.	Self-protected, Low-temperature Nanosolder
14.	Thermal Compensating Optics Housing
15.	Digital Communication
16.	The Sandia Wave Reflector
17.	The Sandia Cooler
18.	Cryogenic Heating Stage
19.	FURI Camera
"
        col2Text: "20.	Zero-Power Radio Receiver
21.	Self-Shielding Flex-Circuit Drift Tube
22.	High Sensitivity, Environmentally Isolated Bearing Tester
23.	Variable Flow Exhaust Ventilation Cap for Local Exhaust Systems
24.	High Temperature Downhole Motor
25.	Monolithically Integrated Absolute Frequency Comb Laser System
26.	High Performance Dielectrics
27.	Rotating Eddy Current Probe for Detecting Cracks under Raised Fastener Heads
28.	Advanced Ultrasonic Device with In-Situ Height Adjustment for Improved Flaw Detection
29.	Packed Particle Bed Reactor
30.	Two-Sensor System for Absolute Age and Temperature History
31.	Portable Gas Leak Detection System
32.	Push Plate for Ball Grid Array Test Sockets
33.	Correlation Spectrometer
34.	Electrical Cable Testing by Pulse-Arrested Spark Discharge (PASD)
35.	X-ray Tube with Magnetic Electron Steering
36.	Sliding Pressure Control Valve for Pneumatic Hammer Drill
37.	Powder Dispersion System
"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt6
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-6"

        bodyText: "1.	Organic Glass for Radiation Detection
2.	Zero-Power Radio Receiver
3.	New Class of Plastic Scintillators
4.	Sandia Decon Formulation for Mitigation and Decontamination of CBW Agents
5.	Neutron Scatter Camera for Radiaton Detection
6.	Portable Gas Leak Detection System
7.	Hydroxyapatite Barriers for Radionuclide Containment
"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt7
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-7"

        col1Text: "1.	Hybrid Wide Range Detector Amplifier
2.	Microfluidic Devices
3.	Direct Detector for Terahertz Radiation
4.	SolidSense: Gas Analyzer on a Chip
5.	Silicon-Based Neutron Detector
6.	Self-protected, Low-temperature Nanosolder
7.	Microsphere Templated Gallium Nitride Growth and Liftoff
8.	Dual-Etalon Frequency-Comb Spectrometer
9.	The Sandia Wave Reflector
10.	Zero-Power Radio Receiver
11.	Self-Shielding Flex-Circuit Drift Tube
12.	Miniaturized Chemical Detectors for Point-of-Care Diagnosis
13. Monolithically Integrated Absolute Frequency Comb Laser System
14.	PC Board Mountable Corrosion Sensors
"
        col2Text: "15.	Embedded Fiber Optic Sensors (EFOS)
16.	Atomic Magnetometer
17.	Wireless Passive Radiation Sensor
18.	Latching Micro Optical Switch
19.	Two-Sensor System for Absolute Age and Temperature History
20.	Push Plate for Ball Grid Array Test Sockets
21.	Low Cost TiO2 Nanoparticles
22.	Fluid Level Monitoring Sensor
23.	Micro-Pyrolizer for Rapid Bio-Identification
24.	Semipermeable Membranes for Micromachined Silicon Surfaces
25.	Heterojunction for Multi-Junction Solar Cells
26.	Synthesis of Uniform Magnetic Nanoparticles
27.	Microfabricated Field Calibration Assembly
28.	High Efficiency Multiple-Junction Solar Cells
"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt8
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-8"

        col1Text: "1.	Synthesis of Nanocrystalline Iron Nitrides Using Two-Step Reactive Milling Process
2.	Fluorescent Thallium Tracers
3.	Organic Glass for Radiation Detection
4.	Multi-Functional Nanomaterials by Surfactant-Assisted Fabrication
5.	One-Pot Bioconversion of Distillers Grains to Advanced Biofuels
6.	Miniature Spring Performance Tester
7.	Non-Destructive Additive Manufacturing Characterization Coupon
8.	Enhanced Thin Film Solar
9.	Self-protected, Low-temperature Nanosolder
10.	New Class of Radiation Detection Materials
11.	Stress-Induced Nanofabrication
12.	Red-Emitting Phosphors for Solid-State Lighting
13.	Microsphere Templated Gallium Nitride Growth and Liftoff
"
        col2Text: "14.	Hybrid Scintillators for Neutron Discrimination
15.	Multifunctional Platelet Composites for Tin Whisker Mitigation
16.	High Performance Dielectrics
17.	Atomic Magnetometer
18.	Sandia Decon Formulation for Mitigation and Decontamination of CBW Agents
19.	NanoCoral High Surface Area Platinum Catalysts to Improve Fuel Cell Efficiency
20.	PLZT Nano-Precursors for High Energy Density Applications
21.	Weak-Link Capacitor
22.	Fiber-Optic Long-Line Position Sensor
23.	Electrochemical Solution Growth: Gallium Nitride Crystal Growth
24.	Separation of Polar Molecules
25.	High Accuracy Non-A/C Powered Leak Tester and Volume Calibrator
26.	Miniaturized Mass Spectrometer"

        onMenuClicked: sidebar.show()
        onBackClicked: root.goHome()
    }

    Sidebar
    {
        id: sidebar
        buttons: ["Intellectual Property", "Visual Patent Search", "Lab Experts"]
    }

    function goTo(num) {
        sidebar.activeArea = num
    }

    function goHome() {
        sidebar.activeArea = 0
    }
}
