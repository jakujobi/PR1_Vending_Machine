// Authors:	Kayleigh Humphrey, LNU Sukhman Singh, John Akujobi
// Date: 	October, Fall, 2023
// Name:   	statelogic
// Filename: statelogic.sv 

/** Description
 * 	The module `statelogic` implements the state logic of a vending machine.
 * 	It takes in the current state `s` and the input `y` and outputs the next state `d`.
 *  It uses the Next State Logic equations obtained through K-maps from the State Transition Table.

 *
 * 	s The current state of the vending machine represented as a 4-bit vector.
 *	y The input to the vending machine represented as a 2-bit vector.
 * 	d The next state of the vending machine represented as a 4-bit vector.
 */
module statelogic(
	input logic s[3:0],	//current state of the vending machine
	input logic y[1:0], 	//encoded input to the vending machine
	output logic d[3:0]		//next state of the vending machine
);

assign d[0] = (
	(	y[0] 	& 	~y[1] 	& 	~s[0] 	& 	~s[1] 	& 	~s[2] 	& 	~s[3] ) | 
	(  ~y[0] 	& 	~y[1] 	& 	 s[0] 	& 	~s[2] 	& 	~s[3]	) | 
	( 	y[1] 	& 	 s[0] 	& 	~s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	~y[1] 	& 	~s[0] 	& 	s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	~y[1]  	& 	~s[1] 	& 	s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	~y[1] 	& 	 s[0] 	& 	s[1] 	& 	s[2] 	& 	~s[3]	) | 
	(	y[1] 	& 	~s[0] 	& 	 s[1] 	& 	s[2] 	& 	~s[3]	) | 
	( 	y[1] 	& 	~s[0] 	& 	~s[1] 	& 	~s[2] 	& 	s[3]	)
);

assign d[1] = (
	(	y[0] 	& 	~y[1] 	& 	s[0] 	& 	~s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	(	~y[0] 	& 	y[1] 	& 	~s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	(	~y[0] 	& 	~y[1] 	& 	s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	(	~y[1] 	& 	~s[0] 	& 	s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	~s[0] 	& 	s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	y[1] 	& 	s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	~y[1] 	& 	s[1] 	& 	s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	s[0] 	& 	s[1] 	& 	s[2] 	& 	~s[3]	) | 
	(	~y[0] 	& 	y[1] 	& 	~s[1] 	& 	s[2] 	& 	~s[3]	) | 
	(	~y[0] 	& 	y[1] 	& 	~s[0] 	& 	s[1] 	& 	s[2] 	& 	~s[3]	) | 
	(	y[0] 	& 	y[1] 	& 	~s[0] 	& 	~s[1] 	& 	~s[2] 	& 	s[3]	)
);

assign d[2] = (
	( 	y[0] 	& 	y[1] 	& 	~s[2] 	& 	~s[3] 	& 	~s[1]	) | 
	( 	y[0]	& 	s[0] 	& 	s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	( 	y[1] 	& 	s[1] 	& 	~s[2] 	& 	~s[3]	) | 
	( 	~y[1] 	& 	~s[0] 	& 	~s[1] 	& 	s[2] 	& 	~s[3]	) | 
	( 	~y[0] 	& 	~s[0] 	& 	~s[1] 	& 	s[2] 	& 	~s[3]	) | 
	( 	y[0] 	& 	y[1] 	& 	s[0] 	& 	s[2] 	& 	~s[3]	) | 
	(	 y[1] 	& 	s[0] 	& 	s[1] 	& 	s[2] 	& 	~s[3]	) | 
	( 	y[0] 	& 	y[1] 	& 	s[1] 	& 	s[2] 	& 	~s[3]	) | 
	( 	y[0] 	& 	~s[0] 	& 	~s[1] 	& 	~s[2] 	& 	s[3]	) | 
	( 	y[1] 	& 	~s[0] 	& 	~s[1] 	& 	~s[2] 	& 	s[3]	)
);

assign d[3] = (
	(	y[0] 	& 	y[1] 	& 	~s[0] 	& 	~s[1] 	& 	s[2] 	& 	~s[3]	)
);

endmodule