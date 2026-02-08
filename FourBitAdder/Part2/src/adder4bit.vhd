LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY adder4bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Cin : IN STD_LOGIC;
        Sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        Cout : OUT STD_LOGIC);
END adder4bit;
ARCHITECTURE Behavioral OF adder4bit IS
BEGIN
    sim : PROCESS (A, B, Cin)
        VARIABLE temp : unsigned(4 DOWNTO 0);
    BEGIN
        temp := ('0' & unsigned(A)) + ('0' & unsigned(B)) + ("0000" & Cin);
        Sum <= STD_LOGIC_VECTOR(temp(3 DOWNTO 0));
        Cout <= temp(4);
    END PROCESS;
END Behavioral;
