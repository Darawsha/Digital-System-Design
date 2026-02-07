----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 09:35:14 PM
-- Design Name: 
-- Module Name: fulladder_tb - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladder_tb is
--  Port ( );
end fulladder_tb;

architecture Behavioral of fulladder_tb is
    component fulladder port ( a : in  STD_LOGIC; b : in  STD_LOGIC; c_in : in  STD_LOGIC; s : out STD_LOGIC; c_out : out STD_LOGIC );
    end component;
   
    signal a_tb : std_logic := '0';
    signal b_tb : std_logic := '0';
    signal c_in_tb : std_logic := '0';
    signal s_tb : std_logic;
    signal c_out_tb : std_logic;     
    
begin
   uut: fulladder port map ( a => a_tb, b => b_tb, c_in => c_in_tb, s => s_tb, c_out => c_out_tb );
    sim :process
    begin

        a_tb <= '0'; b_tb <= '0'; c_in_tb <= '0';
        wait for 10 ns;

        a_tb <= '0'; b_tb <= '0'; c_in_tb <= '1';
        wait for 10 ns;

        a_tb <= '0'; b_tb <= '1'; c_in_tb <= '0';
        wait for 10 ns;

        a_tb <= '0'; b_tb <= '1'; c_in_tb <= '1';
        wait for 10 ns;


        a_tb <= '1'; b_tb <= '0'; c_in_tb <= '0';
        wait for 10 ns;

        a_tb <= '1'; b_tb <= '0'; c_in_tb <= '1';
        wait for 10 ns;

        a_tb <= '1'; b_tb <= '1'; c_in_tb <= '0';
        wait for 10 ns;

        a_tb <= '1'; b_tb <= '1'; c_in_tb <= '1';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
