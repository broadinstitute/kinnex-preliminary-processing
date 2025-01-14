version 1.0

import "tasks/pbtools.wdl" as PB

workflow masseq_longread_demux_main {
    input{
        File input_bam
        String? sample_id
        File bulk_barcodes_fasta
        String gcs_output_dir
        String dataset_name
        File biosample_csv

        # Optional:
        Int num_threads = 16

    }
    call PB.LimaLongRead{
        input:
            skera_bam               = input_bam,
            sample_id               = sample_id,
            bulk_barcodes_fasta     = bulk_barcodes_fasta,
            biosample_csv           = biosample_csv,
            dataset_name            = dataset_name,
            num_threads             = num_threads,
            gcs_output_dir          = gcs_output_dir
    }
    output{
        String lima_out     = LimaLongRead.lima_out
    }
}