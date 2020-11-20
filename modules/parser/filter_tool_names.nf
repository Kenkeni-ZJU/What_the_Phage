process filter_tool_names {
    publishDir "${params.output}/${name}/identified_contigs_by_tools/", mode: 'copy'
    label 'ubuntu'
    input:
        tuple val(name), file(files), path(granular)
    output:
        tuple val(name), file("*.txt"), path("*.csv")
    script:
        """
        # simplify toolnames for R (its a quick fix for now)
          for x in *.txt; do
            filename_simple=\$(echo "\${x}" | cut -f 1 -d "_")
            mv \${x} \${filename_simple}.txt
          done

        # simplify for granular map
        for y in *.csv ;do 
          simplename2=\$(echo "\$y" | cut -f 2 -d "_" );
          mv \$y \${simplename2}.csv ; done
        """
}