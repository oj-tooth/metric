#!/usr/bin/env bash
GLOBIGNORE="*"
# ------------------------------------------------------------------------------
# run_metric_SAMBA_eORCA1.sh
# 
# Description: Script to run METRIC SAMBA 34.5S AMOC diagnostic for eORCA1
# Near-Present Day (NPD) simulation.
#
# Created By: Ollie Tooth (oliver.tooth@noc.ac.uk)
#
# Created On: 2024-11-19
# ------------------------------------------------------------------------------

# -- Input arguments to ./run_metric -- #
# Filepaths to config file:
fpath_config=/dssgfs01/working/otooth/Diagnostics/metric/configs/npd/eORCA1/config_SAMBA_eORCA1.ini
# Filepaths to eORCA1 monthly mean output files:
fpath_T="/dssgfs01/working/otooth/data/eORCA1_ERA5/eORCA1_ERA5_1m_grid_T*.nc"
fpath_V="/dssgfs01/working/otooth/data/eORCA1_ERA5/eORCA1_ERA5_1m_grid_V*.nc"
fpath_U="/dssgfs01/working/otooth/data/eORCA1_ERA5/eORCA1_ERA5_1m_grid_U*.nc"

# -- Python Environment -- #
# Activate miniconda environment:
source /home/otooth/miniconda3/etc/profile.d/conda.sh
conda activate env_metric

# -- Run METRIC -- #
echo "In Progress: Calculating SAMBA 34.5S AMOC Diagnostics..."

# Move to metric directory:
cd /dssgfs01/working/otooth/Diagnostics/metric
# Call metric script:
./run_metric.py -c $fpath_config -t $fpath_T -s $fpath_T -v $fpath_V -ssh $fpath_T -taux $fpath_U

echo "Completed: Calculated SAMBA 34.5S AMOC Diagnostics."
