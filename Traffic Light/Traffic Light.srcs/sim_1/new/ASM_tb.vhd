LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY asm_TB IS

END asm_TB;

ARCHITECTURE Behavioral OF asm_TB IS

    COMPONENT ASM
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            s : IN STD_LOGIC;
            timer_done : IN STD_LOGIC;
            set, R, Y, G : OUT STD_LOGIC;
            timerd0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            timerd1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL s : STD_LOGIC := '0';
    SIGNAL TimerDone : STD_LOGIC := '0';
    SIGNAL set : STD_LOGIC;
    SIGNAL R, Y, G : STD_LOGIC;
    SIGNAL TimerD0, TimerD1 : STD_LOGIC_VECTOR (3 DOWNTO 0);

    CONSTANT clk_p : TIME := 10 ns;

BEGIN

    u1 : ASM
    PORT MAP(
        clk => clk,
        reset => reset,
        s => s,
        timer_done => TimerDone,
        set => set,
        R => R,
        Y => Y,
        G => G,
        timerd0 => TimerD0,
        timerd1 => TimerD1
    );

    clk_process : PROCESS
    BEGIN
        WHILE true LOOP
            clk <= '0';
            WAIT FOR clk_p /2;
            clk <= '1';
            WAIT FOR clk_p /2;
        END LOOP;
    END PROCESS;
    stim_process : PROCESS
    BEGIN
        TimerDone <= '0';
        reset <= '1';
        WAIT FOR 5 * clk_p;
        reset <= '0';
        s <= '0';
        WAIT FOR 5 * clk_p;
        s <= '1';
        WAIT FOR 3 * clk_p;
        s <= '0';
        WAIT FOR 30 * clk_p;
        TimerDone <= '1';
        WAIT FOR clk_p;
        TimerDone <= '0';
        WAIT FOR 10 * clk_p;
        TimerDone <= '1';
        WAIT FOR clk_p;
        TimerDone <= '0';
        WAIT FOR 20 * clk_p;
        TimerDone <= '1';
        WAIT FOR clk_p;
        TimerDone <= '0';
        WAIT FOR 5ns;
        TimerDone <= '1';
        WAIT FOR clk_p;
        TimerDone <= '0';
        WAIT;
    END PROCESS;

END Behavioral;
