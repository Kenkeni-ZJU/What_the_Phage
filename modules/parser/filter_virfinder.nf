process filter_virfinder {
    label 'ubuntu'
    input:
        tuple val(name), file(results) 
    output:
        tuple val(name), path("virfinder_*.txt"), path("granular-map_virfinder_*.csv")
    script:
        """
        tail -q -n+2 *.list | awk '\$4>=${params.vf_filter}' | awk '{ print \$2 }' > virfinder_\${PWD##*/}.txt
        tail -q -n+2 *.list | awk '\$4>=${params.vf_filter}' | awk '{ print \$2; \$4}' OFS='\t' > granular-map_virfinder_\${PWD##*/}.csv
        """
}