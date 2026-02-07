----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 10:15:12 PM
-- Design Name: 
-- Module Name: Adder4Bit_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder4Bit_tb is
--  Port ( );
end Adder4Bit_tb;

architecture Behavioral of Adder4Bit_tb is
component Adder4Bit port ( 
    A :in std_logic_vector (3 downto 0 );
    B :in std_logic_vector (3 downto 0 )  ; 
    Sum: out std_logic_vector (3 downto 0 ) ; 
    Cout: out std_logic);
end component ;
    signal A : std_logic_vector(3 downto 0)    :=(others =>'0');
    signal B : std_logic_vector(3 downto 0)    :=(others =>'0');
    signal Sum : std_logic_vector(3 downto 0)  :=(others =>'0');
    signal Cout : std_logic :='0';

begin
uut : Adder4Bit port map (A => A , B => B  , Sum => Sum , Cout => Cout );

sim : process 
begin
    A <= "0101" ;
    B <= "0110";
    wait for 10 ns ;
wait; 
end process ; 
end Behavioral;
