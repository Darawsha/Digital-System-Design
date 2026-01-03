LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_pattern_counter IS
END tb_pattern_counter;

ARCHITECTURE behavior OF tb_pattern_counter IS

    COMPONENT pattern_counter IS
        PORT (
            clk, reset, s : IN STD_LOGIC;
            data : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
            pattern : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            count : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL s : STD_LOGIC := '0';
    SIGNAL data : STD_LOGIC_VECTOR(19 DOWNTO 0) := (OTHERS => '0');
    SIGNAL pattern : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL count : STD_LOGIC_VECTOR(2 DOWNTO 0);

    CONSTANT clk_period : TIME := 2 ns;

BEGIN

    uut : pattern_counter
    PORT MAP(
        clk => clk,
        reset => reset,
        s => s,
        data => data,
        pattern => pattern,
        count => count
    );
    P1 : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    P2 : PROCESS
    BEGIN
        -- Reset
        reset <= '0';
        WAIT FOR clk_period * 5;
        reset <= '1';

        -- Test Case 1
        data <= "10101010101010101010";
        pattern <= "1010";
        s <= '1';
        WAIT FOR clk_period * 2;
        s <= '0';
        WAIT FOR 25 ns;
        reset <= '0';
        WAIT FOR clk_period * 5;
        reset <= '1';

        -- Test Case 2
        data <= "10101010101010101010";
        pattern <= "0101";
        s <= '1';
        WAIT FOR clk_period * 2;
        s <= '0';
        WAIT FOR 15 ns;

        reset <= '0';
        WAIT FOR clk_period * 2;
        reset <= '1';

        -- Test Case 3

        data <= "00001100111011000110";
        pattern <= "0110";
        s <= '1';
        WAIT FOR clk_period * 2;
        s <= '0';
        WAIT FOR 15 ns;

        reset <= '0';
        WAIT FOR clk_period * 2;
        reset <= '1';

        -- Test Case 4

        data <= "11111111111111111111";
        pattern <= "0000";
        s <= '1';
        WAIT FOR clk_period * 2;
        s <= '0';
        WAIT FOR 15 ns;
        reset <= '0';
        WAIT FOR clk_period * 2;
        reset <= '1';

        -- Test Case 5

        data <= "00001111000011110001";
        pattern <= "0001";
        s <= '1';
        WAIT FOR clk_period * 2;
        s <= '0';
        WAIT FOR 15 ns;
        WAIT;
    END PROCESS;

END behavior;
