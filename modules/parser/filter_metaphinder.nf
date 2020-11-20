process filter_metaphinder {
    label 'ubuntu'
    input:
        tuple val(name), file(results) 
    output:
        tuple val(name), path("metaphinder_*.txt"), path("granular-map_metaphinder_*.csv")
    script:
        """
        cat *.list | sort -g -k4,4 | tail -n+2 | awk '{if(\$2=="phage" && \$3>${params.mp_filter}){print \$1}}'  > metaphinder_\${PWD##*/}.txt
        cat *.list | sort -g -k4,4 | tail -n+2 | awk '{if(\$2=="phage" && \$3>${params.mp_filter}){print \$1, \$3 }}' OFS='\t' > granular-map_metaphinder_\${PWD##*/}.csv
        """
}
// filter for phage and %Ani >50
process filter_metaphinder_own_DB {
    label 'ubuntu'
    input:
        tuple val(name), file(results) 
    output:
        tuple val(name), path("metaphinder-own-DB_*.txt"), path("granular-map_metaphinder-own-DB_*.csv")
    script:
        """
        cat *.list | sort -g -k4,4 | tail -n+2 | awk '{if(\$2=="phage" && \$3>${params.mp_filter}){print \$1}}'  > metaphinder-own-DB_\${PWD##*/}.txt
        cat *.list | sort -g -k4,4 | tail -n+2 | awk '{if(\$2=="phage" && \$3>${params.mp_filter}){print \$1, \$3 }}' OFS='\t' > granular-map_metaphinder-own-DB_\${PWD##*/}.csv
        """
}