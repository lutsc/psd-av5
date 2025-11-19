library ieee;
use ieee.std_logic_1164.all;

entity alu is port(
  i_SEL : in std_logic_vector(2 downto 0);
  i_A   : in std_logic_vector(2 downto 0);
  i_B   : in std_logic_vector(2 downto 0);
  o_S   : out std_logic_vector(2 downto 0));
end entity;

architecture arch_alu of alu is

component alu_extender is port(
  i_SEL : in std_logic_vector(2 downto 0);
  i_A   : in std_logic_vector(2 downto 0);
  i_B   : in std_logic_vector(2 downto 0);
  o_A   : out std_logic_vector(2 downto 0);
  o_B   : out std_logic_vector(2 downto 0);
  o_C   : out std_logic);
end component;

component adder is port(
  i_A : in std_logic_vector(2 downto 0);
  i_B : in std_logic_vector(2 downto 0);
  i_C : in std_logic;
  o_S : out std_logic_vector(2 downto 0));
end component;

signal w_A, w_B: std_logic_vector(2 downto 0);
signal w_C: std_logic;

begin

u_EXTENDER : alu_extender port map(
    i_SEL => i_SEL,
    i_A => i_A,
    i_B => i_B,
    o_A => w_A,
    o_B => w_B,
    o_C => w_C);

u_ADDER : adder port map(
  i_A => w_A,
  i_B => w_B,
  i_C => w_C,
  o_S => o_S);

end architecture;