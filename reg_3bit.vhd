library ieee;
use ieee.std_logic_1164.all;

entity reg_3bit is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_ENA   : in std_logic;
  i_D     : in std_logic_vector(2 downto 0);
  o_Q     : out std_logic_vector(2 downto 0));
end entity;

architecture arch_reg_3bit of reg_3bit is
begin
  process(i_CLR_n, i_CLK)
  begin
    if (i_CLR_n = '0') then
      o_Q <= (others => '0');
    elsif (rising_edge(i_CLK) and i_ENA = '1') then
      o_Q <= i_D;
    end if;
  end process;
end architecture;
