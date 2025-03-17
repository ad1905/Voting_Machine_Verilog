## Verilog Voting Machine
# Overview
The goal of this project is to implement a digital voting machine using Verilog HDL (Hardware Description Language). The system is designed to allow users to cast votes, display results, and manage the voting process accurately. The project includes several modules that work together to simulate a complete voting machine.

# Flowchart
![Flowchart](/flowchart.png)

# Components
This project consists of four Verilog modules:<br>
1. **Button Control Module**
2. **Mode Control Module**
3. **Vote Logger Module**
4. **Main Voting Machine Module**

# Output Waveform
![Output](assets/images/output.png)

# Description of Modules
1. **Button Control Module** <br>
  The Button Control Module is responsible for detecting user input from the voting buttons. It handles debouncing to eliminate errors caused by mechanical contact bounce. The key operations include:
  
  Debouncing: Ensures a button press is registered only once after it has been stable for a certain duration.
  Vote Logging: A vote is logged only if the button is pressed for a specific amount of time.
  Single Vote Detection: If the button is pressed for an extended period, only one vote is recorded, preventing multiple votes from being logged.
  
  Key Functionalities:
  * Debouncing to avoid false inputs.
  * Ensuring a vote is only recorded once per valid press.

2. **Mode Control Module** <br>
  The Mode Control Module governs the operation of the voting machine in different modes: Setup, Voting, and Result Display modes. This module handles:
  
  Mode Transitions: Manages when the system switches between different modes based on inputs.
  LED Control: The LEDs in the system are controlled based on the current mode:
  In Voting Mode, LEDs blink to indicate that a vote has been cast.
  In Tally Mode, LEDs light up to show the number of votes in binary representation.
  
  Key Functionalities:
  * Control of LEDs to signal mode transitions.
  * Voting Mode: LEDs blink for a second to confirm a vote.
  * Result Display Mode: LEDs display the number of votes in binary.
    
3. **Vote Logger Module** <br>
  The Vote Logger Module tracks and stores the votes cast during the voting period. It ensures votes are logged only if the system is in the correct mode (e.g., Voting Mode).
  
  Vote Logging: Updates the vote count for each candidate when a valid vote is detected.
  Reset Functionality: Resets the system at the start of each new voting session to ensure previous data doesn't interfere with the new session.
  
  Key Functionalities:
  * Logs votes only when in the voting mode.
  * Resets the vote count when required.
    
4. **Main Voting Machine Module** <br>
  The Main Voting Machine Module is the heart of the system. It integrates all the other modules (Button Control, Mode Control, and Vote Logger). It manages the interaction between the modules based on the current mode of operation.
  
  Mode Coordination: Coordinates the transitions between different modes (Setup, Voting, and Result Display).
  Voting Process: Orchestrates the detection of button presses, vote logging, and mode switching.
  
  Key Functionalities:
  * Controls the overall workflow by integrating the Button Control, Mode Control, and Vote Logger.
  * Ensures that votes are cast and counted accurately.
  * Displays results after the voting session ends.
    
# Simulation and Output
**Simulation Tool:** Icarus Verilog is used to compile and simulate the Verilog code.
**Waveform Viewer**: GTKWave is used to visualize the waveform outputs during simulation to ensure the correct functioning of the voting machine.
