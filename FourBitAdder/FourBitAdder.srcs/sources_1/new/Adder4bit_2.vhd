----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/08/2026 02:56:26 PM
-- Design Name:
-- Module Name: Adder4bit_2 - Behavioral
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
USE ieee.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Adder4bit_2 IS
    PORT (
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Cout : OUT STD_LOGIC);
END Adder4bit_2;

ARCHITECTURE Behavioral OF Adder4bit_2 IS
BEGIN
    sim : PROCESS (A, B)
        VARIABLE temp : unsigned(4 DOWNTO 0);
    BEGIN
        temp := ('0' & unsigned(A)) + ('0' & unsigned(B));
        Sum <= STD_LOGIC_VECTOR(temp(3 DOWNTO 0));
        Cout <= temp(4);
    END PROCESS;
END Behavioral;
