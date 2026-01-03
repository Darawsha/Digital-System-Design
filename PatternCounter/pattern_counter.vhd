LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pattern_counter IS
    PORT (
        clk, reset, s : IN STD_LOGIC;
        data : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
        pattern : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        count : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END;
ARCHITECTURE behavior OF pattern_counter IS

    TYPE STATE IS (T0, T1, T2);
    SIGNAL data_reg : STD_LOGIC_VECTOR(19 DOWNTO 0);
    SIGNAL pos_cnt : INTEGER RANGE 0 TO 20 := 0;
    SIGNAL match_cnt : INTEGER RANGE 0 TO 20 := 0;

    SIGNAL CURRENT_STATE, NEXT_STATE : STATE;

BEGIN
    --  state
    P1 : PROCESS (clk, reset)
    BEGIN
        IF reset = '0' THEN
            current_state <= T0;
        ELSIF rising_edge(clk) THEN
            current_state <= next_state;
        END IF;
    END PROCESS P1;

    -- NEXT_STATE LOGIC

    P2 : PROCESS (current_state, s, pos_cnt)
    BEGIN
        next_state <= current_state;

        CASE current_state IS
            WHEN T0 =>
                IF s = '1' THEN
                    next_state <= T1;
                END IF;

            WHEN T1 =>
                IF pos_cnt > 16 THEN
                    next_state <= T2;
                END IF;

            WHEN T2 =>
                IF s = '0' THEN
                    next_state <= T0;
                END IF;

            WHEN OTHERS =>
                next_state <= T0;
        END CASE;
    END PROCESS P2;

    -- OUTPUT LOGIC
    P3 : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            CASE current_state IS

                WHEN T0 =>
                    pos_cnt <= 0;
                    match_cnt <= 0;
                    data_reg <= data;
                    count <= (OTHERS => '0');

                WHEN T1 =>
                    IF data_reg(19 DOWNTO 16) = pattern THEN
                        match_cnt <= match_cnt + 1;
                        data_reg <= STD_LOGIC_VECTOR(unsigned(data_reg) SLL 4);
                        pos_cnt <= pos_cnt + 4;
                    ELSE
                        data_reg <= STD_LOGIC_VECTOR(unsigned(data_reg) SLL 1);
                        pos_cnt <= pos_cnt + 1;
                    END IF;
                WHEN T2 =>
                    count <= STD_LOGIC_VECTOR(to_unsigned(match_cnt, 3));

                WHEN OTHERS =>
                    NULL;
            END CASE;
        END IF;
    END PROCESS P3;

END behavior;
