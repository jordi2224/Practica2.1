library IEEE;
use ieee.std_logic_1164.all;


entity Practica1 is 
port (
	UART : in std_logic;
	salidas : out std_logic_vector (7 downto 0);
	led_par : out std_logic
	);
end Practica1;

architecture behavioural of Practica1 is

	component ContadorT  port(
	reset_n : in  std_logic;
   clk     : in  std_logic;
   enable : in std_logic;
   overflow  : out std_logic
	);
	end component;
	
	component ContadorTm  port(
	reset_n : in  std_logic;
   clk     : in  std_logic;
   enable : in std_logic;
   overflow  : out std_logic
	);
	end component;
	
	component Estados port(
	reset_s, en1, en2, ov1, ov2, clk : in std_logic;
	UART : in std_logic;
	salidas : out std_logic_vector (7 downto 0);
	led_par : out std_logic
	);
	end component;

	component CalculaPar port(
	entrada : in  std_logic_vector(8 downto 0);
   salida  : out std_logic
	);
	end component;
	
	component Registro port (
	enable, reset_r : in std_logic;
	clk : in std_logic;
	entrada : in std_logic;
	overflow : out std_logic;
	salidas : out std_logic_vector (8 downto 0)
	);
	end component;
	
	
begin







end behavioural;