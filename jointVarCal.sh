cd /nofish/afeesa/results/ssa03 ## CHANGE DIRECTORY
REF="/nofish/afeesa/data/GCF_905237065.1_Ssal_v3.1_genomic.fna"
gatk="/nofish/ellenw/bin/gatk-4.2.6.1/gatk-package-4.2.6.1-local.jar"
tmpdir="/nofish/afeesa/results/tmp/"
cohort_sample="/nofish/afeesa/results/cohort.sample_map"
vcfpath="/nofish/afeesa/results/vcf_files"

java -jar "-Xmx7G" $gatk \
      GenotypeGVCFs -R $REF -V gendb://my_database -O ${vcfpath}/ssa03.vcf.gz
