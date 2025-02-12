# Traffic Light Control System

This project is a traffic light control system(CMP07309) implemented using assembly language. The system controls the traffic lights at an intersection, ensuring smooth and efficient traffic flow.

## Project Structure

- `EMU_Traffic_control.asm`: The main assembly file containing the traffic light control logic and delay subroutines.

## Traffic Light Control Logic

The traffic light control system operates in a loop, cycling through different traffic light states with specified delays. The states are defined as follows:

- **Transition 1**: 2 Red and 2 Green (north and south are green)
- **Transition 2**: All 4 are Yellow (two will begin to move soon and two will stop moving soon)
- **Transition 3**: 2 Red and 2 Green (east and west are green)
- **Transition 4**: All 4 are Yellow (two will begin to move soon and two will stop moving soon)

## Delays

The system uses subroutines to introduce delays between state transitions. The delays are defined as follows:

- **2 seconds**: Initial delay and delay after all lights are red.
- **30 seconds**: Delay for yellow light transitions.
- **1 minute**: Delay for green light transitions.

