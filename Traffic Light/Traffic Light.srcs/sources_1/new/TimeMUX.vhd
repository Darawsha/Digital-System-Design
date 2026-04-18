----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/18/2026 12:02:09 PM
-- Design Name:
-- Module Name: TimeMUX
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

ENTITY time_mux IS
    PORT (
        clk : IN STD_LOGIC;
        digit0 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        digit1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        BCDval : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        digsel : OUT STD_LOGIC);
END time_mux;

ARCHITECTURE Behavioral OF time_mux IS

    SIGNAL y : INTEGER := 0;
    SIGNAL f : STD_LOGIC := '0';

BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk'event AND clk = '1') THEN

            IF (y = 1000000) THEN
                f <= NOT(f);
                y <= 0;
            ELSE
                y <= y + 1;
            END IF;

            IF (f = '0') THEN
                BCDval <= digit0;
            ELSE
                BCDval <= digit1;
            END IF;

        END IF;

        digsel <= f;

    END PROCESS;

END Behavioral;
