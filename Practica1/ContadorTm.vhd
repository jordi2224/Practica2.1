library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ContadorTm is
  port (
    reset_n : in  std_logic;
    clk     : in  std_logic;
    enable : in std_logic;
    overflow  : out std_logic
	 );

end ContadorTm;

architecture behavioural of ContadorTm is  
  signal contador : unsigned(11 downto 0):= to_unsigned(0 , 12);
  signal salida_i : std_logic;
begin  -- architecture behavioural

  process (clk, reset_n) is
  begin  -- process

    
    if reset_n = '0' then -- asincrono
      contador <= to_unsigned(1302, 12);
      salida_i <= '0';
	 elsif clk'event and clk = '1'  then  -- rising clock edge
		salida_i <= '0';
		if enable = '1' then	
			if contador = 0 then
			  contador <= to_unsigned(1302, 12);
			  salida_i <= '1';
			else		
				contador <= contador - 1;
				salida_i <= '0';
				
			end if;
		else
			contador <= to_unsigned(1302, 12);
		end if;
    end if;
	

  end process;
  
  overflow <= salida_i;
end architecture behavioural;