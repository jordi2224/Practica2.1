library IEEE;
use ieee.std_logic_1164.all;

entity Registro is
port (
	enable, reset_r : in std_logic;
	clk : in std_logic;
	entrada : in std_logic;
	overflow : out std_logic;
	salidas : out std_logic_vector (8 downto 0)
	);
end Registro;

architecture behavioural of Registro is

component Dem1a8 port (
	a : in std_logic;
	sel : in std_logic_vector (3 downto 0);
	salidas : out std_logic_vector (8 downto 0)
	);
end component;

component 

end component;

component

end component;

begin






end behavioural;