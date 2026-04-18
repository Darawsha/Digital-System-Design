----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/18/2026 12:02:09 PM
-- Design Name:
-- Module Name: PBDebouncer
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

ENTITY PBD IS
    PORT (
        clk : IN STD_LOGIC;
        pb : IN STD_LOGIC;
        pbd : OUT STD_LOGIC);
END PBD;

ARCHITECTURE Behavioral OF PBD IS
    SIGNAL Ton, pb_old : STD_LOGIC := '0';
    SIGNAL Tvalue : INTEGER RANGE 0 TO 1000000 := 0;
    SIGNAL temp : STD_LOGIC := '0';
BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk' event AND clk = '1') THEN
            IF (Ton = '1') THEN
                IF (Tvalue = 1000000) THEN
                    Ton <= '0';
                ELSE
                    Tvalue <= Tvalue + 1;
                END IF;
            ELSE
                IF (pb /= pb_old) THEN
                    Ton <= '1';
                    Tvalue <= 0;
                    pb_old <= pb;
                    temp <= NOT(temp);
                END IF;
            END IF;
        END IF;
    END PROCESS;
    pbd <= temp;

END Behavioral;
