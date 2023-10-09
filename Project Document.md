# **Team Members**

* John Akujobi
* LNU Sukman Singh

# **Inputs:**

1. **Farthing (0.25d)** :
   * Lowest value input to the vending machine.
2. **Ha'penny (0.5d)** :
   * Another coin input to the vending machine.
3. **Penny (1d)** :
   * The highest value coin input to the vending machine.
4. **Raw Clock Input (CLK)** :
   * This is the clock signal for the state machine.
   * It will be passed through debouncer.sv
   * Connected to KEY0
   * Connects into CLK_deb
5. **Reset Input (RES)** :
   * This is an asynchronous reset signal that can reset the total back to zero.

# **Outputs:**

1. **Rotten Tomato Dispense Signal** :

   * This signal is activated when the vending machine dispenses a rotten tomato.
2. **Change Dispense Signals** :

   * These signals are activated when the vending machine dispenses change in the form of farthings and ha'pennies.
3. **Current State Display** :

   * This is a 7-segment display showing the current amount of money in the machine (in farthings).
4. **Change Display** :

   * This is another 7-segment display showing the amount of change dispensed by the machine (in dollars).
5. **State Indicator LEDs** :

   * These LEDs indicate the current state of the machine.

# Assumptions

gg


# States Required


# State Transition Diagram


# State Transition / Output Table


# Required System Verilog Modules
