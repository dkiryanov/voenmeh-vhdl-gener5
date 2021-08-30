library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity GENER5 is

port (clk : in std_logic;
digits : out bit_vector (4 downto 0));
end GENER5;

architecture behav of GENER5 is
signal cnt : bit_vector (4 downto 0) := ('0','0','0','0','0');

begin
process (clk, cnt)
begin
if (cnt = ('1','1','1','1','1')) then
	cnt <= ('0','0','0','0','0');
else	
	if (clk'event and clk = '1') then

		cnt <= cnt SLL 1;

		cnt(0)<= cnt(4) XNOR cnt(2);

	end if;
end if;
	
end process;
digits <= cnt;
end behav;
