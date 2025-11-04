#!/bin/bash
used=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv,noheader)

arr=()
for word in $used; do
  arr+=($word)
done

memory_used=$(printf '%.1f' "$(echo ${arr[2]} / 1024 | bc -l)")

printf '{"text": "%s%s%s"}' "  ${arr[0]}% " "${memory_used}" "G"
