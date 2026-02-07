----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 09:21:11 PM
-- Design Name: 
-- Module Name: fulladder - Behavioral
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

entity fulladder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c_in : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is

component halfadder
    port (
        a : in  std_logic;
        b : in  std_logic;
        s : out std_logic;
        c : out std_logic
    );
end component;
signal s1 : std_logic :='0';
signal s2 : std_logic :='0';
signal s3 : std_logic :='0';

begin

adr1: halfadder port map ( a => a , b => b ,s => s1, c => s2 );
adr2: halfadder port map ( a => s1 , b => c_in ,s => s, c => s3 );

c_out <= s2 or s3;

end Behavioral;