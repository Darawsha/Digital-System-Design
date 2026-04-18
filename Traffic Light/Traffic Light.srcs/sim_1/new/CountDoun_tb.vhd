LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY CountDoun_tb IS
END CountDoun_tb;

ARCHITECTURE behavior OF CountDoun_tb IS

    COMPONENT CountDownTimer IS
        PORT (
            clk : IN STD_LOGIC;
            set : IN STD_LOGIC;
            digit0_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit1_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Timer_Done : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL set : STD_LOGIC := '0';
    SIGNAL InitValue1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL InitValue0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Digit1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Digit0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Timer_Done : STD_LOGIC;

    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    uut : CountDownTimer
    PORT MAP(
        clk => clk,
        set => set,
        digit0_in => InitValue0,
        digit1_in => InitValue1,
        digit0 => Digit0,
        digit1 => Digit1,
        Timer_Done => Timer_Done
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
        InitValue1 <= "0010";
        InitValue0 <= "0000";
        set <= '1';
        WAIT FOR clk_period;
        set <= '0';

        WAIT FOR clk_period * 25;

        InitValue1 <= "0000";
        InitValue0 <= "0011";
        set <= '1';
        WAIT FOR clk_period;
        set <= '0';

        WAIT FOR clk_period * 8;
        WAIT;
    END PROCESS;

END behavior;
