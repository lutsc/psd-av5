library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture tb of testbench is

component design is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_ENA   : in std_logic;
  i_SEL   : in std_logic_vector(2 downto 0);
  i_A     : in std_logic_vector(2 downto 0);
  i_B     : in std_logic_vector(2 downto 0);
  o_S     : out std_logic_vector(2 downto 0));
end component;

signal w_CLR_n, w_CLK, w_ENA : std_logic := '0';
signal w_SEL, w_A, w_B, w_S : std_logic_vector(2 downto 0) := "000";
constant c_PERIOD : time := 1 ns;

begin

u_DUT : design port map(
  i_CLR_n => w_CLR_n,
  i_CLK => w_CLK,
  i_ENA => w_ENA,
  i_SEL => w_SEL,
  i_A => w_A,
  i_B => w_B,
  o_S => w_S);

w_CLK <= not w_CLK after c_PERIOD/2;
w_CLR_n <= '1' after c_PERIOD/2;

p_INPUTS: process
begin

  -- Ativando ENABLE
  w_ENA <= '1';
  wait for c_PERIOD;

  -- Adder
  w_SEL <= "000";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "000") report "Falha no Adder." severity error;
  
  -- Subtractor
  w_SEL <= "001";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "010") report "Falha no Subractor." severity error;

  -- Counter
  w_SEL <= "010";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "110") report "Falha no Counter." severity error;

  -- Pass
  w_SEL <= "011";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "101") report "Falha no Pass." severity error;

  -- AND
  w_SEL <= "100";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "001") report "Falha no AND." severity error;

  -- OR
  w_SEL <= "101";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "111") report "Falha no OR." severity error;

  -- XOR
  w_SEL <= "110";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "110") report "Falha no XOR." severity error;

  -- NOT
  w_SEL <= "111";
  w_A <= "101";
  w_B <= "011";
  wait for c_PERIOD;
  assert(w_S = "010") report "Falha no NOT." severity error;
  
  -- Zerando entradas
  w_SEL <= "000";
  w_A <= "000";
  w_B <= "000";
  assert false report "Teste feito." severity note;
  wait;
end process;

end architecture;