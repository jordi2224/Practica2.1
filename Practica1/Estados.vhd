library IEEE;
use ieee.std_logic_1164.all;


entity Estados is 
port (
	reset_s, en1, en2, ov1, ov2, clk : in std_logic;
	UART : in std_logic;
	salidas : out std_logic_vector (7 downto 0);
	led_par : out std_logic
	);
end Estados;

architecture behavioural of Estados is

type t_estados is (rest, t, Temp, esp0,  bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, par, finish);
signal s_now, s_next : t_estados;

signal diario : std_logic_vector (4 downto 0); -- Controlar recibiendo bit.
	
begin

	VarEstado : process (reset_s, s_next)
	begin
		if reset_s = '0' then
			s_now <= rest;
		elsif clk = '1' and clk'event then
			s_now <= s_next;
		end if;
	end process VarEstado;
	
	CambioEstado : process (s_now, UART)
	begin
		s_next <= s_now;
		diario <= "00000";
		
		case s_now is 
			when rest =>
				if UART = '0' then 
					s_next <= t;
				end if;
					
			when t =>
				if ov1 = '1' then
					s_next <= Temp;
				end if;
			
			when Temp =>
				if ov2 = '1' then
				case diario is
					when "00001" =>
						s_next <= bit1;
					when "00010" =>
						s_next <= bit2;
					when "00011" =>
						s_next <= bit3;
					when "00100" =>
						s_next <= bit4;
					when "00101" =>
						s_next <= bit5;
					when "000110" =>
						s_next <= bit6;
					when "00111" =>
						s_next <= bit7;
					when "01000" =>
						s_next <= par;
					when "11111" =>
						s_next <= finish;
					when others =>
						s_next <= rest;
				end case;
				end if;
			
			when bit0 =>
				salidas (0) <= UART;
				diario <= "00001";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			
			when bit1 =>
				salidas (1) <= UART;
				diario <= "00010";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			when bit2 =>
				salidas (2) <= UART;
				diario <= "00011";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			when bit3 =>
				salidas (3) <= UART;
				diario <= "00100";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			
			when bit4 =>
				salidas (4) <= UART;
				diario <= "00101";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			
			when bit5 =>
				salidas (5) <= UART;
				diario <= "000110";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			
			when bit6 =>
				salidas (6) <= UART;
				diario <= "00111";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			
			when bit7 =>
				salidas (7) <= UART;
				diario <= "01000";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			
			when par =>
				led_par <= UART;
				diario <= "11111";
				if ov2 = '1' then
					s_next <= Temp;
				end if;
			
			when finish =>
				s_next <= rest;
			
			when others =>
			s_next <= rest;
		end case;
	end process;
	
end behavioural;