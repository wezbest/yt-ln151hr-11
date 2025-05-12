#!/usr/bin/bash
# This bash srcript is for making cast accounts
clear

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'
export NC='\033[0m' # No Color

# --- Global Variables  ---

contracts=(
    "0x3cEbFd06F1c6E372567E9A599b124c137550BdE2"
)

ETHERSCAN_API_KEY="2JEANQYC4C9S6PKDFWNGVT2UER24T32D2M"

networks=(
    "https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
    "https://eth-sepolia.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
)

chainz=(
    "11155111" #sepolia
    "17000"    # holesky
)

# Commands

hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

# Actual cast intefcae function

cast_int() {
    hea1 "Using cast interface to get the interface of a deployed contract"

    local output_file="IContract.sol"

    echo -e "${YELLOW}Fetching interface for contract:${NC} $contract_address"

    # Store the command as a string
    local co1="cast interface \
        -e \"${ETHERSCAN_API_KEY}\" \
        --chain \"${chainz[1]}\" \
        --output \"$output_file\" \
        \"${contracts[0]}\""

    echo -e "${CYAN}Running command:${NC}"
    echo -e "${BLUE}$CMD${NC}"

    # Execute the command
    eval "$co1"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Interface successfully saved to: $output_file${NC}"
        echo -e "${CYAN}--- Interface Content ---${NC}"
        cat "$output_file"
        echo -e "${CYAN}-------------------------${NC}"
    else
        echo -e "${RED}❌ Failed to fetch contract interface.${NC}"
        echo -e "${RED}Make sure the contract is deployed and RPC URL is correct.${NC}"
    fi
}

# Execute Functions
cast_int
