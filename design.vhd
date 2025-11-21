library ieee;
use ieee.std_logic_1164.all;

entity design is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_ENA   : in std_logic;
  i_SEL   : in std_logic_vector(2 downto 0);
  i_A     : in std_logic_vector(2 downto 0);
  i_B     : in std_logic_vector(2 downto 0);
  o_S     : out std_logic_vector(2 downto 0));
end entity;

architecture arch_design of design is
  
component alu is port(
  i_SEL : in std_logic_vector(2 downto 0);
  i_A   : in std_logic_vector(2 downto 0);
  i_B   : in std_logic_vector(2 downto 0);
  o_S   : out std_logic_vector(2 downto 0));
end component;

signal w_S : std_logic_vector(2 downto 0);

begin

u_ALU : alu port map(
  i_SEL => i_SEL,
  i_A => i_A,
  i_B => i_B,
  o_S => w_S);
  -- u_ALU : alu port map(i_SEL, i_A, i_B, w_S);

process(i_CLR_n, i_CLK, i_ENA)
begin
  if (i_CLR_n = '1') then
    o_S <= (others => '0');
  elsif (rising_edge(i_CLK) and i_ENA = '1') then
    o_S <= w_S;
  end if;
end process;

end architecture;