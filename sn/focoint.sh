#!/usr/bin/bash
# This bash srcript is for installing the KL docker image here
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

# Commands

hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

######### Foundry Executions ############

# Declare the rpc and key arrays
rpcz=(
    "https://eth-sepolia.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
    "https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
)
keyz=(
    "0x953d1aa8fae6d88b5df924bb68de806142527764160ede872925502a525bfad5"
    "0x425efe93a001f2a36fc824dc0418ccf9265c6373d64f57f6a06f1eb9751cef38"

)
accz=(
    "0xA465600233997C758744d21ec8Bd0F5E84340e19"
    "0xAEcb6c012fa8E3947E8Ee76F4a4e06cC1410B6c9"

)
ETHERSCAN_API_KEY="2JEANQYC4C9S6PKDFWNGVT2UER24T32D2M"

###############################################
# Forge interact
################################################

CONTRACT_PATH_SCRIPT="script/Counter.s.sol:CoInInt"

fo_script_interact_holeksy() {
    hea1 "Forge script interact with contract"

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    LOG_FILE="logs/interact_script_holesky_${TIMESTAMP}.log"

    mkdir -p logs

    echo -e "██╗  ██╗  ██████╗  ██╗      ███████╗ ███████╗ ██╗  ██╗ ██╗   ██╗"
    echo -e "██║  ██║ ██╔═══██╗ ██║      ██╔════╝ ██╔════╝ ██║ ██╔╝ ╚██╗ ██╔╝"
    echo -e "███████║ ██║   ██║ ██║      █████╗   ███████╗ █████╔╝   ╚████╔╝ "
    echo -e "██╔══██║ ██║   ██║ ██║      ██╔══╝   ╚════██║ ██╔═██╗    ╚██╔╝  "
    echo -e "██║  ██║ ╚██████╔╝ ███████╗ ███████╗ ███████║ ██║  ██╗    ██║   "
    echo -e "╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝    ╚═╝   "

    CO1="forge script ${CONTRACT_PATH_SCRIPT} \
        --rpc-url ${rpcz[1]} \
        --private-key ${keyz[0]} \
        --etherscan-api-key ${ETHERSCAN_API_KEY} \
        --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

fo_script_interact_sepolia() {
    hea1 "Foundry Script - One of contract deployment"

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    LOG_FILE="logs/interact_script_sepolia_${TIMESTAMP}.log"

    mkdir -p logs

    echo -e "███████╗ ███████╗ ██████╗   ██████╗  ██╗      ██╗  █████╗ "
    echo -e "██╔════╝ ██╔════╝ ██╔══██╗ ██╔═══██╗ ██║      ██║ ██╔══██╗"
    echo -e "███████╗ █████╗   ██████╔╝ ██║   ██║ ██║      ██║ ███████║"
    echo -e "╚════██║ ██╔══╝   ██╔═══╝  ██║   ██║ ██║      ██║ ██╔══██║"
    echo -e "███████║ ███████╗ ██║      ╚██████╔╝ ███████╗ ██║ ██║  ██║"
    echo -e "╚══════╝ ╚══════╝ ╚═╝       ╚═════╝  ╚══════╝ ╚═╝ ╚═╝  ╚═╝"

    CO1="forge script ${CONTRACT_PATH_SCRIPT} \
        --rpc-url ${rpcz[0]} \
        --private-key ${keyz[0]} \
        --etherscan-api-key ${ETHERSCAN_API_KEY} \
        --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

fo_script_interact_anvil() {
    hea1 "Foundry Script - One of contract deployment"

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    LOG_FILE="logs/interact_script_anvil_${TIMESTAMP}.log"

    mkdir -p logs

    echo -e " █████╗  ███╗   ██╗ ██╗   ██╗ ██╗ ██╗     "
    echo -e "██╔══██╗ ████╗  ██║ ██║   ██║ ██║ ██║     "
    echo -e "███████║ ██╔██╗ ██║ ██║   ██║ ██║ ██║     "
    echo -e "██╔══██║ ██║╚██╗██║ ╚██╗ ██╔╝ ██║ ██║     "
    echo -e "██║  ██║ ██║ ╚████║  ╚████╔╝  ██║ ███████╗"
    echo -e "╚═╝  ╚═╝ ╚═╝  ╚═══╝   ╚═══╝   ╚═╝ ╚══════╝"

    ANVIL_RPC="127.0.0.1:8545"
    ANVIL_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"

    CO1="forge script ${CONTRACT_PATH_SCRIPT} \
        --rpc-url ${ANVIL_RPC} \
        --private-key ${ANVIL_KEY} \
        --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

fo_script_anvil_simulate() {
    hea1 "Foundry Script - One of contract deployment"

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    LOG_FILE="logs/interact_avil_simulate_${TIMESTAMP}.log"

    mkdir -p logs

    echo -e " █████╗  ███╗   ██╗ ██╗   ██╗ ██╗ ██╗     "
    echo -e "██╔══██╗ ████╗  ██║ ██║   ██║ ██║ ██║     "
    echo -e "███████║ ██╔██╗ ██║ ██║   ██║ ██║ ██║     "
    echo -e "██╔══██║ ██║╚██╗██║ ╚██╗ ██╔╝ ██║ ██║     "
    echo -e "██║  ██║ ██║ ╚████║  ╚████╔╝  ██║ ███████╗"
    echo -e "╚═╝  ╚═╝ ╚═╝  ╚═══╝   ╚═══╝   ╚═╝ ╚══════╝"

    CO1="forge script ${CONTRACT_PATH_SCRIPT} \
        --simulate \
        --out outz/ "

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

###############################################
# Manual
################################################

main_menu() {
    echo -e "${CYAN}┌──────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│${NC}       ${PURPLE}🔥 Foundry Launcher Menu 🔥 ${CYAN}${NC}"
    echo -e "${CYAN}├──────────────────────────────────────────┤${NC}"
    echo -e "${CYAN}│${NC}  ${GREEN}1)${NC} ${WHITE}Interact Script Deploy on ${BLUE}Holesky${WHITE}         ${CYAN}${NC}"
    echo -e "${CYAN}│${NC}  ${GREEN}2)${NC} ${WHITE}Intearct Script Deploy on ${BLUE}Sepolia${WHITE}         ${CYAN}${NC}"
    echo -e "${CYAN}│${NC}  ${GREEN}3)${NC} ${WHITE}Interact Script Deploy on ${BLUE}Anvil${WHITE}         ${CYAN}${NC}"
    echo -e "${CYAN}│${NC}  ${GREEN}4)${NC} ${WHITE}Simulate Deploy on ${BLUE}Anvil${WHITE}         ${CYAN}${NC}"
    echo -e "${CYAN}│${NC}  ${RED}0)${NC} ${WHITE}Exit                                              ${CYAN}${NC}"
    echo -e "${CYAN}└──────────────────────────────────────────┘${NC}"

    echo -ne "${YELLOW}Enter your choice [0-7]: ${NC}"
    read choice

    case $choice in
    1) fo_script_interact_holeksy ;;
    2) fo_script_interact_sepolia ;;
    3) fo_script_interact_anvil ;;
    4) fo_script_anvil_simulate ;;
    0)
        echo -e "${GREEN}👋 Exiting. Have a productive dev sesh!${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}❌ Invalid choice. Try again.${NC}"
        exit 1
        ;;
    esac
}

# Run it
main_menu
