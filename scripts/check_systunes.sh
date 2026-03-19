#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "--- [ archstrix System Tunes Audit ] ---"

# 1. Check ntsync (Gaming with WINE/Proton)
if [ -e /dev/ntsync ]; then
    echo -e "[${GREEN}OK${NC}] ntsync module loaded (/dev/ntsync exists)"
else
    echo -e "[${RED}FAIL${NC}] ntsync module NOT found"
fi

# 2. Check zRAM (Memory)
ZRAM_ALGO=$(cat /sys/block/zram0/comp_algorithm 2>/dev/null | grep -o '\[zstd\]')
if [[ "$ZRAM_ALGO" == "[zstd]" ]]; then
    echo -e "[${GREEN}OK${NC}] zRAM active with zstd compression"
    zramctl --output NAME,DISKSIZE,DATA,COMPR,ALGO
else
    echo -e "[${RED}FAIL${NC}] zRAM not active or not using zstd"
fi

# 3. Check Watchdogs (Latency)
WATCHDOG=$(lsmod | grep -E "iTCO_wdt|sp5100_tco")
if [ -z "$WATCHDOG" ]; then
    echo -e "[${GREEN}OK${NC}] Watchdog timers are successfully blacklisted"
else
    echo -e "[${RED}FAIL${NC}] Watchdogs still active: $WATCHDOG"
fi

# 4. Check NVIDIA PAT (GPU)
if grep -q "UsePageAttributeTable: 1" /proc/driver/nvidia/params 2>/dev/null; then
    echo -e "[${GREEN}OK${NC}] NVIDIA PAT (Page Attribute Table) is ENABLED"
else
    echo -e "[${RED}FAIL${NC}] NVIDIA PAT is DISABLED or driver not loaded"
fi

# 5. Check DNS (Networking)
DNS_SERVER=$(resolvectl status | grep "Current DNS Server" | awk '{print $NF}')
echo -e "[INFO] Active DNS Server: ${GREEN}$DNS_SERVER${NC}"

echo "----------------------------------------"
