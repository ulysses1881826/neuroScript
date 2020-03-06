#!/bin/bash

set -e

project=5e44ab0a1eafff87c0f93fe3
datatype="neuro/freesurfer"

#cache the list of datasets that we could download
if [ ! -f all.json ]; then
    bl dataset query --limit 10000 --project $project --datatype $datatype --json > all.json
fi

#enumerate subjects
for subject in $(jq -r '.[].meta.subject' all.json | sort -u)
do
    echo "downloading subject:$subject ---------------"
    mkdir -p MCI_freesurfer_output/$subject/
    ids=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | ._id' all.json)
    for id in $ids
    do
        echo $id
#        tags=$(jq -r '.[] | select(._id=='\"$id\"') | .tags | join(".")' all.json)
        outdir=MCI_freesurfer_output/$subject
        if [ ! -d $outdir ]; then
            bl dataset download $id --directory $outdir
        fi
    done
done
