graph: graph.svg

graph.svg: pollen_its_wrapper/Snakefile
	snakemake \
	-n \
	-s pollen_its_wrapper/Snakefile \
	--cores 8 \
	--dag \
	--forceall \
	--config \
	outdir=out \
	threads=8 \
	bam=data/gt_output/merged.bam \
	vcf=data/filtered.vcf.gz \
	samples_csv=data/samples.csv \
	ref=data/GCF_003254395.2_Amel_HAv3.1_genomic.fna \
 	| grep -v "^[[:space:]+]0" | grep -v "\->[[:space:]]0" \
	| dot -Tsvg \
	> graph.svg

readme: README.rst

README.rst: README.md
	pandoc -f markdown -t rst README.md > README.rst
