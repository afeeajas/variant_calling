# variant_calling
Variants (SNPs and INDELs) calling comprise of a series of steps (scripts). And for the scripts in this repository, samples are aligned to a reference genome. Where possible the scripts stated below tries to improve computational efficiency by paralising jobs. Different steps and scripts to perform variant calling are below.   
### step 1
Run TrimoTrimFilt-copy.sh  # This is to filter the reads and remove reads with low quality score

### step 2
Run screen_mode.sh which calls paralel_alignments.sh #Align reads with reference genome and sort 

### step 3
Run paralizeMergeAndMark.sh which calls mergeAndMergeBAM.sh # Because each samples were genotyped on different lanes, merge will enable samples across lanes for a single individual to be aggreagated

### step 4
Run paralizeGatkHapCall.sh and gatkHapCall.sh ## Call per sample variant

### step 5
Run createDatabase_Gatk.sh # create database of all called per sample variant

### step 6
Run jointVarCal.sh   # this calls the variants
