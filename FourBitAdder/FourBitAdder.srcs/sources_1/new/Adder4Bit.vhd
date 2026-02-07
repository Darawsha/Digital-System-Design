----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 10:00:51 PM
-- Design Name: 
-- Module Name: Adder4Bit - Behavioral
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

entity Adder4Bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end Adder4Bit;

architecture Behavioral of Adder4Bit is

component
fulladder port (a : in std_logic ; b :in std_logic ; c_in:in std_logic ; s:out std_logic ; c_out:out std_logic );
end component;

signal carryInBlock : std_logic_vector (4 downto 0);
begin

carryInBlock(0) <= '0';

FA0 : fulladder port map (a => A(0) , b => B(0) , c_in  => carryInBlock(0) , s =>Sum(0) , c_out =>carryInBlock(1));
FA1 : fulladder port map (a => A(1) , b => B(1) , c_in  => carryInBlock(1) , s =>Sum(1) , c_out =>carryInBlock(2));
FA2 : fulladder port map (a => A(2) , b => B(2) , c_in  => carryInBlock(2) , s =>Sum(2) , c_out =>carryInBlock(3));
FA3 : fulladder port map (a => A(3) , b => B(3) , c_in  => carryInBlock(3) , s =>Sum(3) , c_out =>carryInBlock(4));


Cout <= carryInBlock(4);

end Behavioral;
