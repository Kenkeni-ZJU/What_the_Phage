process filter_PPRmeta {
    label 'ubuntu'
    input:
        tuple val(name), file(results) 
    output:
        tuple val(name), path("PPRmeta_*.txt"), path("granular-map_PPRmeta_*.csv") 
    script:
        """
        cat *.csv | grep -v "Header,Length,phage_score," | grep ',phage\$' | cut -d ',' -f1 > PPRmeta_\${PWD##*/}.txt
        cat *.csv | grep -v "Header,Length,phage_score," | grep ',phage\$' | cut -d ',' -f1,3 > granular-map_PPRmeta_\${PWD##*/}.csv
        """
}