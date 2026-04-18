----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/18/2026 12:02:09 PM
-- Design Name:
-- Module Name: ClkDivider
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

ENTITY clk_divider IS
    PORT (
        clkin : IN STD_LOGIC;
        clkout : OUT STD_LOGIC);
END clk_divider;

ARCHITECTURE Behavioral OF clk_divider IS
    SIGNAL temp : STD_LOGIC := '0';
    SIGNAL count : INTEGER RANGE 0 TO 50000000 := 0;
BEGIN

    PROCESS (clkin)
    BEGIN
        IF (clkin' event AND clkin = '1') THEN
            IF (count = 50000000) THEN
                temp <= NOT(temp);
                count <= 0;
            ELSE
                count <= count + 1;
            END IF;
        END IF;
    END PROCESS;
    clkout <= temp;
END Behavioral;
