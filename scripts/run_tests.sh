#!/bin/bash

# VHDL Test Runner Script
# Compiles and runs all VHDL testbenches using GHDL

# set -e  # Disabled - we handle errors manually

echo "=================================================="
echo "           VHDL Test Suite Runner"
echo "=================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Function to run a single test
run_test() {
    local src_file=$1
    local test_file=$2
    local entity_name=$3
    
    echo -e "${BLUE}Testing: $entity_name${NC}"
    
    # Change to work directory for GHDL operations
    cd work
    
    # Compile source file
    if ! ghdl -a "../$src_file" 2>/dev/null; then
        echo -e "${RED}  ✗ Failed to compile source: $src_file${NC}"
        cd ..
        return 1
    fi
    
    # Compile test file
    if ! ghdl -a "../$test_file" 2>/dev/null; then
        echo -e "${RED}  ✗ Failed to compile test: $test_file${NC}"
        cd ..
        return 1
    fi
    
    # Elaborate testbench
    if ! ghdl -e "$entity_name" 2>/dev/null; then
        echo -e "${RED}  ✗ Failed to elaborate: $entity_name${NC}"
        cd ..
        return 1
    fi
    
    # Run simulation
    if ghdl -r "$entity_name" --stop-time=1ms 2>/dev/null; then
        echo -e "${GREEN}  ✓ Test passed${NC}"
        cd ..
        return 0
    else
        echo -e "${RED}  ✗ Test failed${NC}"
        cd ..
        return 1
    fi
}

# Function to test a category
test_category() {
    local category=$1
    echo -e "\n${YELLOW}=== Testing $category ===${NC}"
    
    case $category in
        "gates")
            # Test OR Gate
            if [ -f "src/gates/or_gate.vhd" ] && [ -f "test/gates/or_gate_tb.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/gates/or_gate.vhd" "test/gates/or_gate_tb.vhd" "or_gate_tb"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            
            # Test existing XOR testbench
            if [ -f "src/gates/xor_3.vhd" ] && [ -f "test/gates/xor_testbench.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/gates/xor_3.vhd" "test/gates/xor_testbench.vhd" "xor_testbench"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            ;;
            
        "combinational")
            # Test decoders
            if [ -f "src/combinational/decoders/decoder_2x4.vhd" ] && [ -f "test/combinational/decoders/decoder_2x4_testbench.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/combinational/decoders/decoder_2x4.vhd" "test/combinational/decoders/decoder_2x4_testbench.vhd" "decoder_2x4_testbench"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            
            # Test 2x1 multiplexer
            if [ -f "src/combinational/multiplexers/mux_2x1_df.vhd" ] && [ -f "test/combinational/multiplexers/mux_2x1_tb.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/combinational/multiplexers/mux_2x1_df.vhd" "test/combinational/multiplexers/mux_2x1_tb.vhd" "mux_2x1_tb"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            
            # Test adders
            if [ -f "src/combinational/adders/fa_behaviour.vhd" ] && [ -f "test/combinational/adders/fa_testbench.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/combinational/adders/fa_behaviour.vhd" "test/combinational/adders/fa_testbench.vhd" "fa_testbench"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            
            if [ -f "src/combinational/adders/ha_behave.vhd" ] && [ -f "test/combinational/adders/ha_behave_tb.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/combinational/adders/ha_behave.vhd" "test/combinational/adders/ha_behave_tb.vhd" "ha_behave_tb"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            
            if [ -f "src/combinational/adders/rc_adder_4bit.vhd" ] && [ -f "test/combinational/adders/rc_adder_testbench.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/combinational/adders/rc_adder_4bit.vhd" "test/combinational/adders/rc_adder_testbench.vhd" "rc_adder_testbench"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            ;;
            
        "sequential")
            # Test D flip-flop
            if [ -f "src/sequential/flip_flops/d_flip_flop.vhd" ] && [ -f "test/sequential/flip_flops/d_flip_flop_tb.vhd" ]; then
                TOTAL_TESTS=$((TOTAL_TESTS + 1))
                if run_test "src/sequential/flip_flops/d_flip_flop.vhd" "test/sequential/flip_flops/d_flip_flop_tb.vhd" "d_flip_flop_tb"; then
                    PASSED_TESTS=$((PASSED_TESTS + 1))
                else
                    FAILED_TESTS=$((FAILED_TESTS + 1))
                fi
            fi
            ;;
    esac
}

# Check if GHDL is installed
if ! command -v ghdl &> /dev/null; then
    echo -e "${RED}Error: GHDL is not installed or not in PATH${NC}"
    exit 1
fi

echo "GHDL Version: $(ghdl --version | head -n1)"
echo

# Create work directory for GHDL
mkdir -p work

# Run tests by category (from project root)
test_category "gates"
test_category "combinational" 
test_category "sequential"

# Clean up
rm -rf work

# Summary
echo -e "\n${YELLOW}=================================================="
echo "                Test Summary"
echo -e "==================================================${NC}"
echo -e "Total Tests: $TOTAL_TESTS"
echo -e "${GREEN}Passed: $PASSED_TESTS${NC}"
echo -e "${RED}Failed: $FAILED_TESTS${NC}"

if [ $FAILED_TESTS -eq 0 ]; then
    echo -e "\n${GREEN}🎉 All tests passed!${NC}"
    exit 0
else
    echo -e "\n${RED}❌ Some tests failed.${NC}"
    exit 1
fi 