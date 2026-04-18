----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/18/2026 12:02:09 PM
-- Design Name:
-- Module Name: CountDownTimer
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
USE IEEE.NUMERIC_STD.ALL;

ENTITY CountdownTimer IS
    PORT (
        clk : IN STD_LOGIC;
        set : IN STD_LOGIC;
        digit0_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        digit1_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        digit0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        digit1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Timer_Done : OUT STD_LOGIC
    );
END CountdownTimer;

ARCHITECTURE Behavioral OF CountdownTimer IS
    SIGNAL d0, d1 : INTEGER RANGE 0 TO 9 := 0;
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF set = '1' THEN
                d0 <= to_integer(unsigned(digit0_in));
                d1 <= to_integer(unsigned(digit1_in));
            ELSE
                IF (d0 = 0 AND d1 = 0) THEN
                ELSE
                    IF d0 = 0 THEN
                        d0 <= 9;
                        d1 <= d1 - 1;
                    ELSE
                        d0 <= d0 - 1;
                    END IF;
                END IF;
            END IF;

        END IF;
    END PROCESS;

    Timer_Done <= '1' WHEN (d0 = 0 AND d1 = 0) ELSE
        '0';

    digit0 <= STD_LOGIC_VECTOR(to_unsigned(d0, 4));
    digit1 <= STD_LOGIC_VECTOR(to_unsigned(d1, 4));

END Behavioral;
