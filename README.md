# Neural IK Humanoid Robotic Arm

![Robot Overview](robot_overview.png)

## Overview

This repository presents a lightweight 6-DOF humanoid robotic arm integrating:

- Neural-network-based inverse kinematics
- PID optimization using GA, PSO, and HBA
- MATLAB / Simscape Multibody modeling
- Real-time embedded implementation using Teensy 4.1
- Experimental validation on physical hardware

The project was developed as part of a research study on intelligent and affordable humanoid manipulation systems.

---

## Features

- 6-DOF anthropomorphic robotic arm
- Lightweight 3D-printed structure
- Neural inverse kinematics
- Zone-based workspace segmentation
- Forward and inverse kinematics
- PID optimization using metaheuristic algorithms
- Simscape Multibody simulation
- Real-time embedded control
- Experimental trajectory tracking

---

## Repository Structure

```text
Neural-IK-Humanoid-Robotic-Arm/
│
├── kinematics/
├── matlab_files/
├── nn_training/
├── control_optimization/
├── README.md
├── LICENSE
└── .gitignore
```

---

## Folder Description

### kinematics/
Forward and inverse kinematics implementation and symbolic derivation.

### matlab_files/
MATLAB scripts for simulation, workspace generation, and analysis.

### nn_training/
Neural-network training scripts and pretrained inverse kinematics models.

### control_optimization/
PID tuning using:
- Genetic Algorithm (GA)
- Particle Swarm Optimization (PSO)
- Honey Badger Algorithm (HBA)

---

## Neural Inverse Kinematics

The inverse kinematics problem is solved using a zone-based neural network architecture trained on a large workspace dataset generated using forward kinematics.

Key characteristics:
- Workspace segmentation into multiple regions
- Dedicated neural network for each zone
- Real-time joint prediction
- Improved convergence and accuracy

---

## Simulation and Control

The framework integrates:
- MATLAB
- Simulink
- Simscape Multibody

for:
- Dynamic simulation
- Workspace analysis
- PID optimization
- Motion validation

---

## Experimental Validation

The robotic arm was experimentally validated using:
- Real-time trajectory tracking
- Joint-level control
- Embedded implementation using Teensy 4.1

---

## Software Requirements

- MATLAB R2023b
- Simulink / Simscape Multibody
- MATLAB Deep Learning Toolbox
- MATLAB System Identification Toolbox
- Arduino IDE 2.3

---

## Citation

If you use this work, please cite:

```bibtex
@article{
}
```

---

## License

This project is licensed under the MIT License.

---

## Contact

Mostafa Mahmoud Elsayed  
Faculty of Engineering – Mechatronics Department  

Email: mustafa.mahmoud@feng.bu.edu.eg
