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
|-- Kinematics/
|   |-- Armforward.m
|   `-- inverse6dof.m
|-- Workspace/
|   |-- ws6dof.m
|   `-- ws6dof_random.m
|-- matlab_files/
|   |-- ctraj6dof.m
|   |-- linedraw.m
|   `-- squareee.m
|-- nn_training/
|-- control_optimization/
|   |-- GA/
|   |-- Pso/
|   `-- HBA Code/
|-- robot_overview.png
|-- README.md
|-- LICENSE
`-- .gitignore
```

---

## Folder Description

### Kinematics/

Forward and inverse kinematics examples for the 6-DOF humanoid arm.

### Workspace/

Workspace generation scripts for grid-based and random joint sampling.

### matlab_files/

Trajectory generation and plotting scripts for line and closed-path motion.

### nn_training/

Jupyter notebooks for training the zone-based neural inverse-kinematics models.

### control_optimization/

PID tuning and simulation files using:

- Genetic Algorithm (GA)
- Particle Swarm Optimization (PSO)
- Honey Badger Algorithm (HBA)

---

## Software Requirements

- MATLAB R2023b or a compatible MATLAB release
- Simulink
- Simscape Multibody
- Control System Toolbox
- Global Optimization Toolbox
- Deep Learning Toolbox
- System Identification Toolbox
- Peter Corke Robotics Toolbox for MATLAB (`Link`, `SerialLink`, `SE3`, `transl`, `tr2rpy`)
- Arduino IDE 2.3 for embedded deployment

---

## Quick Start

From the repository root in MATLAB:

```matlab
addpath(genpath(pwd));
```

Run the forward-kinematics viewer:

```matlab
run('Kinematics/Armforward.m')
```

Run the inverse-kinematics target example:

```matlab
run('Kinematics/inverse6dof.m')
```

Run a trajectory example:

```matlab
run('matlab_files/linedraw.m')
```

For PID optimization, open the matching folder first so each script resolves its local `n.slx` model:

```matlab
cd('control_optimization/GA')
run('GA.m')
```

---

## Notes

- Kinematic link dimensions are expressed in millimeters.
- Joint angles are stored in radians for Robotics Toolbox calls and converted to degrees only for display, export, or servo offset data.
- The example scripts use `deg2rad(90)` for 90-degree end-effector Z rotations.
- Generated Simulink cache folders such as `slprj/` and compiled cache files such as `*.slxc` should not be committed.

---

## Citation

If you use this work, please cite:

```bibtex
@misc{mahmoud_neural_ik_humanoid_arm,
  author = {Mostafa Mahmoud Elsayed},
  title = {Neural IK Humanoid Robotic Arm},
  year = {2026},
  url = {https://github.com/MostafaMahmoud98/Neural-IK-Humanoid-Robotic-Arm}
}
```

Replace this placeholder with the final paper citation when publication details are available.

---

## License

This project is licensed under the MIT License.

---

## Contact

Mostafa Mahmoud Elsayed  
Faculty of Engineering - Mechatronics Department  

Email: mustafa.mahmoud@feng.bu.edu.eg
