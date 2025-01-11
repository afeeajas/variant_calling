cd /nofish/afeesa/results/ssa09 ## CHANGE "ssa" DIRECTORY
REF="/nofish/afeesa/data/GCF_905237065.1_Ssal_v3.1_genomic.fna"
gatk="/nofish/ellenw/bin/gatk-4.2.6.1/gatk-package-4.2.6.1-local.jar"
tmpdir="/nofish/afeesa/results/tmp"
cohort_sample="/nofish/afeesa/results/cohort.sample_map"
chr="NC_059450.1" ### CHANGE CHR NAME

java -jar "-Xmx7G" $gatk \
       GenomicsDBImport \
       --genomicsdb-workspace-path my_database \
       --batch-size 50 --tmp-dir $tmpdir \
       -L $chr \
       --sample-name-map $cohort_sample \
       --reader-threads 5
  


# NC_059446.1	ssa05
# NC_059447.1	ssa06
# NC_059448.1	ssa07
# NC_059449.1	ssa08
# NC_059450.1	ssa09


# NC_059451.1	ssa10
# NC_059452.1	ssa11
# NC_059454.1	ssa13
# NC_059455.1	ssa14
# NC_059456.1	ssa15
# NC_059457.1	ssa16
# NC_059458.1	ssa17
# NC_059459.1	ssa18
# NC_059460.1	ssa19
# NC_059461.1	ssa20
# NC_059462.1	ssa21
# NC_059463.1	ssa22
# NC_059464.1	ssa23
# NC_059465.1	ssa24
# NC_059466.1	ssa25
# NC_059467.1	ssa26
# NC_059468.1	ssa27
# NC_059469.1	ssa28
# NC_059470.1	ssa29
