# Project Breakdown


**1. Understand the Project Requirements**

* Read and comprehend the project specifications, including the functionality, inputs, outputs, and constraints.

**2. Team Formation**

* Meet with your partner (as assigned or chosen) to discuss roles and responsibilities within the team.

**3. Preliminary Design (Due: October 3, before noon)**

* Document team members' names.
* Define the list of inputs and outputs for your vending machine.
* Make any necessary assumptions based on the project requirements.
* Determine the states required and the number of flip-flops needed.
* Create a state transition diagram to visualize the vending machine's behavior.
* Develop a state transition/output table to define the outputs for each state.
* List the required SystemVerilog modules with their inputs and outputs.
* Explain the encoding scheme for inputs like coins.

**4. SystemVerilog Implementation**

* Start creating the structural SystemVerilog design for your vending machine.
* Implement the negative-edge triggered D flip-flop and JK flip-flop modules provided in the project description.
* Develop the debouncer module for handling button inputs.
* Design the logic for the vending machine based on your preliminary design.
* Ensure that the code is well-commented and organized.

**5. DE10-Lite Implementation**

* Connect your SystemVerilog modules to the DE10-Lite board's inputs and outputs.
* Verify that the connections are correctly established.
* Test individual components, including the coin slot, state transition logic, and display modules.

**6. Testing**

* Conduct unit testing for each module to ensure they work as expected.
* Verify the operation of the state memory, input encoder, next-state logic, and output logic.
* Test the 7-segment display decoders to ensure they correctly display values.
* Utilize the debouncer to handle button inputs and verify its functionality.

**7. Project Demonstration (Scheduled during October 10-12)**

* Be prepared to demonstrate your working vending machine during your scheduled lab section.
* Ensure that your project functions correctly and meets all requirements.
* Be ready to explain your design and answer questions from your instructor.

**8. Final Design Video Report (Due: October 15, before midnight)**

* Create a comprehensive report that includes all project details.
* Provide an abstract and introduction to the project.
* Explain the theory behind your design.
* Describe the procedures you followed, including testing.
* Present the results and analysis of your project.
* Conclude with insights and suggestions for improvement.
* Ensure proper formatting, spelling, grammar, and inclusion of quality figures and tables.
* Include copies of your final SystemVerilog source files in an appendix.
