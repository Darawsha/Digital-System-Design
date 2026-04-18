----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/18/2026 12:02:09 PM
-- Design Name:
-- Module Name: Top_Level
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

ENTITY Top_level IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        s : IN STD_LOGIC;
        R : OUT STD_LOGIC;
        Y : OUT STD_LOGIC;
        G : OUT STD_LOGIC;
        code7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        C : OUT STD_LOGIC);
END Top_level;

ARCHITECTURE Behavioral OF Top_level IS
    SIGNAL pb1, pb2 : STD_LOGIC := '0';
    SIGNAL timer_done, set : STD_LOGIC := '0';
    SIGNAL timerdigit0, timerdigit1 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL clk_1HZ : STD_LOGIC := '0';
    SIGNAL digit0, digit1 : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL BCD_val : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";

    COMPONENT PBD
        PORT (
            clk : IN STD_LOGIC;
            pb : IN STD_LOGIC;
            pbd : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT asm_trafficL
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
    END COMPONENT;

    COMPONENT CountdownTimer
        PORT (
            clk : IN STD_LOGIC;
            set : IN STD_LOGIC;
            digit0_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            digit1_in : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            digit0 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            digit1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            timer_done : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT time_mux
        PORT (
            clk : IN STD_LOGIC;
            digit0 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            digit1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            BCDval : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            digsel : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT BCDto7seg
        PORT (
            BCDval : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            code7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
    END COMPONENT;

    COMPONENT clk_divider
        PORT (
            clkin : IN STD_LOGIC;
            clkout : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    uut1 : PBD
    PORT MAP(
        clk => clk,
        pb => s,
        pbd => pb1
    );

    uut2 : PBD
    PORT MAP(
        clk => clk,
        pb => reset,
        pbd => pb2
    );

    uut3 : ASM
    PORT MAP(
        clk => clk,
        reset => pb2,
        s => pb1,
        timer_done => timer_done,
        set => set,
        R => R,
        Y => Y,
        G => G,
        timerd0 => timerdigit0,
        timerd1 => timerdigit1
    );

    uut4 : clk_divider
    PORT MAP(
        clkin => clk,
        clkout => clk_1HZ
    );

    uut5 : CountdownTimer
    PORT MAP(
        clk => clk_1HZ,
        set => set,
        digit0 => digit0,
        digit1 => digit1,
        digit0_in => timerdigit0,
        digit1_in => timerdigit1,
        timer_done => timer_done
    );

    uut6 : time_mux
    PORT MAP(
        clk => clk,
        digit0 => digit0,
        digit1 => digit1,
        BCDval => BCD_val,
        digsel => C
    );

    uut7 : BCDto7seg
    PORT MAP(
        BCDval => BCD_val,
        code7seg => code7seg
    );

END Behavioral;
