# VHDL Project Makefile
# Provides convenient targets for building and testing VHDL designs

.PHONY: help test clean install build gates combinational sequential all
.DEFAULT_GOAL := help

# Colors for output
GREEN := \033[0;32m
YELLOW := \033[1;33m
BLUE := \033[0;34m
RED := \033[0;31m
NC := \033[0m

# GHDL configuration
GHDL := ghdl
GHDL_FLAGS := --std=08
WORK_DIR := work

help: ## Show this help message
	@echo "$(BLUE)VHDL Project Build System$(NC)"
	@echo "=========================="
	@echo ""
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""

install: ## Install GHDL (macOS only)
	@echo "$(BLUE)Installing GHDL...$(NC)"
	@if command -v brew >/dev/null 2>&1; then \
		brew install ghdl; \
	else \
		echo "$(RED)Error: Homebrew not found. Please install Homebrew first.$(NC)"; \
		exit 1; \
	fi

check-ghdl: ## Check if GHDL is installed
	@if command -v $(GHDL) >/dev/null 2>&1; then \
		echo "$(GREEN)✓ GHDL found: $$($(GHDL) --version | head -n1)$(NC)"; \
	else \
		echo "$(RED)✗ GHDL not found. Run 'make install' to install it.$(NC)"; \
		exit 1; \
	fi

$(WORK_DIR):
	@mkdir -p $(WORK_DIR)

test: check-ghdl ## Run all tests
	@echo "$(BLUE)Running complete test suite...$(NC)"
	@chmod +x scripts/run_tests.sh
	@./scripts/run_tests.sh

test-gates: check-ghdl $(WORK_DIR) ## Test only gate components
	@echo "$(BLUE)Testing gate components...$(NC)"
	@cd $(WORK_DIR) && \
	if [ -f "../src/gates/or_gate.vhd" ] && [ -f "../test/gates/or_gate_tb.vhd" ]; then \
		$(GHDL) -a ../src/gates/or_gate.vhd && \
		$(GHDL) -a ../test/gates/or_gate_tb.vhd && \
		$(GHDL) -e or_gate_tb && \
		$(GHDL) -r or_gate_tb --stop-time=1ms && \
		echo "$(GREEN)✓ OR Gate test passed$(NC)"; \
	fi

test-combinational: check-ghdl $(WORK_DIR) ## Test combinational logic components
	@echo "$(BLUE)Testing combinational logic components...$(NC)"
	@cd $(WORK_DIR) && \
	if [ -f "../src/combinational/decoders/decoder_2x4.vhd" ] && [ -f "../test/combinational/decoders/decoder_2x4_testbench.vhd" ]; then \
		$(GHDL) -a ../src/combinational/decoders/decoder_2x4.vhd && \
		$(GHDL) -a ../test/combinational/decoders/decoder_2x4_testbench.vhd && \
		$(GHDL) -e decoder_2x4_testbench && \
		$(GHDL) -r decoder_2x4_testbench --stop-time=1ms && \
		echo "$(GREEN)✓ Decoder 2x4 test passed$(NC)"; \
	fi

test-sequential: check-ghdl $(WORK_DIR) ## Test sequential logic components
	@echo "$(BLUE)Testing sequential logic components...$(NC)"
	@cd $(WORK_DIR) && \
	if [ -f "../src/sequential/flip_flops/d_flip_flop.vhd" ] && [ -f "../test/sequential/flip_flops/d_flip_flop_tb.vhd" ]; then \
		$(GHDL) -a ../src/sequential/flip_flops/d_flip_flop.vhd && \
		$(GHDL) -a ../test/sequential/flip_flops/d_flip_flop_tb.vhd && \
		$(GHDL) -e d_flip_flop_tb && \
		$(GHDL) -r d_flip_flop_tb --stop-time=1ms && \
		echo "$(GREEN)✓ D Flip-Flop test passed$(NC)"; \
	fi

build: check-ghdl $(WORK_DIR) ## Compile all VHDL sources (syntax check)
	@echo "$(BLUE)Compiling all VHDL sources...$(NC)"
	@cd $(WORK_DIR) && \
	for file in $$(find ../src -name "*.vhd" | sort); do \
		echo "Compiling $$file..."; \
		$(GHDL) -a $(GHDL_FLAGS) $$file || exit 1; \
	done
	@echo "$(GREEN)✓ All sources compiled successfully$(NC)"

syntax-check: build ## Perform syntax check on all VHDL files

clean: ## Clean build artifacts
	@echo "$(BLUE)Cleaning build artifacts...$(NC)"
	@rm -rf $(WORK_DIR)
	@rm -f *.o
	@rm -f *.cf
	@rm -f *.vcd
	@rm -f work-obj93.cf
	@echo "$(GREEN)✓ Clean completed$(NC)"

list-components: ## List all VHDL components in the project
	@echo "$(BLUE)VHDL Components in Project:$(NC)"
	@echo ""
	@echo "$(YELLOW)Gates:$(NC)"
	@find src/gates -name "*.vhd" 2>/dev/null | sed 's|src/gates/||' | sed 's|\.vhd||' | sort || echo "  None found"
	@echo ""
	@echo "$(YELLOW)Combinational Logic:$(NC)"
	@find src/combinational -name "*.vhd" 2>/dev/null | sed 's|src/combinational/||' | sed 's|\.vhd||' | sort || echo "  None found"
	@echo ""
	@echo "$(YELLOW)Sequential Logic:$(NC)"
	@find src/sequential -name "*.vhd" 2>/dev/null | sed 's|src/sequential/||' | sed 's|\.vhd||' | sort || echo "  None found"

stats: ## Show project statistics
	@echo "$(BLUE)Project Statistics:$(NC)"
	@echo "==================="
	@echo "Total VHDL files: $$(find src -name "*.vhd" | wc -l)"
	@echo "Total test files: $$(find test -name "*.vhd" 2>/dev/null | wc -l || echo 0)"
	@echo "Lines of code: $$(find src -name "*.vhd" -exec wc -l {} + | tail -n1 | awk '{print $$1}')"
	@echo ""
	@echo "$(YELLOW)Files by category:$(NC)"
	@echo "Gates: $$(find src/gates -name "*.vhd" 2>/dev/null | wc -l || echo 0)"
	@echo "Combinational: $$(find src/combinational -name "*.vhd" 2>/dev/null | wc -l || echo 0)"
	@echo "Sequential: $$(find src/sequential -name "*.vhd" 2>/dev/null | wc -l || echo 0)"
	@echo "Modules: $$(find src/modules -name "*.vhd" 2>/dev/null | wc -l || echo 0)"

all: clean build test ## Clean, build, and test everything

# Individual component testing (examples)
test-or-gate: check-ghdl $(WORK_DIR) ## Test OR gate specifically
	@cd $(WORK_DIR) && \
	$(GHDL) -a ../src/gates/or_gate.vhd && \
	$(GHDL) -a ../test/gates/or_gate_tb.vhd && \
	$(GHDL) -e or_gate_tb && \
	$(GHDL) -r or_gate_tb --vcd=or_gate.vcd --stop-time=1ms && \
	echo "$(GREEN)✓ OR Gate test completed (VCD saved)$(NC)"

test-decoder: check-ghdl $(WORK_DIR) ## Test 2x4 decoder specifically
	@cd $(WORK_DIR) && \
	$(GHDL) -a ../src/combinational/decoders/decoder_2x4.vhd && \
	$(GHDL) -a ../test/combinational/decoders/decoder_2x4_testbench.vhd && \
	$(GHDL) -e decoder_2x4_testbench && \
	$(GHDL) -r decoder_2x4_testbench --vcd=decoder_2x4.vcd --stop-time=1ms && \
	echo "$(GREEN)✓ Decoder 2x4 test completed (VCD saved)$(NC)"

test-dff: check-ghdl $(WORK_DIR) ## Test D flip-flop specifically
	@cd $(WORK_DIR) && \
	$(GHDL) -a ../src/sequential/flip_flops/d_flip_flop.vhd && \
	$(GHDL) -a ../test/sequential/flip_flops/d_flip_flop_tb.vhd && \
	$(GHDL) -e d_flip_flop_tb && \
	$(GHDL) -r d_flip_flop_tb --vcd=d_flip_flop.vcd --stop-time=1ms && \
	echo "$(GREEN)✓ D Flip-Flop test completed (VCD saved)$(NC)" 