process chromomap_parser {
    publishDir "${params.output}/${name}/annotation_results", mode: 'copy'
    label 'noDocker'

    input:
    tuple val(name), path(positive_contigs_list), path(hmmscan_results), path(prodigal_out)
    path(vogtable)

    output: 
    tuple val(name), path("chromosomefile.tbl"), path("annotationfile.tbl")
    //tuple val(name), path("annotationfile_results.tbl")
    script:
    """
    prepare_hmmscan_for_chromomap.sh -c ${positive_contigs_list} -p ${prodigal_out} -a ${hmmscan_results} -v ${vogtable}
    """
}