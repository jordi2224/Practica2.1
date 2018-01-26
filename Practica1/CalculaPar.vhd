library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CalculaPar is
  port (
    entrada : in  std_logic_vector(8 downto 0);
    salida  : out std_logic
	 );

end CalculaPar;
 
architecture behavioural of CalculaPar is
begin


salida <= ((((((((entrada(8) xor entrada(0)) xor entrada(1)) xor entrada(2)) xor entrada(3)) xor entrada(4)) xor entrada(5)) xor entrada(6))  xor entrada(7)); 


end behavioural;