process filter_virsorter2 {
    label 'ubuntu'
    input:
        tuple val(name), path(results)
    output:
        tuple val(name), path("virsorter2_*.txt"), path("granular-map_virsorter2_*.csv")
    shell:
        """
        tail -n+2 *.tsv | awk '\$2>=${params.vs2_filter}' | awk '{ print \$1 }'  > virsorter2_\${PWD##*/}.txt
        tail -n+2 *.tsv | awk '\$2>=${params.vs2_filter}' | awk '{ print \$1, \$2 }' OFS='\t' > granular-map_virsorter2_\${PWD##*/}.csv
        """
}



