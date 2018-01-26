library IEEE;
use ieee.std_logic_1164.all;

entity Dem1a8 is 
port (
		a : in std_logic;
		sel : in std_logic_vector (3 downto 0);
		salidas : out std_logic_vector (8 downto 0)
);
end Dem1a8;

architecture behavioural of Dem1a8 is

begin

	process (sel, a)
	begin
		case sel is

			when "0000" =>
				salidas (0) <= a;
			when "0001" =>
				salidas (1) <= a;
			when "0010" =>
				salidas (2) <= a;
			when "0011" =>
				salidas (3) <= a;
			when "0100" =>
				salidas (4) <= a;
			when "0101" =>
				salidas (5) <= a;
			when "0110" =>
				salidas (6) <= a;
			when "0111" =>
				salidas (7) <= a;
			when "1000" =>
				salidas (8) <= a;
			when others =>
				salidas <= "000000000";
		end case;
	end process;
end behavioural;
	