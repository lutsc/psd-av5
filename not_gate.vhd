library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity not_gate is port(
  i_A : in std_logic_vector(2 downto 0);
  i_B : in std_logic_vector(2 downto 0);
  o_S : out std_logic_vector(2 downto 0));
end entity;

architecture arch_not_gate of not_gate is
begin

end architecture;