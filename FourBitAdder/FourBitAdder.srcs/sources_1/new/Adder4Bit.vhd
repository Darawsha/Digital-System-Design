----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/08/2026 02:30:39 PM
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Adder4Bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Cout : OUT STD_LOGIC);
END Adder4Bit;

ARCHITECTURE Behavioral OF Adder4Bit IS

    COMPONENT
        fulladder PORT (
            a : IN STD_LOGIC;
            b : IN STD_LOGIC;
            c_in : IN STD_LOGIC;
            s : OUT STD_LOGIC;
            c_out : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL carryInBlock : STD_LOGIC_VECTOR (4 DOWNTO 0);
BEGIN

    carryInBlock(0) <= '0';

    FA0 : fulladder PORT MAP(a => A(0), b => B(0), c_in => carryInBlock(0), s => Sum(0), c_out => carryInBlock(1));
    FA1 : fulladder PORT MAP(a => A(1), b => B(1), c_in => carryInBlock(1), s => Sum(1), c_out => carryInBlock(2));
    FA2 : fulladder PORT MAP(a => A(2), b => B(2), c_in => carryInBlock(2), s => Sum(2), c_out => carryInBlock(3));
    FA3 : fulladder PORT MAP(a => A(3), b => B(3), c_in => carryInBlock(3), s => Sum(3), c_out => carryInBlock(4));
    Cout <= carryInBlock(4);
END Behavioral;
