LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ASM IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        s : IN STD_LOGIC;
        timer_done : IN STD_LOGIC;
        set : OUT STD_LOGIC;
        R : OUT STD_LOGIC;
        Y : OUT STD_LOGIC;
        G : OUT STD_LOGIC;
        timerd0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        timerd1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END ASM;

ARCHITECTURE Behavioral OF ASM IS

    TYPE state_type IS (T0, T1, T2, T3, T4, T5, T6, T7, T8);
    SIGNAL current_state, next_state : state_type;

BEGIN
    p1 : PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            current_state <= T0;
        ELSIF (clk'event AND clk = '1') THEN
            current_state <= next_state;
        END IF;
    END PROCESS;
    p2 : PROCESS (s, current_state, timer_done)
    BEGIN
        CASE current_state IS

            WHEN T0 =>
                IF s = '0' THEN
                    next_state <= T0;
                ELSE
                    next_state <= T1;
                END IF;

            WHEN T1 =>
                next_state <= T2;

            WHEN T2 =>
                IF timer_done = '0' THEN
                    next_state <= T2;
                ELSE
                    next_state <= T3;
                END IF;

            WHEN T3 =>
                next_state <= T4;

            WHEN T4 =>
                IF timer_done = '0' THEN
                    next_state <= T4;
                ELSE
                    next_state <= T5;
                END IF;

            WHEN T5 =>
                next_state <= T6;

            WHEN T6 =>
                IF timer_done = '0' THEN
                    next_state <= T6;
                ELSE
                    next_state <= T7;
                END IF;

            WHEN T7 =>
                next_state <= T8;

            WHEN T8 =>
                IF timer_done = '0' THEN
                    next_state <= T8;
                ELSE
                    next_state <= T1;
                END IF;

        END CASE;
    END PROCESS;

    p3 : PROCESS (clk)
    BEGIN
        IF (clk'event AND clk = '1') THEN
            CASE current_state IS

                WHEN T0 =>
                    timerd0 <= "0000";
                    timerd1 <= "0000";
                    set <= '1';
                    R <= '0';
                    Y <= '0';
                    G <= '0';

                WHEN T1 =>
                    timerd0 <= "0000";
                    timerd1 <= "0010";
                    set <= '1';
                    R <= '1';
                    Y <= '0';
                    G <= '0';

                WHEN T2 =>
                    set <= '0';

                WHEN T3 =>
                    timerd0 <= "0011";
                    timerd1 <= "0000";
                    set <= '1';
                    R <= '1';
                    Y <= '1';
                    G <= '0';

                WHEN T4 =>
                    set <= '0';

                WHEN T5 =>
                    timerd0 <= "0000";
                    timerd1 <= "0010";
                    set <= '1';
                    R <= '0';
                    Y <= '0';
                    G <= '1';

                WHEN T6 =>
                    set <= '0';

                WHEN T7 =>
                    timerd0 <= "0011";
                    timerd1 <= "0000";
                    set <= '1';
                    R <= '0';
                    Y <= '1';
                    G <= '0';

                WHEN T8 =>
                    set <= '0';

            END CASE;
        END IF;
    END PROCESS;

END Behavioral;
