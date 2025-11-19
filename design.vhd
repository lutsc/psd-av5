library ieee;
use ieee.std_logic_1164.all;

entity design is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_SEL   : in std_logic_vector(2 downto 0);
  i_A     : in std_logic_vector(7 downto 0);
  i_B     : in std_logic_vector(7 downto 0);
  o_S     : in std_logic_vector(7 downto 0));
end entity;

architecture arch_design of design is
begin

  -- instância da ula
  -- seletor
  -- clear/reset
  -- registrador
  -- saida
  
end architecture;