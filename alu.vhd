library ieee;
use ieee.std_logic_1164.all;

entity alu is port(
  i_SEL : in std_logic_vector(2 downto 0);
  i_A   : in std_logic_vector(7 downto 0);
  i_B   : in std_logic_vector(7 downto 0);
  o_A   : in std_logic_vector(7 downto 0);
  o_B   : in std_logic_vector(7 downto 0));
end entity;

architecture arch_alu of alu is
begin
  
end architecture;