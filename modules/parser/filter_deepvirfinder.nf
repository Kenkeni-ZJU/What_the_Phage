process filter_deepvirfinder {
    label 'ubuntu'
    input:
        tuple val(name), file(results) 
    output:
        tuple val(name), file("deepvirfinder_*.txt"), path("granular-map_deepvirfinder_*.csv")
    shell:
        """
        tail -n+2 *.list | sort -g  -k4,4  | awk '\$3>=${params.dv_filter}' | awk -F "," '{ print \$1 }'  > deepvirfinder_\${PWD##*/}.txt
        tail -n+2 *.list | sort -g  -k4,4  | awk '\$3>=${params.dv_filter}' | awk '{ print \$1, \$3 }' OFS='\t' > granular-map_deepvirfinder_\${PWD##*/}.csv
        """
}