----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2026 02:33:45 PM
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
USE ieee.numeric_std.ALL;

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

component Adder4bit_2 port ( 
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
uut : Adder4bit_2 port map (A => A , B => B  , Sum => Sum , Cout => Cout );

sim : process 
begin


for i in 0 to 15 loop 
for j in 0 to 15 loop 
A <= std_logic_vector(TO_UNSIGNED(i,4));
B <= std_logic_vector(TO_UNSIGNED(j,4));

wait for 10ns; 
end loop ;
end loop ;
              
wait; 
end process ; 


end Behavioral;
