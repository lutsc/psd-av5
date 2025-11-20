library ieee;
use ieee.std_logic_1164.all;

entity alu_extender is port(
  i_SEL : in std_logic_vector(2 downto 0);
  i_A   : in std_logic_vector(2 downto 0);
  i_B   : in std_logic_vector(2 downto 0);
  o_A   : out std_logic_vector(2 downto 0);
  o_B   : out std_logic_vector(2 downto 0);
  o_C   : out std_logic);
end entity;

architecture arch_alu_extender of alu_extender is
begin

process(i_SEL, i_A, i_B)
begin
  case (i_SEL) is
  when "000" => 
    o_A <= i_A;
    o_B <= i_B;
    o_C <= '0';

  when "001" =>
    o_A <= i_A;
    o_B <= not i_B;
    o_C <= '1';

  when "010" =>
    o_A <= i_A;
    o_B <= (others => '0');
    o_C <= '1';

  when "011" =>
    o_A <= i_A;
    o_B <= (others => '0');
    o_C <= '0';

  when "100" =>
    o_A <= i_A and i_B;
    o_B <= (others => '0');
    o_C <= '0';
  
  when "101" =>
    o_A <= i_A or i_B;
    o_B <= (others => '0');
    o_C <= '0';

  when "110" =>
    o_A <= i_A xor i_B;
    o_B <= (others => '0');
    o_C <= '0';

  when "111" =>
    o_A <= not i_A;
    o_B <= (others => '0');
    o_C <= '0';

  when others => 
    o_A <= i_A;
    o_B <= i_B;
    o_C <= '0';
  end case;
end process;

end architecture;