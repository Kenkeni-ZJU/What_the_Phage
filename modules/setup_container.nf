process setup_container {
        label 'noContainer'
        def slash = "/"
        def cachdirloc = workflow.launchDir + slash + params.cachedir
        println cachdirloc
        println slash
    input:
        file(config_file)
    output:
        file("everything_done.txt")
    script:
        if (workflow.profile.contains('docker')) 
        """        
        download_docker.sh ${config_file}

        touch everything_done.txt
        """
        else if (workflow.profile.contains('singularity'))
        
        """
        download_singularity.sh ${config_file} ${workflow.launchDir}/${params.cachedir} 

        touch everything_done.txt
        """
}