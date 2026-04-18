----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/18/2026 12:02:09 PM
-- Design Name:
-- Module Name: BCDto7Seg
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

ENTITY BCDto7seg IS
    PORT (
        BCDval : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        code7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END BCDto7seg;

ARCHITECTURE Behavioral OF BCDto7seg IS

BEGIN
    PROCESS (BCDval)
    BEGIN
        CASE BCDval IS

            WHEN "0000" => code7seg <= "1111110";
            WHEN "0001" => code7seg <= "0110000";
            WHEN "0010" => code7seg <= "1101101";
            WHEN "0011" => code7seg <= "1111001";
            WHEN "0100" => code7seg <= "0110011";
            WHEN "0101" => code7seg <= "1011011";
            WHEN "0110" => code7seg <= "1011111";
            WHEN "0111" => code7seg <= "1110000";
            WHEN "1000" => code7seg <= "1111111";
            WHEN "1001" => code7seg <= "1111011";

            WHEN OTHERS => code7seg <= "0000000";

        END CASE;
    END PROCESS;

END Behavioral;
