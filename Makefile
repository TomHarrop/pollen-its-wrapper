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
	database=data/its1-58024_dada2.fa \
	samples_csv=data/samples.csv \
	its_f=ATGCGATACTTGGTGTGAAT \
	its_r=GACGCTTCTCCAGACTACAAT \
 	| grep -v "^[[:space:]+]0" | grep -v "\->[[:space:]]0" \
	| dot -Tsvg \
	> graph.svg

readme: README.rst

README.rst: README.md
	pandoc -f markdown -t rst README.md > README.rst
