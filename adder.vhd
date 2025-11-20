library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is port(
  i_A : in std_logic_vector(2 downto 0);
  i_B : in std_logic_vector(2 downto 0);
  i_C : in std_logic;
  o_C : out std_logic;
  o_S : out std_logic_vector(2 downto 0));
end entity;

architecture arch_adder of adder is

  -- signal w_TEMP : std_logic_vector(3 downto 0);
signal w_TEMP : std_logic_vector(2 downto 0);

begin

-- w_TEMP <= std_logic_vector('0' & unsigned(i_A) + unsigned('0' & i_B) + ("000" & i_C));
w_TEMP <= std_logic_vector(unsigned(i_A) + unsigned(i_B) + ("00" & i_C));
o_S <= w_TEMP(2 downto 0);
-- o_C <= w_TEMP(3);

end architecture;