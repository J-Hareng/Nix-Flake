!#/bin/bash
for f in /sys/class/drm/card*/device/power_dpm_force_performance_level; do
  echo auto | sudo tee $f
done
